import "./search-box.js";

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
                        <search-box placeholder="Search"></search-box>
                    </header>
                `;

        }
    
    }

);