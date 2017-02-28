
enableDebugMode(true);

local testtex = -1;
local sizetex = -1;
local isTap = false;
local isTapDraw = false;
local oldx = 0;
local oldy = 0;
local lastid = -1;
local textures = 0;
local draws = 0;
local activeTex = -1;
local first = false;
local chosefont = 0;
local moveDraw = -1;
local inCell = false;
local oldmuchx = 0;
local oldmuchy = 0;
local onecell = 50;
local moveWindowInCell = false;

local last_command = 0;
local last_arg_01 = -1;
local last_arg_02 = -1;
local last_arg_03 = -1;

local otdarr = [];
local drawarr = [];
local fontarr = ["FONT_OLD_10_WHITE.TGA","FONT_OLD_10_WHITE_HI.TGA","FONT_OLD_20_WHITE.TGA","FONT_OLD_20_WHITE_HI.TGA"];

addEvent("onRespawn",function()
{
	clearMultiplayerMessage();
	sizetex = createGUIButton(1000,1000,150,150,"INV_SLOT_EQUIPPED_FOCUS.TGA");
	setCursorVisible(true);
	enableCameraMovement(false);
	setFreeze(true);
	first = true;
});

addEvent("onClick",function(button,x,y,wheel)
{
	if (button == "LEFT_DOWN")
	{
		setActive();
		if (sizetex.isActive() && isTap == false)
		{
			local pos = getCursorPosition();
			if (inCell == false)
			{
				oldx = pos.x;
				oldy = pos.y;
			}
			else
			{
				oldmuchx = (pos.x/onecell);
				oldmuchy = (pos.y/onecell);
			};
			isTap = true;
			enableWindowsMovement(false);
		}
		else if (isTapDraw == false)
		{
			for (local i = 0; i < draws; ++i)
			{
				if (drawarr[i])
				{
					if (drawarr[i].isActive())
					{
						local pos = getCursorPosition();
						moveDraw = i;
						if (inCell == false)
						{
							oldx = pos.x;
							oldy = pos.y;
						}
						else
						{
							oldmuchx = (pos.x/onecell);
							oldmuchy = (pos.y/onecell);
						};
						isTapDraw = true;
						enableWindowsMovement(false);
					};
				};
			};
		};
		if (inCell == true)
		{
			if (activeTex != -1)
			{
				if (otdarr[activeTex].isActive() == true && sizetex.isActive() == false)
				{
					if (isTapDraw == false)
					{
						local pos = getCursorPosition();
						moveWindowInCell = true;
						oldmuchx = (pos.x/onecell);
						oldmuchy = (pos.y/onecell);
					};
				};
			};
		};
	}
	else if (button == "LEFT_UP")
	{
		if (isTap == true || isTapDraw == true || moveWindowInCell == true)
		{
			isTap = false;
			isTapDraw = false;
			moveWindowInCell = false;
			if (inCell == false)
			{
				enableWindowsMovement(true);
			};
		};
	}
});

addEvent("onKey",function(key,letter)
{
	if (key == KEY_UP)
	{
		if (!isChatInputOpen())
		{
			for (local i = 0; i < draws; ++i)
			{
				if (drawarr[i])
				{
					if (drawarr[i].isActive())
					{
						if (chosefont != 3)
						{
							chosefont += 1;
						}
						else
						{
							chosefont = 0;
						};
						drawarr[i].setFont(fontarr[chosefont]);
					};
				};
			};
		}
		else
		{
			if (last_command == 1)
			{
				chatInputSetText("/texture " + last_arg_01);
			}
			else if (last_command == 2)
			{
				chatInputSetText("/draw " + last_arg_01);
			}
			else if (last_command == 3)
			{
				chatInputSetText("/color " + last_arg_01 + " " + last_arg_02 + " " + last_arg_03);
			}
			else if (last_command == 4)
			{
				chatInputSetText("/text " + last_arg_01);
			}
			else if (last_command == 5)
			{
				chatInputSetText("/tex " + last_arg_01);
			}
			else if (last_command == 6)
			{
				chatInputSetText("/cell");
			}
			else if (last_command == 7)
			{
				chatInputSetText("/changecell " + last_arg_01);
			}
			else if (last_command == 8)
			{
				chatInputSetText("/print");
			}
			else if (last_command == 9)
			{
				chatInputSetText("/save" + last_arg_01);
			};
		}
	
	}
	else if (key == KEY_DOWN)
	{
		if (!isChatInputOpen())
		{
			for (local i = 0; i < draws; ++i)
			{
				if (drawarr[i])
				{
					if (drawarr[i].isActive())
					{
						if (chosefont != 0)
						{
							chosefont -= 1;
						}
						else
						{
							chosefont = 3;
						};
						drawarr[i].setFont(fontarr[chosefont]);
					};
				};
			};
		}
		else
		{
			chatInputSetText("");
		};
	};
});

