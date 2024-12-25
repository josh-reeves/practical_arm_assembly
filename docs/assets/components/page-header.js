import { stupidSearch } from "./stupidSearch.js";

customElements.define(
    "page-header", 
    class PageHeader extends HTMLElement
    {
        constructor() 
        {
            super();

    
        }
    
        connectedCallback()
        {    
            this.innerHTML =
                `
                    <header class="page-header">
                        <div class="left ">
                        <img src="/practical_arm_assembly/assets/icons/icon_cpu_001_fill_003.svg" width=48/>
                            <h1>Practical ARM Assembly</h1>
                        </div>
                        <div class="right">
                        <form id="search">
                            <input id="search-box" type="text" placeholder="Search">
                            <img id="search-button" src="/practical_arm_assembly/assets/icons/icon_search_001_outline_001.svg"></img>
                        <form>
                        </div>
                    </header>
                `;

            setTimeout(
                () =>
                {
                    document.getElementById("search-button").addEventListener("click", ()=>
                    {
                        var searchText = document.getElementById("search-box").value;
                        stupidSearch(searchText);

                    });
                    
                }

            );

        }
    
    }

);