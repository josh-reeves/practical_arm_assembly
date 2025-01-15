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
            const styleSheetPath = "/practical_arm_assembly/assets/styles/copy-button.css"
            
            var frame = document.createElement("div");
            var button = document.createElement("div");

            if (!document.getElementById(styleSheetID))
                document.head.append(createStyleSheet(styleSheetPath, styleSheetID));

            frame.classList.add("floating-frame")
            frame.appendChild(button);

            button.classList.add("copy-button");
            button.addEventListener("click", this.copy)
 
            this.appendChild(frame);

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