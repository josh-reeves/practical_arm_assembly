import { notification } from "./notification.js";
import { createStyleSheet } from "../scripts/createStyleSheet.js";

customElements.define("copy-button",
    class CopyButton extends HTMLElement
    {
        constructor()
        {
            super();

        }

        connectedCallback()
        {
            const styleSheetID = "copy-button-styles";
            
            if (!document.getElementById(styleSheetID))
                document.head.append(createStyleSheet("/practical_arm_assembly/assets/styles/copy-button.css", styleSheetID));

            this.addEventListener("click", this.copy)
    
        }

        copy() 
        {
            var message = "Text copied to clipboard!";
            var duration = 1250;

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

            notification(message, duration);

            return;

        }

    });