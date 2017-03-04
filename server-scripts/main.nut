


function onInit()
{ 
    Mysql.connect("localhost", "Quarchodron", "Pass12", "mmo");
	local fulltext = "/033.206.255T /255.255.255- открыть чат. Сообщение следует вводить /255.000.000руками/255.255.255.";
	local index = 0;
		do
		{
			local index = fulltext.find("/");
			if (index != null)
			{
				fulltext = fulltext.slice(0,index) + ("|" + fulltext.slice(index + 1,fulltext.len()));
				print(index);
			}
			else
			{
				break;
			}
		} while (index != null)
}