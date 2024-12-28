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
            var styleSheet = document.createElement("link");
            styleSheet.rel = "stylesheet";
            styleSheet.type = "text/css";
            styleSheet.href = "/practical_arm_assembly/assets/styles/search-box.css";

            document.head.appendChild(styleSheet);

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
            var backdrop = document.createElement("div");
            searchResults.id = "search-results";
            backdrop.id = "backdrop";
            backdrop.setAttribute("height", "10px");
            
            stupidSearch(searchText).then((response) =>
                {
                    console.log(response);

                    if (response.length <= 0)
                    {
                        var emptyMsg = document.createElement("p");
                        emptyMsg.innerText = "No results found :(";

                        searchResults.append(emptyMsg);

                        return;

                    }

                    response.forEach((result) =>
                    {
                        var link = document.createElement("a");

                        link.setAttribute("href", result);
                        link.innerText = result;

                        searchResults.append(link);
                        searchResults.append(document.createElement("br"));

                    });

                });

            document.body.appendChild(backdrop);
            document.body.appendChild(searchResults);

            function exit(event)
            {
                if (event.type == "resize")
                {
                    document.body.removeChild(searchResults);
                    document.body.removeChild(backdrop);

                    return;

                }

                if (!searchResults.contains(event.target))
                {
                    document.body.removeChild(searchResults);
                    document.body.removeChild(backdrop);

                }

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