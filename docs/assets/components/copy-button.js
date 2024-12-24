import { notification } from "./notification.js";

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
            
            try
            {
                while (element.innerText == '')
                    element = element.parentElement;

                navigator.clipboard.writeText(element.innerText);

            }
            catch(err)
            {
                console.log("Error: " + err);

            }

            notification("Text copied to clipboard.", 1500, "notification");

            return;

        }

    });