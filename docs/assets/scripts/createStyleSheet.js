export function createStyleSheet(url, id = null)
{
    var styleSheet = document.createElement("link");
    styleSheet.rel = "stylesheet";
    styleSheet.type = "text/css"
    styleSheet.href = url;

    if (id != null)
        styleSheet.id = id;

    return styleSheet;

}