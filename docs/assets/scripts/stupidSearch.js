export async function stupidSearch(searchText)
{
    var list = await fetch("/practical_arm_assembly/assets/misc/search-list.txt");
    var files = (await list.text()).split('\n');
    var results = [];

    await Promise.all(files.map(async (file) =>
    {
        await scanDoc(file, searchText).then((response) =>
        {
            if (response)
                results.push(file);

        });

    }));

    return results;

}

async function scanDoc(file, searchText)
{
    var content = await (await fetch(file)).text();
    var document = new DOMParser().parseFromString(content, "text/html");

    return document.body.textContent.includes(searchText);

}