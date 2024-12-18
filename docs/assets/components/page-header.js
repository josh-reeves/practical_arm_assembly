customElements.define(
    "page-header", 
    class extends HTMLElement
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
                    <div class="vertical-center">
                        <h1>Practical ARM Assembly</h1>
                        <br>
                        <p>A collection of documents, notes and other material created to accompany the <a href="https://github.com/josh-reeves/practical_arm_assembly">Practical Arm Assembly</a> repository.</p>
                        ${content}   
                    </div>
                </header>
            `;

        }

    });