customElements.define("copy-button",
    class CopyButton extends HTMLElement
    {
        constructor()
        {
            super();

        }

        connectedCallback()
        {
            this.addEventListener("click", this.copy)

        }

        copy = function() 
        {
            if (document.getElementById(this.getAttribute("target")) != null)
            {
                navigator.clipboard.writeText(document.getElementById(this.getAttribute("target")).innerText);

                return;

            }

            var element = this.parentElement;
            
            while (element.innerText == null)
                element = element.parentElement;

            navigator.clipboard.writeText(element.innerText);

            return;

        }

    });