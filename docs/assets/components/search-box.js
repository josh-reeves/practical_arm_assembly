import { stupidSearch } from "../scripts/stupidSearch.js";
import { createStyleSheet } from "../scripts/createStyleSheet.js";

class SearchBox extends HTMLElement
{
    //#region Private Fields
    #observer;
    #observerConfig;

    //#endregion
    
    //#region Constructor
    constructor()
    {
        super();
        
        this.#observer = new MutationObserver((mutationList, observer) =>
            {
                mutationList.forEach((mutation) => 
                {
                    if (mutation.removedNodes[0] === document.getElementById("search-results"))
                    {
                        window.removeEventListener("mouseup", this.#exit);
                        window.removeEventListener("resize", this.#exit);

                    }
                        
                });

            });

        this.#observerConfig = { attributes: true, childList: true, subtree: true };
        
        this.#observer.observe(document.body, this.#observerConfig);

    }

    //#endregion

    //#region Methods
    connectedCallback()
    {
        const styleSheetID = "search-box-styles";
        const styleSheetPath = "/practical_arm_assembly/assets/styles/search-box.css";

        if (!document.getElementById(styleSheetID))
            document.head.appendChild(createStyleSheet(styleSheetPath, styleSheetID));

        var searchContainer = document.createElement("div");
        searchContainer.id = "search-box";
        
        var searchInput = document.createElement("input");
        searchInput.id = "search-input";
        searchInput.placeholder = this.getAttribute("placeholder");

        var searchButton = document.createElement("img");
        searchButton.id = "search-button";

        searchContainer.append(searchInput, searchButton);

        this.appendChild(searchContainer);

        searchButton.addEventListener("click", ()=>
            {
                var searchText = searchInput.value;

                this.search(searchText);

            });

    }

    search(searchText)
    {
        if (document.getElementById("search-results"))
            document.body.removeChild(document.getElementById("search-results"));

        var searchResults = document.createElement("div");
        searchResults.id = "search-results";
        
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

        if (!document.getElementById("backdrop"))
        {
            var backdrop = document.createElement("div");
            backdrop.id = "backdrop";
            backdrop.setAttribute("height", "10px");

            document.body.appendChild(backdrop);

        }

        document.body.appendChild(searchResults);

        window.addEventListener("mouseup", this.#exit);
        window.addEventListener("resize", this.#exit);

    }

    #exit(event)
    {
        if (event.type == "resize")
        {
            document.body.removeChild(document.getElementById("search-results"));
            document.body.removeChild(document.getElementById("backdrop"));

            return;

        }

        if (!document.getElementById("search-results").contains(event.target) && !document.getElementById("search-box").contains(event.target))
        {
            document.body.removeChild(document.getElementById("search-results"));
            document.body.removeChild(document.getElementById("backdrop"));

        }

    }

    //#endregion

}

customElements.define("search-box", SearchBox);
