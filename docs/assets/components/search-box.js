import { stupidSearch } from "../scripts/stupidSearch.js";

customElements.define(
    "search-box",
    class SearchBox extends HTMLElement
    {
        constructor()
        {
            super();
            

        }
        
        connectedCallback()
        {
            var placeholder = this.getAttribute("placeholder");

            this.innerHTML =
                `
                    <div id="search-box" part="box">
                        <input id="search-input" type="text" placeholder="${placeholder}"></input>
                        <img id="search-button"></img>
                    </div>

                `;


            setTimeout(() =>
                {
                    document.getElementById("search-button").addEventListener("click", ()=>
                    {
                        var searchText = document.getElementById("search-input").value;
                        this.search(searchText);

                    });
                    
                });

        }

        search(searchText)
        {

            var searchResults = document.createElement("div");

            stupidSearch(searchText).then((response) =>
                {
                    console.log(response);

                    response.forEach((result) =>
                    {
                        var link = document.createElement("a");

                        link.setAttribute("href", result);
                        link.innerText = result;

                        searchResults.append(link);
                        searchResults.append(document.createElement("br"));

                    });

                });
                
                var bounds = this.getBoundingClientRect();

                console.log(bounds);

                searchResults.setAttribute(
                    "style",
                    `
                        position: fixed;
                        top: ${bounds.bottom}px;
                        left: ${bounds.left}px;
                        width: ${bounds.width}px;
                        max-height: 300px;
                        display: inline;
                        background-color: white;
                        overflow-y: auto;
                        border-radius: 5px;
                        box-shadow: 0px 1px 2px;
                        margin-top: 10px;
                        margin-left: -10px;
                        padding: 5px 10px 15px 10px;
                        line-height: 2;
        
                    `);
        
            document.body.appendChild(searchResults);

            function exit(event)
            {
                if (event.type == "resize")
                {
                    document.body.removeChild(searchResults);

                    return;

                }

                if (event.target != searchResults)
                    document.body.removeChild(searchResults);

            }

            window.addEventListener("mouseup", exit);
            window.addEventListener("resize", exit);

            var config = { attributes: true, childList: true, subtree: true };
            
            var observer = new MutationObserver((mutationList, observer) =>
                {
                    mutationList.forEach((mutation) => 
                    {
                        if (mutation.removedNodes[0] === searchResults)
                        {
                            window.removeEventListener("mouseup", exit);
                            window.removeEventListener("resize", exit);

                        }
                            
                    });
    
                });

            observer.observe(document.body, config);

        }
        
    });