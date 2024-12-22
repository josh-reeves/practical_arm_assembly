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
            let content = this.innerHTML;
    
            this.innerHTML =
            `
            <header class="page-header">
                <div class="left">
                <img src="/practical_arm_assembly/assets/icons/icon_cpu_001_fill_003.svg" width=48/>
                    <h1>Practical ARM Assembly</h1>
                    <!--<br>
                    <p>A collection of documents, notes and other material created to accompany the <a href="https://github.com/josh-reeves/practical_arm_assembly">Practical Arm Assembly</a> repository.</p>-->
                    ${content}   
                </div>
                <div class="right">
                    <input type="text" value="Search"></input>
                </div>
            </header>
            `;
    
        }
    
    });