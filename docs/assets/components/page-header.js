import "./search-box.js";
import { createStyleSheet } from "../scripts/createStyleSheet.js";

class PageHeader extends HTMLElement
{
    constructor() 
    {
        super();

    }

    connectedCallback()
    {
        document.head.append(createStyleSheet("/practical_arm_assembly/assets/styles/page-header.css"));

        var header = document.createElement("header");
        header.classList.add("page-header");

        var leftSection = document.createElement("div");
        leftSection.classList.add("left");

        var rightSection = document.createElement("div");
        rightSection.classList.add("right");

        var siteIcon = document.createElement("img");
        siteIcon.id = "site-icon";

        var searchBox = document.createElement("search-box");
        searchBox.id = "search-box";
        searchBox.setAttribute("placeholder", "Search");

        var title = document.createElement("h1");
        title.innerText = "Practical ARM Assembly";

        rightSection.append(searchBox);
        leftSection.append(siteIcon, title);

        header.append(leftSection, rightSection);

        this.append(header);

    }

}

customElements.define("page-header", PageHeader);