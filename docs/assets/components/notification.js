import { createStyleSheet } from "../scripts/createStyleSheet.js";

export function notification(message, timeout)
{
    const styleSheetID = "notification-styles"
    const styleSheetPath = "/practical_arm_assembly/assets/styles/notification.css";

    if (!document.getElementById(styleSheetID))
        document.head.append(createStyleSheet(styleSheetPath, styleSheetID));
        
    var messageBox = document.createElement("div");
    messageBox.id="message-box";

    var content = document.createElement("p");
    content.innerText = message;

    messageBox.append(content);

    document.body.appendChild(messageBox);

    setTimeout(() => 
        {
            document.body.removeChild(messageBox);
            
        }, 
        timeout);

}