addEvent("onCommand",function(cmd,params)
{
	if (cmd == "texture")
	{
		commandTexCreate(params);
	}
	else if (cmd == "draw")
	{
		commandDrawCreate(params);
	}
	else if (cmd == "color")
	{
		commandDrawChangeColor(params);
	}
	else if (cmd == "text")
	{
		commandDrawChangeText(params);
	}
	else if (cmd == "tex")
	{
		commandTextureChange(params);
	}
	else if (cmd == "cell")
	{
		if (inCell == false)
		{
			commandActivateCell();
		}
		else
		{
			commandDeactivateCell();
		};
	}
	else if (cmd == "changecell")
	{
		commandChangeCell(params);
	}
	else if (cmd == "print")
	{
		commandPrintAll();
	}
	else if (cmd == "save")
	{
		commandSave(params);
	};
});

addEvent("onRender",function()
{
	if (first == true)
	{
		if (activeTex != -1)
		{
			local size = otdarr[activeTex].getSize();
			local posd = otdarr[activeTex].getPosition();
			sizetex.disconnect();
			sizetex.connect(otdarr[activeTex]);
			sizetex.hide();
			sizetex.show();
			sizetex.setPosition((posd[0] + size[0]) - 150,(posd[1] + size[1]) - 150);
		};
		local pos = getCursorPosition();
		if (isTap == true)
		{
			if (inCell == false)
			{
				local size = otdarr[activeTex].getSize();
				local newx = 0;
				local newy = 0;
				if (pos.x < oldx)
				{
					newx = oldx - pos.x;
					newx = size[0] - newx;
				}
				else
				{
					newx = pos.x - oldx;
					newx = size[0] + newx;
				};
				if (pos.y < oldy)
				{
					newy = oldy - pos.y;
					newy = size[1] - newy;
				}
				else
				{
					newy = pos.y - oldy;
					newy = size[1] + newy;
				};
				otdarr[activeTex].setSize(newx,newy);
				oldx = pos.x;
				oldy = pos.y;
			}
			else
			{
				local size = otdarr[activeTex].getSize();
				local muchx = (pos.x/onecell);
				local muchy = (pos.y/onecell);
				local newx = 0;
				local newy = 0;
				if (oldmuchx > muchx)
				{
					newx = oldmuchx - muchx;
					newx = size[0] - (newx * onecell);
				}
				else
				{
					newx = muchx - oldmuchx;
					newx = size[0] + (newx * onecell);
				};
				if (oldmuchy > muchy)
				{
					newy = oldmuchy - muchy;
					newy = size[1] - (newy * onecell);
				}
				else
				{
					newy = muchy - oldmuchy;
					newy = size[1] + (newy * onecell);
				};
				oldmuchx = muchx;
				oldmuchy = muchy;
				otdarr[activeTex].setSize(newx,newy);
			};
		};
		if (isTapDraw == true)
		{
			if (inCell == false)
			{
				local posdraw = drawarr[moveDraw].getPosition();
				local newx = 0;
				local newy = 0;
				if (pos.x < oldx)
				{
					newx = oldx - pos.x;
					newx = posdraw[0] - newx;
				}
				else
				{
					newx = pos.x - oldx;
					newx = posdraw[0] + newx;
				};
				if (pos.y < oldy)
				{
					newy = oldy - pos.y;
					newy = posdraw[1] - newy;
				}
				else
				{
					newy = pos.y - oldy;
					newy = posdraw[1] + newy;
				};
				drawarr[moveDraw].setPosition(newx,newy);
				oldx = pos.x;
				oldy = pos.y;
			}
			else
			{
				local pt = drawarr[moveDraw].getPosition();
				local muchx = (pos.x/onecell);
				local muchy = (pos.y/onecell);
				local newx = 0;
				local newy = 0;
				if (oldmuchx > muchx)
				{
					newx = oldmuchx - muchx;
					newx = pt[0] - (newx * onecell);
				}
				else
				{
					newx = muchx - oldmuchx;
					newx = pt[0] + (newx * onecell);
				};
				if (oldmuchy > muchy)
				{
					newy = oldmuchy - muchy;
					newy = pt[1] - (newy * onecell);
				}
				else
				{
					newy = muchy - oldmuchy;
					newy = pt[1] + (newy * onecell);
				};
				oldmuchx = muchx;
				oldmuchy = muchy;
				drawarr[moveDraw].setPosition(newx,newy);
			};
		};
		if (moveWindowInCell == true)
		{
			local pos = getCursorPosition();
			local pt = otdarr[activeTex].getPosition();
			local muchx = (pos.x/onecell);
			local muchy = (pos.y/onecell);
			local newx = 0;
			local newy = 0;
			if (oldmuchx > muchx)
			{
				newx = oldmuchx - muchx;
				newx = pt[0] - (newx * onecell);
			}
			else
			{
				newx = muchx - oldmuchx;
				newx = pt[0] + (newx * onecell);
			};
			if (oldmuchy > muchy)
			{
				newy = oldmuchy - muchy;
				newy = pt[1] - (newy * onecell);
			}
			else
			{
				newy = muchy - oldmuchy;
				newy = pt[1] + (newy * onecell);
			};
			oldmuchx = muchx;
			oldmuchy = muchy;
			otdarr[activeTex].setPosition(newx,newy);
		};
	};
});

