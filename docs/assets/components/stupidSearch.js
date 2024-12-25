export async function stupidSearch(searchText)
{
    var list = await fetch("/practical_arm_assembly/assets/misc/search-list.txt");
    var files = (await list.text()).split('\n');
    var results = [];

    await files.forEach(file => 
    {
        scanDoc(file, searchText)
            .then(
            (response) =>
            {
                if (response == true)
                    results.push(file);

            })
        
    });

    console.log(results);

}

async function scanDoc(file, text)
{
    var content = await (await fetch(file)).text();
    var document = new DOMParser().parseFromString(content, "text/html");

    return document.body.textContent.includes(text);

}