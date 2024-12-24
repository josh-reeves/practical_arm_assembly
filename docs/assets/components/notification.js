export function notification(message, timeout, classList = null)
{
    var frame = document.createElement("div");

    frame.textContent = message;

    frame.classList.add(classList);

    if (classList === null)
    {
        frame.setAttribute(
            "style",
            `
                position: absolute;
                top: 50%;
                display: flex;
                justify-content: center;
                align-items: center;
                background-color: white;");

            `);

    }

    document.body.appendChild(frame);

    setTimeout(() => 
        {
            document.body.removeChild(frame);
            
        }, 
        timeout);

}
