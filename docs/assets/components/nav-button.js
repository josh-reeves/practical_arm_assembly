customElements.define(
    "nav-button",
    class extends HTMLElement
    {
        constructor()
        {
            super();

        }

        connectedCallback()
        {
            this.addEventListener(
                "click", 
                function() 
                {
                    window.location.href = this.getAttribute("href");

                }

            )

        }

    }

)