function commandTexCreate(params)
{
	local args = sscanf("s",params);
	if (args)
	{
		texCreate(1000,1000,1000,1000,args[0]);
		last_arg_01 = args[0];
		last_command = 1;
	};
};

function commandDrawCreate(params)
{
	local args = sscanf("s",params);
	if (args)
	{
		drawCreate(args[0],fontarr[0],1000,1000,255,255,255);
		last_arg_01 = args[0];
		last_command = 2;
	};
};

function commandDrawChangeText(params)
{
	local args = sscanf("s",params);
	if (args)
	{
		for (local i = 0; i < draws; ++i)
		{
			if (drawarr[i])
			{
				if (drawarr[i].isActive())
				{
					drawarr[i].setText(args[0]);
					last_arg_01 = args[0];
					last_command = 4;
				};
			};
		};
	};
};

function commandDrawChangeColor(params)
{
	local args = sscanf("ddd",params);
	if (args)
	{
		for (local i = 0; i < draws; ++i)
		{
			if (drawarr[i])
			{
				if (drawarr[i].isActive())
				{
					drawarr[i].setColor(args[0],args[1],args[2]);
					drawarr[i].setActiveColor(args[0],args[1],args[2]);
					last_arg_01 = args[0];
					last_arg_02 = args[1];
					last_arg_03 = args[2];
					last_command = 3;
				};
			};
		};
	};
};

function commandActivateCell()
{
	inCell = true;
	last_command = 6;
	for (local i = 0; i < textures; ++i)
	{
		if (otdarr[i])
		{
			enableWindowsMovement(false);
			local pos = otdarr[i].getPosition();
			local size = otdarr[i].getSize();
			otdarr[i].setPosition((pos[0]/onecell) * onecell,(pos[1]/onecell) * onecell);
			otdarr[i].setSize((size[0]/onecell) * onecell,(size[1]/onecell) * onecell);
		};
	};
};

function commandDeactivateCell()
{
	inCell = false;
	last_command = 6;
};

function commandChangeCell(params)
{
	local args = sscanf("d",params);
	if (args)
	{
		onecell = args[0];
		last_arg_01 = args[0];
		last_command = 7;
		for (local i = 0; i < textures; ++i)
		{
			if (otdarr[i])
			{
				local pos = otdarr[i].getPosition();
				local size = otdarr[i].getSize();
				otdarr[i].setPosition((pos[0]/onecell) * onecell,(pos[1]/onecell) * onecell);
				otdarr[i].setSize((size[0]/onecell) * onecell,(size[1]/onecell) * onecell);
			};
		};
		for (local i = 0; i < draws; ++i)
		{
			if (drawarr[i])
			{
				local pos = drawarr[i].getPosition();
				drawarr[i].setPosition((pos[0]/onecell) * onecell,(pos[1]/onecell) * onecell);
			};
		};
	};
};

