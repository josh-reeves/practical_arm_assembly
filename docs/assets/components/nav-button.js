customElements.define(
    "nav-button",
    class NavButton extends HTMLElement
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