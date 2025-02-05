import { createStyleSheet } from "../scripts/createStyleSheet.js";

function createMenuItem(displayText, onClick = null, id = null, className = null)
{
    var menuItem = document.createElement("div");
    var itemText = document.createElement("p");

    if (id != null)
        menuItem.id = null;

    if (onClick != null)
        menuItem.addEventListener("click", onClick);

    menuItem.classList.add(className);
    
    itemText.innerText = displayText;

    menuItem.appendChild(itemText);

    return menuItem;

}

class NavMenu extends HTMLElement
{
    //#region Constructor
    constructor()
    {
        super();

    }

    //#endregion

    //#region Methods
    connectedCallback()
    {
        const styleSheetID = "nav-menu-styles";
        const styleSheetPath = "/practical_arm_assembly/assets/styles/nav-menu.css";

        if (!document.getElementById(styleSheetID))
            document.head.append(createStyleSheet(styleSheetPath, styleSheetID));

        this.innerHTML =
        `
            <div class="menu-container">
                <div class="menu-item" onclick="window.location.href='/practical_arm_assembly/index.html'">
                    <p>About</p>
                </div>
                <div class="menu-item collapsible" onclick="toggleStyle('submenu-item', 'submenu-item-hidden', 'lessons')">
                    <p>Notes</p>
                </div>  
                    <div class="sliding-panel" id="lessons">
                        <div class="submenu-item-hidden" onclick="window.location.href='/practical_arm_assembly/pages/lessons/introduction/introduction.html'">
                            <p>Introduction</p>
                        </div>                        
                        <div class="submenu-item-hidden" onclick="window.location.href='/practical_arm_assembly/pages/lessons/lesson-01/lesson-01.html'">
                            <p>Section 01: Fundamentals</p>
                        </div>
                        <div class="submenu-item-hidden" onclick="window.location.href='/practical_arm_assembly/pages/lessons/lesson-02/lesson-02.html'">
                            <p>Section 02: Arithmetic Operations</p>
                        </div>
                        <div class="submenu-item-hidden" onclick="window.location.href='/practical_arm_assembly/pages/lessons/lesson-03/lesson-03.html'">
                            <p>Section 03: The PC Register</p>
                        </div>
                        <div class="submenu-item-hidden" onclick="window.location.href='/practical_arm_assembly/pages/lessons/lesson-03/lesson-03.html'">
                            <p>Section 04: Logical Operators</p>
                        </div>
                        <div class="submenu-item-hidden" onclick="window.location.href='/practical_arm_assembly/pages/lessons/lesson-04/lesson-04.html'">
                            <p>Section 05: Signed Number Conversion</p>
                        </div>
                        <div class="submenu-item-hidden" onclick="window.location.href='/practical_arm_assembly/pages/lessons/lesson-05/lesson-05.html'">
                            <p>Section 06: Shift and Rotate</p>
                        </div>
                        <div class="submenu-item-hidden" onclick="window.location.href='/practical_arm_assembly/pages/lessons/lesson-06/lesson-06.html'">
                            <p>Section 07: The CPSR</p>
                        </div>
                        <div class="submenu-item-hidden" onclick="window.location.href='/practical_arm_assembly/pages/lessons/lesson-07/lesson-07.html'">
                            <p>Section 08: CMP</p>
                        </div>
                        <div class="submenu-item-hidden" onclick="window.location.href='/practical_arm_assembly/pages/lessons/lesson-08/lesson-08.html'">
                            <p>Section 09: Branching</p>
                        </div>
                        <div class="submenu-item-hidden" onclick="window.location.href='/practical_arm_assembly/pages/lessons/lesson-09/lesson-09.html'">
                            <p>Section 10: While Loops</p>
                        </div>
                        <div class="submenu-item-hidden" onclick="window.location.href='/practical_arm_assembly/pages/lessons/lesson-10/lesson-10.html'">
                            <p>Section 11: Function Calls</p>
                        </div>
                        <div class="submenu-item-hidden" onclick="window.location.href='/practical_arm_assembly/pages/lessons/lesson-11/lesson-11.html'">
                            <p>Section 12: LDR and STR</p>
                        </div>
                        <div class="submenu-item-hidden" onclick="window.location.href='/practical_arm_assembly/pages/lessons/lesson-12/lesson-12.html'">
                            <p>Section 13: Stack Operations</p>
                        </div>
                        <div class="submenu-item-hidden" onclick="window.location.href='/practical_arm_assembly/pages/lessons/lesson-13/lesson-13.html'">
                            <p>Section 14: Push and Pop</p>
                        </div>
                        <div class="submenu-item-hidden" onclick="window.location.href='/practical_arm_assembly/pages/lessons/lesson-14/lesson-14.html'">
                            <p>Section 15: Hello World!</p>
                        </div>
                    </div>
                <div class="menu-item">
                    <p>Resources</p>
                </div>
                <div class="menu-item">
                    <p>Miscellaneous</p>
                </div>
            </div>
        `;

    }

    //#endregion

}

customElements.define("nav-menu", NavMenu);