function commandPrintAll()
{
	last_command = 8;
	for (local i = 0; i < textures; ++i)
	{
		if (otdarr[i])
		{
			local pos = otdarr[i].getPosition();
			local size = otdarr[i].getSize();
			local texture = otdarr[i].g_Texture;
			print("createTexture(" + pos[0].tostring() + "," + pos[1].tostring() + "," + size[0].tostring() + "," + size[1].tostring() + ",'" + texture.tostring() + "')");
		};
	};
	for (local i = 0; i < draws; ++i)
	{
		if (drawarr[i])
		{
			local text = drawarr[i].g_Text;
			local font = drawarr[i].g_Font;
			local pos = drawarr[i].getPosition();
			local r = drawarr[i].g_R;
			local g = drawarr[i].g_G;
			local b = drawarr[i].g_B;
			print("createDraw('" + text.tostring() + "'," + font.tostring() + "," + pos[0].tostring() + "," + pos[1].tostring() + "," + r.tostring() + "," + g.tostring() + "," + b.tostring() + ")");
		};
	};
};

function commandTextureChange(params)
{
	local args = sscanf("s",params);
	if (args)
	{
		for (local i = 0; i < textures; ++i)
		{
			if (otdarr[i])
			{
				if (otdarr[i].isActive())
				{
					otdarr[i].setTexture(args[0]);
					last_arg_01 = args[0];
					last_command = 5;
				};
			};
		};
	};
};

function commandSave(params)
{
	local args = sscanf("s",params);
	if (args)
	{
		callServerFunc(RELIABLE,"createFile",args[0]);
		last_arg_01 = args[0];
		last_command = 9;
		for (local i = 0; i < textures; ++i)
		{
			if (otdarr[i])
			{
				local pos = otdarr[i].getPosition();
				local size = otdarr[i].getSize();
				local texture = otdarr[i].g_Texture;
				callServerFunc(RELIABLE,"writeInFile","createTexture(" + pos[0] + "," + pos[1] + "," + size[0] + "," + size[1] + "," + "'" + texture + "');");
			};
		};
		for (local i = 0; i < draws; ++i)
		{
			if (drawarr[i])
			{
				local text = drawarr[i].g_Text;
				local font = drawarr[i].g_Font;
				local pos = drawarr[i].getPosition();
				local r = drawarr[i].g_R;
				local g = drawarr[i].g_G;
				local b = drawarr[i].g_B;
				callServerFunc(RELIABLE,"writeInFile","createDraw('" + text.tostring() + "'," + font.tostring() + "," + pos[0].tostring() + "," + pos[1].tostring() + "," + r.tostring() + "," + g.tostring() + "," + b.tostring() + ")");
			};
		};
	};
};

function texCreate(x,y,width,height,tex)
{
	otdarr.append(createGUIWindow(x,y,width,height,tex));
	lastid += 1;
	textures += 1;
	activeTex = lastid;
	otdarr[activeTex].show();
	if (inCell == true)
	{
		for (local i = 0; i < textures; ++i)
		{
			if (otdarr[i])
			{
				local pos = otdarr[i].getPosition();
				local size = otdarr[i].getSize();
				otdarr[i].setPosition((pos[0]/onecell) * onecell,(pos[1]/onecell) * onecell);
				otdarr[i].setSize((size[0]/onecell) * onecell,(size[1]/onecell) * onecell);
			};
		};
		for (local i = 0; i < draws; ++i)
		{
			if (drawarr[i])
			{
				local pos = drawarr[i].getPosition();
				drawarr[i].setPosition((pos[0]/onecell) * onecell,(pos[1]/onecell) * onecell);
			};
		};
	};
};

function drawCreate(text,font,x,y,r,g,b)
{
	drawarr.append(createGUITextButton(text,font,x,y,r,g,b));
	drawarr[draws].show();
	draws += 1;
	if (inCell == true)
	{
		for (local i = 0; i < textures; ++i)
		{
			if (otdarr[i])
			{
				local pos = otdarr[i].getPosition();
				local size = otdarr[i].getSize();
				otdarr[i].setPosition((pos[0]/onecell) * onecell,(pos[1]/onecell) * onecell);
				otdarr[i].setSize((size[0]/onecell) * onecell,(size[1]/onecell) * onecell);
			};
		};
		for (local i = 0; i < draws; ++i)
		{
			if (drawarr[i])
			{
				local pos = drawarr[i].getPosition();
				drawarr[i].setPosition((pos[0]/onecell) * onecell,(pos[1]/onecell) * onecell);
			};
		};
	};
};

function setActive()
{
	for (local i = 0; i < textures; ++i)
	{
		if (otdarr[i])
		{
			if (otdarr[i].isActive())
			{
				activeTex = i;
				break;
			};
		};
	};
}
		