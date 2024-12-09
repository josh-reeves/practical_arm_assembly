function hide(id)
{
    document.getElementById(id).style.display = "none";

}

function unhide(id)
{
    document.getElementById(id).style.display = "block";

}

function toggleStyle (oldClass, newClass, targetID = null)
{
    // Seems to work better than toggle, which runs into some weird issues if the if new style is higher up in the stylesheet than the old one:
    let trueToggle = function(target)
    {
        if(target.classList.contains(oldClass))
            {
                target.classList.remove(oldClass);
                target.classList.add(newClass);
            }
            else
            {
                target.classList.remove(newClass);
                target.classList.add(oldClass);

            }

    }

    if (targetID!= null)
    {
        let target = document.getElementById(targetID);

        for (let child of target.children)
            trueToggle(child)

        return;

    }

    var elements = document.getElementsByClassName(oldClass);

    for (let element of elements)
        trueToggle(element);

}