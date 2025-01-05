document.addEventListener("DOMContentLoaded", () =>
{
    var x86Toggles = document.querySelectorAll(".x86-toggle");
    var x64Toggles = document.querySelectorAll(".x64-toggle");

    x86Toggles.forEach((x86Toggle) =>
    {
        x86Toggle.addEventListener("click", () =>
        {
            document.querySelectorAll(".x86-content").forEach((x86Content) =>
            {
                x86Content.style.display = "block";

            });

            document.querySelectorAll(".x64-content").forEach((x64Content) =>
            {
                x64Content.style.display = "none";

            });

            x86Toggles.forEach((x86Toggle) =>
            {
                x86Toggle.classList.add("inactive");

            });
                
            x64Toggles.forEach((x64Toggle) =>
            {
                x64Toggle.classList.remove("inactive");
        
            });

        });

    });

    x64Toggles.forEach((x64Toggle) =>
    {
        x64Toggle.addEventListener("click", () =>
        {
            document.querySelectorAll(".x86-content").forEach((x86Content) =>
            {
                x86Content.style.display = "none";

            });

            document.querySelectorAll(".x64-content").forEach((x64Content) =>
            {
                x64Content.style.display = "block";

            });

            x86Toggles.forEach((x86Toggle) =>
            {
                x86Toggle.classList.remove("inactive");

            });
            
            x64Toggles.forEach((x64Toggle) =>
            {
                x64Toggle.classList.add("inactive");
        
            });

        });

    });

});