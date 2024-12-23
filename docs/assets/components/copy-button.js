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
           navigator.clipboard.writeText(document.getElementById(this.getAttribute("target")).innerText);

        }

        
    });