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
            <header style="margin: 0px;">
                <div class="vertical-center" style="text-align: center; color: #FAFAFA;">
                    <h1>Practical ARM Assembly</h1>
                    <p>A collection of documents, notes and other material created to accompany the <a href="https://github.com/josh-reeves/practical_arm_assembly">Practical Arm Assembly</a> repository.</p>
                </div>
            </header>
        `;

    }

}

customElements.define("page-header", PageHeader);