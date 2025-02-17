import { createStyleSheet } from "../scripts/createStyleSheet.js";

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
            const styleSheetID = "nav-button-styles";
            const styleSheetPath = "/practical_arm_assembly/assets/styles/nav-button.css"

            if (!document.getElementById(styleSheetID))
                document.head.prepend(createStyleSheet(styleSheetPath, styleSheetID));

            var button = document.createElement("button");
            
            button.classList.add("nav-button");

            button.innerText = this.innerText;
            this.innerText = null;

            this.appendChild(button);

            this.addEventListener("click", () => 
                {
                    window.location.href = this.getAttribute("href");

                }

            )

        }

    }

)