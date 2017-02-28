

class createColorDraw
{
	constructor(x,y,font,text)
	{
		sliceCoords = [];
		colors = [];
		texts = [];
		draws = [];
		
		local fulltext = text;
		local index = 0;
		do
		{
			local index = fulltext.find("/");
			if (index != null)
			{
				sliceCoords.append(index);
				fulltext = fulltext.slice(0,index) + "|" + fulltext.slice(index + 1,fulltext.len());
				print(index);
			}
			else
			{
				break;
			}
		} while (index != null)

		
		
		local color_text = text;
		for (local i = 0; i < sliceCoords.len(); ++i)
		{
			local rc = color_text.slice(sliceCoords[i].tointeger() + 1, sliceCoords[i].tointeger() + 4);
			local gc = color_text.slice(sliceCoords[i].tointeger() + 5, sliceCoords[i].tointeger() + 8);
			local bc = color_text.slice(sliceCoords[i].tointeger() + 9, sliceCoords[i].tointeger() + 12);
			if (rc.slice(0,1) == "0")
			{
				rc = rc.slice(1,rc.len());
			}
			else if (rc.slice(0,2) == "00")
			{
				rc = rc.slice(2,rc.len());
			}
			if (gc.slice(0,1) == "0")
			{
				gc = gc.slice(1,gc.len());
			}
			else if (gc.slice(0,2) == "00")
			{
				gc = gc.slice(2,gc.len());
			}
			if (bc.slice(0,1) == "0")
			{
				bc = bc.slice(1,bc.len());
			}
			else if (bc.slice(0,2) == "00")
			{
				bc = bc.slice(2,bc.len());
			}
			colors.append({r = rc.tointeger(),g = gc.tointeger(),b = bc.tointeger()});
		}
		
		
		local endtext = text;
		local curindex = 0;
		local lastindex = 0;
		local first_text = false;
		
		for (local i = 0; i < sliceCoords.len(); ++i)
		{
			if (sliceCoords[0] != 0 && first_text == false)
			{
				texts.append(endtext.slice(0,sliceCoords[i]));
				first_text = true;
			}
			if (i != (sliceCoords.len() - 1))
			{
				texts.append(endtext.slice(sliceCoords[i] + 12,sliceCoords[i + 1]));
			}
			else
			{
				texts.append(text.slice(sliceCoords[i] + 12,text.len()));
			}
		}
		
		
		local texts_id = 0;
		if (texts.len() > sliceCoords.len())
		{
			draws.append(createDraw(texts[texts_id],font,x,y,defaultColor.r,defaultColor.g,defaultColor.b,true));
			texts_id += 1;
		}
		for (local i = 0; i < sliceCoords.len(); ++i)
		{
			if (texts_id != 0)
			{
				local resolution = getResolution();
				local pos = getDrawPosition(draws[texts_id - 1]);
				local calc = (8192.0 / resolution.width) * getTextWidth(font,texts[texts_id - 1]);
				draws.append(createDraw(texts[texts_id],font,pos.x + calc,y,colors[i].r,colors[i].g,colors[i].b,true));
				texts_id += 1;
			}
			else
			{
				draws.append(createDraw(texts[texts_id],font,x,y,colors[i].r,colors[i].g,colors[i].b,true));
				texts_id += 1;
			}
		}
	}
	
	function show()
	{
		for (local i = 0; i < draws.len(); ++i)
		{
			setDrawVisible(draws[i],true);
		}
	}
	
	function hide()
	{
		for (local i = 0; i < draws.len(); ++i)
		{
			setDrawVisible(draws[i],false);
		}
	}
	
	sliceCoords = -1;
	colors = -1;
	texts = -1;
	draws = -1;
	defaultColor = {r = 255, g = 255, b = 255};
}
