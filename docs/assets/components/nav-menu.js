import { createStyleSheet } from "../scripts/createStyleSheet.js";

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
        const containerID = "menu-container";

        if (document.getElementById(containerID))
            return;

        if (!document.getElementById(styleSheetID))
            document.head.append(createStyleSheet(styleSheetPath, styleSheetID));
        
        this.innerHTML =
        `
        <div class="menu-container">
            <div class="menu-item" onclick="window.location.href='/practical_arm_assembly/index.html'">
                <p>About</p>
            </div>
            <div class="menu-item collapsible" onclick="toggleStyle('submenu-item', 'submenu-item-hidden', 'lessons')">
                <p>Lesson Notes</p>
            </div>  
                <div class="sliding-panel" id="lessons">
                    <div class="submenu-item-hidden" onclick="window.location.href='/practical_arm_assembly/pages/lessons/introduction/introduction.html'">
                        <p>Introduction</p>
                    </div>                        
                    <div class="submenu-item-hidden" onclick="window.location.href='/practical_arm_assembly/pages/lessons/lesson-01/lesson-01.html'">
                        <p>Lesson 01: MOV, Exit Syscall</p>
                    </div>
                    <div class="submenu-item-hidden" onclick="window.location.href='/practical_arm_assembly/pages/lessons/lesson-02/lesson-02.html'">
                        <p>Lesson 02: ADD, SUB, MUL</p>
                    </div>
                    <div class="submenu-item-hidden" onclick="window.location.href='/practical_arm_assembly/pages/lessons/lesson-03/lesson-03.html'">
                        <p>Lesson 03: Logical Operators</p>
                    </div>
                    <div class="submenu-item-hidden" onclick="window.location.href='/practical_arm_assembly/pages/lessons/lesson-04/lesson-04.html'">
                        <p>Lesson 04: Signed Number Conversion</p>
                    </div>
                    <div class="submenu-item-hidden" onclick="window.location.href='/practical_arm_assembly/pages/lessons/lesson-05/lesson-05.html'">
                        <p>Lesson 05: Shift and Rotate</p>
                    </div>
                    <div class="submenu-item-hidden" onclick="window.location.href='/practical_arm_assembly/pages/lessons/lesson-06/lesson-06.html'">
                        <p>Lesson 06: The CPSR</p>
                    </div>
                    <div class="submenu-item-hidden" onclick="window.location.href='/practical_arm_assembly/pages/lessons/lesson-07/lesson-07.html'">
                        <p>Lesson 07: CMP</p>
                    </div>
                    <div class="submenu-item-hidden" onclick="window.location.href='/practical_arm_assembly/pages/lessons/lesson-08/lesson-08.html'">
                        <p>Lesson 08: Branching</p>
                    </div>
                    <div class="submenu-item-hidden" onclick="window.location.href='/practical_arm_assembly/pages/lessons/lesson-09/lesson-09.html'">
                        <p>Lesson 09: While Loops</p>
                    </div>
                    <div class="submenu-item-hidden" onclick="window.location.href='/practical_arm_assembly/pages/lessons/lesson-10/lesson-10.html'">
                        <p>Lesson 10: Function Calls</p>
                    </div>
                    <div class="submenu-item-hidden" onclick="window.location.href='/practical_arm_assembly/pages/lessons/lesson-11/lesson-11.html'">
                        <p>Lesson 11: LDR and STR</p>
                    </div>
                    <div class="submenu-item-hidden" onclick="window.location.href='/practical_arm_assembly/pages/lessons/lesson-12/lesson-12.html'">
                        <p>Lesson 12: Stack Operations</p>
                    </div>
                    <div class="submenu-item-hidden" onclick="window.location.href='/practical_arm_assembly/pages/lessons/lesson-13/lesson-13.html'">
                        <p>Lesson 13: Push and Pop</p>
                    </div>
                    <div class="submenu-item-hidden" onclick="window.location.href='/practical_arm_assembly/pages/lessons/lesson-14/lesson-14.html'">
                        <p>Lesson 14: Hello World!</p>
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
