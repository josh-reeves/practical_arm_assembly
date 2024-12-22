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
            <script async src="https://cse.google.com/cse?cx=13c0a50285ac94457"></script>
                <div class="left ">
                <img src="/practical_arm_assembly/assets/icons/icon_cpu_001_fill_003.svg" width=48/>
                    <h1>Practical ARM Assembly</h1>
                </div>
                <div class="right">
                <form>
                    <input id="search" type="text" value="Search"></input>
                <form>
                </div>
            </header>
            `;
    
        }
    
    });