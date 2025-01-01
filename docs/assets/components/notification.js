import { createStyleSheet } from "../scripts/createStyleSheet.js";

export function notification(message, timeout)
{
    document.head.append(createStyleSheet("/practical_arm_assembly/assets/styles/notification.css"));
        
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
