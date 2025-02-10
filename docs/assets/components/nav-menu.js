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
                        <div class="submenu-item-hidden" onclick="window.location.href='/practical_arm_assembly/pages/notes/introduction/introduction.html'">
                            <p>Introduction</p>
                        </div>                        
                        <div class="submenu-item-hidden" onclick="window.location.href='/practical_arm_assembly/pages/notes/section-01/mov-and-svc.html'">
                            <p>Section 01: Fundamentals</p>
                        </div>
                        <div class="submenu-item-hidden" onclick="window.location.href='/practical_arm_assembly/pages/notes/section-02/arithmetic-operations.html'">
                            <p>Section 02: Arithmetic Operations</p>
                        </div>
                        <div class="submenu-item-hidden" onclick="window.location.href='/practical_arm_assembly/pages/notes/section-03/pc-register.html'">
                            <p>Section 03: The PC Register</p>
                        </div>
                        <div class="submenu-item-hidden" onclick="window.location.href='/practical_arm_assembly/pages/notes/section-04/logical-operators.html'">
                            <p>Section 04: Logical Operators</p>
                        </div>
                        <div class="submenu-item-hidden" onclick="window.location.href='/practical_arm_assembly/pages/notes/section-05/signed-number-conversion.html'">
                            <p>Section 05: Signed Number Conversion</p>
                        </div>
                        <div class="submenu-item-hidden" onclick="window.location.href='/practical_arm_assembly/pages/notes/section-06/shift-and-rotate.html'">
                            <p>Section 06: Shift and Rotate</p>
                        </div>
                        <div class="submenu-item-hidden" onclick="window.location.href='/practical_arm_assembly/pages/notes/section-07/cpsr.html'">
                            <p>Section 07: The CPSR</p>
                        </div>
                        <div class="submenu-item-hidden" onclick="window.location.href='/practical_arm_assembly/pages/notes/section-08/cmp.html'">
                            <p>Section 08: CMP</p>
                        </div>
                        <div class="submenu-item-hidden" onclick="window.location.href='/practical_arm_assembly/pages/notes/section-09/branching.html'">
                            <p>Section 09: Branching</p>
                        </div>
                        <div class="submenu-item-hidden" onclick="window.location.href='/practical_arm_assembly/pages/notes/section-10/while-loops.html'">
                            <p>Section 10: While Loops</p>
                        </div>
                        <div class="submenu-item-hidden" onclick="window.location.href='/practical_arm_assembly/pages/notes/section-11/function-calls.html'">
                            <p>Section 11: Function Calls</p>
                        </div>
                        <div class="submenu-item-hidden" onclick="window.location.href='/practical_arm_assembly/pages/notes/section-12/ldr-and-str.html'">
                            <p>Section 12: LDR and STR</p>
                        </div>
                        <div class="submenu-item-hidden" onclick="window.location.href='/practical_arm_assembly/pages/notes/section-13/stack-operations.html'">
                            <p>Section 13: Stack Operations</p>
                        </div>
                        <div class="submenu-item-hidden" onclick="window.location.href='/practical_arm_assembly/pages/notes/section-14/push-and-pop.html'">
                            <p>Section 14: Push and Pop</p>
                        </div>
                        <div class="submenu-item-hidden" onclick="window.location.href='/practical_arm_assembly/pages/notes/section-15/hello-world.html'">
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

