class NavMenu extends HTMLElement
{
    constructor()
    {
        super();

    }

    connectedCallback()
    {
        this.innerHTML =
        `
        <div class="menu-container">
            <div class="menu-item" style="background-color: #27272A;" onclick="window.location.href='./index.html'">
                <p style="opacity: 20%;">About</p>
            </div>
            <div class="menu-item" onclick="toggleStyle('submenu-item', 'submenu-item-active', 'lessons')">
                <p>Lesson Notes</p>
            </div>  
                <div id="lessons">
                    <div class="submenu-item" onclick="window.location.href='./pages/lessons/introduction/introduction.html'">
                        <p>Introduction</p>
                    </div>                        
                    <div class="submenu-item" onclick="window.location.href='./pages/lessons/lesson-01/lesson-01.html'">
                        <p>Lesson 01: MOV, Exit Syscall</p>
                    </div>
                    <div class="submenu-item" >
                        <p>Lesson 02: ADD, SUB, MUL, set CPSR</p>
                    </div>
                    <div class="submenu-item" >
                        <p>Lesson 03: LDR, STR</p>
                    </div>
                    <div class="submenu-item" onclick="window.location.href='./pages/lessons/lesson-04/lesson-04.html'">
                        <p>Lesson 04: Logical Operators</p>
                    </div>
                    <div class="submenu-item" >
                        <p>Lesson 05: Signed Number Conversions</p>
                    </div>
                    <div class="submenu-item" >
                        <p>Lesson 06: Shift and Rotate</p>
                    </div>
                    <div class="submenu-item" >
                        <p>Lesson 07: CMP</p>
                    </div>
                    <div class="submenu-item" >
                        <p>Lesson 08: Branching</p>
                    </div>
                    <div class="submenu-item" >
                        <p>Lesson 09: While Loops</p>
                    </div>
                    <div class="submenu-item" >
                        <p>Lesson 10: Function Calls</p>
                    </div>
                    <div class="submenu-item" style="color: white;" >
                        <p>Lesson 11: Stack Operations</p>
                    </div>
                </div>
            <div class="menu-item"><p>Resources</p></div>
            <div class="menu-item"><p>Miscellaneous</p></div>
        </div>
        `;

    }

}

customElements.define("nav-menu", NavMenu);