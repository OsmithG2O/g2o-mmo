
local MAX_GUIELEMENTS = 500;

local WINDOW_MOVEMENT = true;

local notifyShow = false;

local guiStructure = {};

for (local i = 0; i < MAX_GUIELEMENTS; ++i)
{
	guiStructure[i] <-{};
	guiStructure[i].type <- 0;
	guiStructure[i].gui <- -1;
};

class GUIButton
{
	constructor (x, y, width, height, texture)
	{
		g_PosX = x;
		g_PosY = y;
		g_CurX = x;
		g_CurY = y;
		g_Texture = texture;
		g_Width = width;
		g_Height = height;
		
		g_Button = createTexture(x, y, width, height, texture);
		
	}
	
	function show()
	{
		setTextureVisible(g_Button,true);
		g_Showed = true;
	}
	
	function hide()
	{
		setTextureVisible(g_Button,false);
		g_Showed = false;
	}
	
	function isShowed()
	{
		return g_Showed;
	}
	
	function check()
	{
		local pos = getCursorPosition();
		if ((pos.x >= g_CurX && pos.x < (g_CurX + g_Width)) && (pos.y >= g_CurY && pos.y <= (g_CurY + g_Height)))
		{
			if (g_Showed == true && g_Access == true)
			{
				g_ButtonActive = true;
			};
		}
		else
		{
			if (g_Showed == true && g_Access == true)
			{
				g_ButtonActive = false;
			};
		};
		if (g_ConnectedWindow != -1)
		{
			if (g_ConnectedWindow.isMove() == true)
			{
				if (g_OldX == 2281337228)
				{
					g_OldX = pos.x;
					g_OldY = pos.y;
				};
				if (g_OldX > pos.x)
				{
					g_CurX = g_CurX - (g_OldX - pos.x);
				}
				else
				{
					g_CurX = g_CurX + (pos.x - g_OldX);
				};
				if (g_OldY > pos.y)
				{
					g_CurY = g_CurY - (g_OldY - pos.y);
				}
				else
				{
					g_CurY = g_CurY + (pos.y - g_OldY);
				};
				g_OldX = pos.x;
				g_OldY = pos.y;
				setTexturePosition(g_Button,g_CurX,g_CurY);
			}
			else
			{
				g_OldX = 2281337228;
				g_OldY = 2281337228;
			};
			if (g_ConnectedWindow.isReset() == true)
			{
				g_CurX = g_PosX;
				g_CurY = g_PosY;
				setTexturePosition(g_Button,g_PosX,g_PosY);
			};
		};
	}
	
	function setPosition(x,y)
	{
		g_PosX = x;
		g_PosY = y;
		g_CurX = x;
		g_CurY = y;
		
		setTexturePosition(g_Button,x,y);
	}
	
	function setSize(width,height)
	{
		g_Width = width;
		g_Height = height;
		
		setTextureSize(g_Button,width,height);
	}
	
	function setTexture(new_texture)
	{
		g_Texture = new_texture;
		destroyTexture(g_Button);
		g_Button = createTexture(g_CurX,g_CurY,g_Width,g_Height,new_texture);
		if (g_Showed == true)
		{
			setTextureVisible(g_Button,true);
		};
	}
	
	function getPosition()
	{
		local arr = [g_CurX,g_CurY];
		return arr;
	}
	
	function getSize()
	{
		local arr = [g_Width,g_Height];
		return arr;
	}
	
	function reset()
	{
		g_CurX = g_PosX;
		g_CurY = g_PosY;
		setTexturePosition(g_CurX,g_CurY,g_Width,g_Height,g_Texture);
	}
	
	function isActive()
	{
		return g_ButtonActive;
	}
	
	function connect(window)
	{
		for (local i = 0; i < MAX_GUIELEMENTS; ++i)
		{
			if (guiStructure[i].gui == window)
			{
				if (guiStructure[i].type == 2)
				{
					g_ConnectedWindow = guiStructure[i].gui;
				}
				else
				{
					print("That gui element is not window!");
				};
			};
		};
	}
	
	function disconnect()
	{
		if (g_ConnectedWindow != -1)
		{
			g_ConnectedWindow = -1;
		};
	}
	
	function access(toggle)
	{
		if (access == true)
		{
			g_Access = false;
		}
		else
		{
			g_Access = true;
		};
	}
	
	onRender = 0;
	
	g_PosX = 0;
	g_PosY = 0;
	g_CurX = 0;
	g_CurY = 0;
	g_Texture = -1;
	g_Width = 0;
	g_Height = 0;
	g_Button = -1;
	g_Showed = false;
	g_Access = true;
	g_ConnectedWindow = -1;
	g_OldX = 0;
	g_OldY = 0;
	g_ListID = -1;
	g_ButtonActive = false;
}

class GUIWindow
{
	constructor (x,y,width,height,texture, id)
	{
		g_PosX = x;
		g_PosY = y;
		g_Width = width;
		g_Height = height;
		g_Texture = texture;
		g_CurX = x;
		g_CurY = y;
		g_ID = id;
		
		g_Window = createTexture(x,y,width,height,texture);
	}
	
	function show()
	{
		if (g_Showed == false)
		{
			g_Showed = true;
			setTextureVisible(g_Window,true);
		};
	}
	
	function hide()
	{
		if (g_Showed == true)
		{
			g_Showed = false;
			setTextureVisible(g_Window,false);
		};
	}
	
	function reset()
	{
		g_CurX = g_PosX;
		g_CurY = g_PosY;
		setTexturePosition(g_Window,g_PosX,g_PosY);
		g_Move = false;
	}
	
	function check()
	{
		local pos = getCursorPosition();
		if ((pos.x >= g_CurX && pos.x < (g_CurX + g_Width)) && (pos.y >= g_CurY && pos.y <= (g_CurY + g_Height)))
		{
			if (g_Showed == true && g_Access == true)
			{
				for (local i = 0; i < MAX_GUIELEMENTS; ++ i)
				{
					if (guiStructure[i].gui != -1)
					{
						if (guiStructure[i].type == 2)
						{
							if (guiStructure[i].gui.isActive() == false)
							{
								g_Active = true;
								for (local i = 0; i < MAX_GUIELEMENTS; ++ i)
								{
									if (guiStructure[i].gui != -1)
									{
										if (guiStructure[i].type == 2)
										{
											if (i != g_ID)
											{
												guiStructure[i].gui.setActive(false);
											};
										};
									};
								};
							};
						};
					};
				};
			};
		}
		else
		{
			if (g_Showed == true && g_Access == true)
			{
				g_Active = false;
			};
		};
		if (g_Move == true)
		{
			if (g_OldX == 2281337228)
			{
				g_OldX = pos.x;
				g_OldY = pos.y;
			};
			if (g_OldX > pos.x)
			{
				g_CurX = g_CurX - (g_OldX - pos.x);
			}
			else
			{
				g_CurX = g_CurX + (pos.x - g_OldX);
			};
			if (g_OldY > pos.y)
			{
				g_CurY = g_CurY - (g_OldY - pos.y);
			}
			else
			{
				g_CurY = g_CurY + (pos.y - g_OldY);
			};
			g_OldX = pos.x;
			g_OldY = pos.y;
			setTexturePosition(g_Window,g_CurX,g_CurY);
		}
		else
		{
			g_OldX = 2281337228;
			g_OldY = 2281337228;
		};
		if (g_PosX == g_CurX && g_PosY == g_CurY)
		{
			g_Reset = true;
		}
		else
		{
			g_Reset = false;
		};
	}
	
	function isActive()
	{
		return g_Active;
	}
	
	function setActive(toggle)
	{
		g_Active = toggle;
	}
	
	function isMove()
	{
		return g_Move;
	}
	
	function setMove(tog)
	{
		g_Move = tog;
	}
	
	function isReset()
	{
		return g_Reset;
	}
	
	function access(toggle)
	{
		g_Access = toggle;
	}
	
	function canMove()
	{
		return g_CanMove;
	}
	
	function setPosition(x,y)
	{
		g_PosX = x;
		g_PosY = y;
		g_CurX = x;
		g_CurY = y;
		setTexturePosition(g_Window,x,y);
	}
	
	function getPosition()
	{
		local posArr = [g_CurX,g_CurY];
		return posArr;
	}
	
	function setSize(width,height)
	{
		g_Width = width;
		g_Height = height;
		setTextureSize(g_Window,width,height);
	}
	
	function getSize()
	{
		local sizeArr = [g_Width,g_Height];
		return sizeArr;
	}
	
	function setCanMove(toggle)
	{
		g_CanMove = toggle;
	}
	
	function setTexture(texture)
	{
		destroyTexture(g_Window);
		g_Window = createTexture(g_CurX,g_CurY,g_Width,g_Height,texture);
		if (g_Showed == true)
		{
			setTextureVisible(g_Window,true);
		};
		g_Texture = texture;
	}
	
	function isShowed()
	{
		return g_Showed;
	}
	
	g_ID = 0;
	g_PosX = 0;
	g_PosY = 0;
	g_Width = 0;
	g_Height = 0;
	g_Texture = -1;
	g_Window = -1;
	g_CurX = 0;
	g_CurY = 0;
	g_OldX = 0;
	g_OldY = 0;
	g_Access = true;
	g_Reset = true;
	g_Showed = false;
	g_Active = false;
	g_Move = false;
	g_CanMove = true;
}

class GUICheckbox
{
	constructor (x,y,width,height,texture,texture_active)
	{
		g_PosX = x;
		g_CurX = x;
		g_PosY = y;
		g_CurY = y;
		g_Width = width;
		g_Height = height;
		g_Texture = texture;
		g_TextureActive = texture_active;
		
		g_Checkbox = createTexture(x,y,width,height,texture);
	}
	
	function show()
	{
		if (g_Showed == false)
		{
			g_Showed = true;
			setTextureVisible(g_Checkbox,true);
		};
	}
	
	function hide()
	{
		if (g_Showed == true)
		{
			g_Showed = false;
			setTextureVisible(g_Checkbox,false);
		};
	}
	
	function isShowed ()
	{
		return g_Showed;
	}
	
	function setPosition(x,y)
	{
		g_PosX = x;
		g_PosY = y;
	}
	
	function reset()
	{
		g_CurX = g_PosX;
		g_CurY = g_PosY;
		setTexturePosition(g_Checkbox,g_CurX,g_CurY);
	}
	
	function setSize(w,h)
	{
		g_Width = w;
		g_Height = h;
		setTextureSize(g_Checkbox,w,h);
	}
	
	function connect(window)
	{
		if (g_ConnectedWindow == -1)
		{
			for (local i = 0; i < MAX_GUIELEMENTS; ++i)
			{
				if (guiStructure[i].gui == window)
				{
					if (guiStructure[i].type == 2)
					{
						g_ConnectedWindow = guiStructure[i].gui;
					}
					else
					{
						print("That gui element is not window!");
					};
				};
			};
		};
	}
	
	function check()
	{
		local pos = getCursorPosition();
		if ((pos.x >= g_CurX && pos.x < (g_CurX + g_Width)) && (pos.y >= g_CurY && pos.y <= (g_CurY + g_Height)))
		{
			if (g_Showed == true && g_Access == true)
			{
				g_Active = true;
			};
		}
		else
		{
			if (g_Showed == true && g_Access == true)
			{
				g_Active = false;
			};
		};
		if (g_ConnectedWindow != -1)
		{
			if (g_ConnectedWindow.isMove() == true)
			{
				if (g_OldX == 2281337228)
				{
					g_OldX = pos.x;
					g_OldY = pos.y;
				};
				if (g_OldX > pos.x)
				{
					g_CurX = g_CurX - (g_OldX - pos.x);
				}
				else
				{
					g_CurX = g_CurX + (pos.x - g_OldX);
				};
				if (g_OldY > pos.y)
				{
					g_CurY = g_CurY - (g_OldY - pos.y);
				}
				else
				{
					g_CurY = g_CurY + (pos.y - g_OldY);
				};
				g_OldX = pos.x;
				g_OldY = pos.y;
				setTexturePosition(g_Checkbox,g_CurX,g_CurY);
			}
			else
			{
				g_OldX = 2281337228;
				g_OldY = 2281337228;
			};
			if (g_ConnectedWindow.isReset() == true)
			{
				g_CurX = g_PosX;
				g_CurY = g_PosY;
				setTexturePosition(g_Checkbox,g_CurX,g_CurY);
			};
		};
	}
	
	function turn(toggle)
	{
		if (toggle == true)
		{
			destroyTexture(g_Checkbox);
			g_Checkbox = createTexture(g_CurX,g_CurY,g_Width,g_Height,g_TextureActive);
			g_Turn = true;
			if (g_Showed == true)
			{
				setTextureVisible(g_Checkbox,true);
			};
		}
		else if (toggle == false)
		{
			destroyTexture(g_Checkbox);
			g_Checkbox = createTexture(g_CurX,g_CurY,g_Width,g_Height,g_Texture);
			g_Turn = false;
			if (g_Showed == true)
			{
				setTextureVisible(g_Checkbox,true);
			};
		};
	}
	
	function getPosition()
	{
		local arr = [g_CurX,g_CurY];
		return arr;
	}
	
	function getSize()
	{
		local arr = [g_Width,g_Height];
		return arr;
	}
	
	function isActive()
	{
		return g_Active;
	}

	function isTurn()
	{
		return g_Turn;
	}
	
	function disconnect()
	{
		if (g_ConnectedWindow != -1)
		{
			g_ConnectedWindow = -1;
		};
	}
	
	function getWindow()
	{
		if (g_ConnectedWindow != -1)
		{
			return g_ConnectedWindow;
		};
	}
	
	function access(toggle)
	{
		if (access == true)
		{
			g_Access = false;
		}
		else
		{
			g_Access = true;
		};
	}
	
	g_PosX = -1;
	g_PosY = -1;
	g_CurX = -1;
	g_CurY = -1;
	g_OldX = -1;
	g_OldY = -1;
	g_ConnectedWindow = -1;
	g_Texture = -1;
	g_TextureActive = -1;
	g_Width = -1;
	g_Height = -1;
	g_Checkbox = -1;
	g_Access = true;
	g_Active = false;
	g_Turn = false;
	g_Showed = false;
}

class GUITextButton
{
	constructor (text, font, x, y, r, g, b)
	{
		g_PosX = x;
		g_PosY = y;
		g_CurX = x;
		g_CurY = y;
		local resolution = getResolution();
		g_MaxX = g_CurX + ((8192.0 / resolution.width) * getTextWidth(font,text) + 20);
		g_MaxY = g_CurY + 150;
		g_R = r;
		g_G = g;
		g_B = b;
		g_AR = r;
		g_AG = g;
		g_AB = b;
		g_Text = text;
		g_Font = font;
		
		g_Button = createDraw(text, font, x, y, r,g,b, true);
		
	}
	
	function show()
	{
		setDrawVisible(g_Button,true);
		g_Showed = true;
	}
	
	function hide()
	{
		setDrawVisible(g_Button,false);
		g_Showed = false;
	}
	
	function isShowed()
	{
		return g_Showed;
	}
	
	function check()
	{
		local pos = getCursorPosition();
		if ((pos.x >= g_CurX && pos.x < (g_MaxX)) && (pos.y >= g_CurY && pos.y <= (g_MaxY)))
		{
			if (g_Showed == true && g_Access == true)
			{
				g_ButtonActive = true;
				setDrawColor(g_Button,g_AR,g_AG,g_AB);
			};
		}
		else
		{
			if (g_Showed == true && g_Access == true)
			{
				g_ButtonActive = false;
				setDrawColor(g_Button,g_R,g_G,g_B);
			};
		};
		if (g_ConnectedWindow != -1)
		{
			if (g_ConnectedWindow.isMove() == true)
			{
				if (g_OldX == 2281337228)
				{
					g_OldX = pos.x;
					g_OldY = pos.y;
				};
				if (g_OldX > pos.x)
				{
					g_CurX = g_CurX - (g_OldX - pos.x);
					g_MaxX = g_MaxX - (g_OldX - pos.x);
				}
				else
				{
					g_CurX = g_CurX + (pos.x - g_OldX);
					g_MaxX = g_MaxX + (pos.x - g_OldX);
				};
				if (g_OldY > pos.y)
				{
					g_CurY = g_CurY - (g_OldY - pos.y);
					g_MaxY = g_MaxY - (g_OldY - pos.y);
				}
				else
				{
					g_CurY = g_CurY + (pos.y - g_OldY);
					g_MaxY = g_MaxY + (pos.y - g_OldY);
				};
				g_OldX = pos.x;
				g_OldY = pos.y;
				setDrawPosition(g_Button,g_CurX,g_CurY);
			}
			else
			{
				g_OldX = 2281337228;
				g_OldY = 2281337228;
			};
			if (g_ConnectedWindow.isReset() == true)
			{
				g_CurX = g_PosX;
				g_CurY = g_PosY;
				local resolution = getResolution();
				g_MaxX = g_CurX + ((8192.0 / resolution.width) * getTextWidth(g_Font,g_Text) + 20);
				g_MaxY = g_CurY + 150;
				setDrawPosition(g_Button,g_PosX,g_PosY);
			};
		};
	}
	
	function setPosition(x,y)
	{
		g_PosX = x;
		g_PosY = y;
		g_CurX = x;
		g_CurY = y;
		local resolution = getResolution();
		g_MaxX = g_CurX + ((8192.0 / resolution.width) * getTextWidth(g_Font,g_Text) + 20);
		g_MaxY = g_CurY + 150;
		setDrawPosition(g_Button,x,y);
	}
	
	function reset()
	{
		g_CurX = g_PosX;
		g_CurY = g_PosY;
		local resolution = getResolution();
		g_MaxX = g_CurX + ((8192.0 / resolution.width) * getTextWidth(g_Font,g_Text) + 20);
		g_MaxY = g_CurY + 150;
		setDrawPosition(g_CurX,g_CurY,g_Width,g_Height,g_Texture);
	}
	
	function isActive()
	{
		return g_ButtonActive;
	}
	
	function connect(window)
	{
		for (local i = 0; i < MAX_GUIELEMENTS; ++i)
		{
			if (guiStructure[i].gui == window)
			{
				if (guiStructure[i].type == 2)
				{
					g_ConnectedWindow = guiStructure[i].gui;
				}
				else
				{
					print("That gui element is not window!");
				};
			};
		};
	}
	
	function disconnect()
	{
		if (g_ConnectedWindow != -1)
		{
			g_ConnectedWindow = -1;
		};
	}
	
	function access(toggle)
	{
		if (access == true)
		{
			g_Access = false;
		}
		else
		{
			g_Access = true;
		};
	}
	
	function setText(text)
	{
		g_Text = text;
		setDrawText(g_Button,text);
	}
	
	function getText()
	{
		return g_Text;
	}
	
	function setColor(r, g, b)
	{
		g_R = r;
		g_G = g;
		g_B = b;
		setDrawColor(g_Button,r,g,b);
	}
	
	function setActiveColor(r, g, b)
	{
		g_AR = r;
		g_AG = g;
		g_AB = b;
	}
	
	function setFont(font)
	{
		g_Font = font;
		setDrawFont(g_Button,font);
	}
	
	function getPosition()
	{
		local arr = [g_CurX,g_CurY];
		return arr;
	}
	
	onRender = 0;
	
	g_PosX = 0;
	g_PosY = 0;
	g_CurX = 0;
	g_CurY = 0;
	g_MaxX = 0;
	g_MaxY = 0;
	g_Text = -1;
	g_R = 0;
	g_G = 0;
	g_B = 0;
	g_AR = 0;
	g_AG = 0;
	g_AB = 0;
	g_Font = -1;
	g_Button = -1;
	g_Showed = false;
	g_Access = true;
	g_ConnectedWindow = -1;
	g_OldX = 0;
	g_OldY = 0;
	g_ButtonActive = false;
}

class GUIInput
{
	constructor(x,y,r,g,b,max,max_line)
	{
		g_PosX = x;
		g_CurX = x;
		g_PosY = y;
		g_CurY = y;
		g_Max = max;
		g_Input = "";
		g_MaxLine = max_line;
		
		g_InputDraw = createDraw("","Font_Old_10_White_Hi.TGA",g_CurX,g_CurY,r,g,b,true);
	}
	
	function access(toggle)
	{
		g_Access = toggle;
	}
	
	function reset()
	{
		g_CurX = g_PosX;
		g_CurY = g_PosY;
		setDrawPosition(g_InputDraw,g_PosX,g_PosY);
	}
	
	function open()
	{
		clearChatInput();
		chatInputPosition(g_CurX,g_CurY);
		setDrawVisible(g_InputDraw,false);
		chatInputToggle(true);
		chatInputSetText(g_Input);
		g_Opened = true;
	}
	
	function close()
	{
		clearChatInput();
		chatInputPosition(50,206 * getChatLines() + 465);
		chatInputToggle(false);
		g_Opened = false;
		if (g_Input.len() > g_MaxLine)
		{
			if (g_Pass == false)
			{
				setDrawText(g_InputDraw,g_Input.slice(g_Input.len() - g_MaxLine,g_Input.len()));
				if (g_Showed == true)
				{
					setDrawVisible(g_InputDraw,true);
				};
			}
			else
			{
				local pass = "";
				for (local i = 0; i < g_MaxLine; ++i)
				{
					pass = pass + "#";
				};
				setDrawText(g_InputDraw,pass);
				if (g_Showed == true)
				{
					setDrawVisible(g_InputDraw,true);
				};
			};
		}
		else
		{
			if (g_Pass == false)
			{
				setDrawText(g_InputDraw,g_Input);
				if (g_Showed == true)
				{
					setDrawVisible(g_InputDraw,true);
				};
			}
			else
			{
				local pass = "";
				for (local i = 0; i < g_Input.len(); ++i)
				{
					pass = pass + "#";
				};
				setDrawText(g_InputDraw,pass);
				if (g_Showed == true)
				{
					setDrawVisible(g_InputDraw,true);
				};
			};
		};
	}
	
	function show()
	{
		g_Showed = true;
		setDrawVisible(g_InputDraw,true);
	}
	
	function hide()
	{
		g_Showed = false;
		setDrawVisible(g_InputDraw,false);
	}
	
	function isShowed()
	{
		return g_Showed;
	}
	
	function isOpen()
	{
		return g_Opened;
	}
	
	function getInput()
	{
		return g_Input;
	}
	
	function setPosition(x,y)
	{
		g_PosX = x;
		g_PosY = y;
		g_CurX = x;
		g_CurY = y;
		setDrawPosition(g_InputDraw,x,y);
	}
	
	function setColor(r,g,b)
	{
		setDrawColor(g_InputDraw,r,g,b);
	}
	
	function setInput(text)
	{
		g_Input = text;
	}
	
	function clearInput()
	{
		clearChatInput();
		g_Input = "";
	}
	
	function isPass()
	{
		return g_Pass;
	}
	
	function setPass(toggle)
	{
		if (g_Pass == true && toggle == false)
		{
			g_MaxLine += 2;
		}
		else if (g_Pass == false && toggle == true)
		{
			g_MaxLine -= 2;
		}
		g_Pass = toggle;
		if (g_Opened == false)
		{
			if (g_Input.len() > g_MaxLine)
			{
				if (g_Pass == false)
				{
					setDrawText(g_InputDraw,g_Input.slice(g_Input.len() - g_MaxLine,g_Input.len()));
				}
				else
				{
					local pass = "";
					for (local i = 0; i < g_MaxLine; ++i)
					{
						pass = pass + "#";
					};
					setDrawText(g_InputDraw,pass);
				};
			}
			else
			{
				if (g_Pass == false)
				{
					setDrawText(g_InputDraw,g_Input);
				}
				else
				{
					local pass = "";
					for (local i = 0; i < g_Input.len(); ++i)
					{
						pass = pass + "#";
					};
					setDrawText(g_InputDraw,pass);
				};
			};
		};
	}
	
	function connect(window)
	{
		for (local i = 0; i < MAX_GUIELEMENTS; ++i)
		{
			if (guiStructure[i].gui == window)
			{
				if (guiStructure[i].type == 2)
				{
					g_ConnectedWindow = guiStructure[i].gui;
				}
				else
				{
					print("That gui element is not window!");
				};
			};
		};
	}
	
	function disconnect()
	{
		if (g_ConnectedWindow != -1)
		{
			g_ConnectedWindow = -1;
		};
	}
	
	function check()
	{
		local pos = getCursorPosition();
		if (g_ConnectedWindow != -1)
		{
			if (g_ConnectedWindow.isMove() == true)
			{
				if (g_OldX == 2281337228)
				{
					g_OldX = pos.x;
					g_OldY = pos.y;
				};
				if (g_OldX > pos.x)
				{
					g_CurX = g_CurX - (g_OldX - pos.x);
				}
				else
				{
					g_CurX = g_CurX + (pos.x - g_OldX);
				};
				if (g_OldY > pos.y)
				{
					g_CurY = g_CurY - (g_OldY - pos.y);
				}
				else
				{
					g_CurY = g_CurY + (pos.y - g_OldY);
				};
				g_OldX = pos.x;
				g_OldY = pos.y;
				setDrawPosition(g_InputDraw,g_CurX,g_CurY);
				if (g_Opened == true)
				{
					chatInputPosition(g_CurX,g_CurY);
				};
			}
			else
			{
				g_OldX = 2281337228;
				g_OldY = 2281337228;
			};
			if (g_ConnectedWindow.isReset() == true)
			{
				g_CurX = g_PosX;
				g_CurY = g_PosY;
				setDrawPosition(g_InputDraw,g_PosX,g_PosY);
				if (g_Opened == true)
				{
					chatInputPosition(g_CurX,g_CurY);
				};
			};
		};
		if (isChatInputOpen())
		{
			if (g_Opened == true)
			{
					if (g_Input.len() > g_MaxLine)
					{
						clearChatInput();
						if (g_Pass == false)
						{
							chatInputSetText(g_Input.slice(g_Input.len() - g_MaxLine,g_Input.len()));
						}
						else
						{
							local pass = "";
							for (local i = 0; i < g_MaxLine; ++i)
							{
								pass = pass + "#";
							};
							chatInputSetText(pass);
						};
					}
					else
					{
						clearChatInput();
						if (g_Pass == false)
						{
							chatInputSetText(g_Input);
						}
						else
						{
							local pass = "";
							for (local i = 0; i < g_Input.len(); ++i)
							{
								pass = pass + "#";
							};
							chatInputSetText(pass);
						};
					};
			};
		};
		if (g_Opened == true && isChatInputOpen() == false)
		{
			close();
		};
	}
	
	function getPosition()
	{
		local arr = [g_CurX,g_CurY];
		return arr;
	}
	
	function setAllowedLetters(arr)
	{
		if (arr != -1)
		{
			g_AllowedLetters = arr.map(function(value)
			{
				return value;
			});
		}
		else
		{
			g_AllowedLetters.clear();
		};
	}
	
	function setBannedLetters(arr)
	{
		g_BannedLetters = arr.map(function(value)
		{
			return value;
		});
	}
	
	function addAllowedLetter(letter)
	{
		if (g_AllowedLetters.find(letter) == null)
		{
			g_AllowedLetters.append(letter);
		};
	}
	
	function addBannedLetter(letter)
	{
		if (g_BannedLetters.find(letter) == null)
		{
			g_BannedLetters.append(letter);
		};
	}
	
	function removeAllowedLetter(letter)
	{
		if (g_AllowedLetters.len () != 0)
		{
			for (local i = 0; i < g_AllowedLetters.len(); ++i)
			{
				if (g_AllowedLetters[i] == letter)
				{
					g_AllowedLetters.remove(i);
					g_AllowedLetters.sort();
					break;
				};
			};
		};
	}
	
	function removeBannedLetter(letter)
	{
		if (g_BannedLetters.len () != 0)
		{
			for (local i = 0; i < g_BannedLetters.len(); ++i)
			{
				if (g_BannedLetters[i] == letter)
				{
					g_BannedLetters.remove(i);
					g_BannedLetters.sort();
					break;
				};
			};
		};
	}
	
	function letterIsAllowed(letter)
	{
		if (g_AllowedLetters.len() != 0)
		{
			if (g_AllowedLetters.find(letter) != null)
			{
				return true;
			}
			else
			{
				return false;
			};
		}
		else
		{
			return true;
		};
	}
	
	function letterIsBanned(letter)
	{
		if (g_BannedLetters.len() != 0)
		{
			if (g_BannedLetters.find(letter) != null)
			{
				return true;
			}
			else
			{
				return false;
			};
		}
		else
		{
			return false;
		};
	}
	
	g_PosX = -1;
	g_PosY = -1;
	g_CurX = -1;
	g_CurY = -1;
	g_OldX = -1;
	g_OldY = -1;
	g_Input = "";
	g_Max = -1;
	g_MaxLine = -1;
	g_ConnectedWindow = -1;
	g_InputDraw = -1;
	g_Opened = false;
	g_AllowedLetters = [];
	g_BannedLetters = [];
	g_Access = true;
	g_Showed = false;
	g_Pass = false;
}

class GUIList
{
	constructor (type,max_visible,limited)
	{
		if (type > 0 && type < 6)
		{
			if (type == 1)
			{
				g_Type = 1;
			}
			else if (type == 2)
			{
				g_Type = 4;
			};
			g_MaxVisible = max_visible;
			g_Limited = limited;
		};
	}
	
	function addElement(element)
	{
		for (local i = 0; i < MAX_GUIELEMENTS; ++i)
		{
			if (guiStructure[i].gui == element)
			{
				if (guiStructure[i].type == g_Type)
				{
					g_Elements.append(guiStructure[i].gui);
					local pos = guiStructure[i].gui.getPosition();
					g_ElementsOldPosition.append([pos[0],pos[1]]);
				};
			};
		};
	}
	
	function deleteElement(element)
	{
		if (g_Elements.len() != 0)
		{
			for (local i = 0; i < g_Elements.len(); ++i)
			{
				if (g_Elements[i] == element)
				{
					g_Elements.remove(i);
					g_ElementsOldPosition.remove(i);
					if (g_MaxVisible > g_Elements.len())
					{
						g_MaxVisible = g_Elements.len();
					};
				};
			};
		};
	}
	
	function posElement(element,position)
	{
		if (position > -1 && position < (g_Elements.len() - 1))
		{
			local swap = g_Elements[position];
			local swapPosition = g_ElementsOldPosition[position];
			for (local i = 0; i < g_Elements.len(); ++i)
			{
				if (g_Elements[i] == element)
				{
					g_Elements[position] = g_Elements[i];
					g_Elements[i] = swap;
					g_ElementsOldPosition[position] = g_ElementsOldPosition[i];
					g_ElementsOldPosition[i] = swapPosition;
				};
			};
		};
	}
	
	function setMaxVisible(max_visible)
	{
		if (max_visible > 0 && max_visible <= g_Elements.len())
		{
			g_MaxVisible = max_visible;
		};
	}
	
	function getMaxVisible()
	{
		return g_MaxVisible;
	}
	
	function getElements()
	{
		return g_Elements.len();
	}
	
	function show()
	{
		g_Showed = true;
		g_Scroll = 0;
	}
	
	function hide()
	{
		g_Showed = false;
		for (local i = 0; i < g_Elements.len(); ++i)
		{
			g_Elements[i].g_ButtonActive = false;
		}
	}
	
	function isShowed()
	{
		return g_Showed;
	}
	
	function connect(window)
	{
		for (local i = 0; i < MAX_GUIELEMENTS; ++i)
		{
			if (guiStructure[i].gui == window)
			{
				if (guiStructure[i].type == 2)
				{
					for (local j = 0; j < g_Elements.len(); ++j)
					{
						g_Elements[j].disconnect();
						g_Elements[j].connect(window);
					};
				};
			};
		};
	}
	
	function disconnect()
	{
		for (local i = 0; i < g_Elements.len(); ++i)
		{
			g_Elements[j].disconnect();
		};
	}
	
	function setPosition(position,x,y)
	{
		if (g_ElementsPosition.len() != 0)
		{
			if (position > (g_ElementsPosition.len() -1))
			{
				local need = position - (g_ElementsPosition.len() - 1);
				for (local i = 0; i < need; ++i)
				{
					g_ElementsPosition.append([0,0]);
				};
				g_ElementsPosition[position] = [x,y];
			}
			else
			{
				g_ElementsPosition[position] = [x,y];
			};
		}
		else
		{
			g_ElementsPosition.append([x,y]);
		};
	}
	
	function scroll(side)
	{
		if (side == 0)
		{
			if (g_Limited == false)
			{
				if (g_Scroll > 0)
				{
					g_Scroll -= 1;
				}
				else
				{
					g_Scroll = g_MaxVisible;
				};
			}
			else
			{
				if (g_Scroll != 0)
				{
					g_Scroll -= 1;
				};
			};
		}
		else if (side == 1)
		{
			if (g_Limited == false)
			{
				if (g_Scroll < g_MaxVisible)
				{
					g_Scroll += 1;
				}
				else
				{
					g_Scroll = 0;
				};
			}
			else
			{
				if ((g_Scroll + g_MaxVisible) < g_Elements.len())
				{
					g_Scroll += 1;
				};
			};
		};
	}

	function check()
	{
			if (g_Elements.len() != 0)
			{
				if (g_MaxVisible <= g_Elements.len())
				{
					if (g_MaxVisible <= g_ElementsPosition.len())
					{
						for (local i = 0; i < g_Elements.len(); ++i)
						{
							g_Elements[i].hide();
							if (g_Showed == true)
							{
								local pos = 0;
								for (local j = g_Scroll; j < (g_Scroll + g_MaxVisible); ++j)
								{
									if (j <= (g_Elements.len() - 1))
									{
										g_Elements[j].show();
										g_Elements[j].setPosition(g_ElementsPosition[pos][0],g_ElementsPosition[pos][1]);
										pos += 1;
									}
									else
									{
										local need = j - (g_Elements.len() - 1);
										for (local k = 0; k < need; ++k)
										{
											g_Elements[k].show();
											g_Elements[k].setPosition(g_ElementsPosition[pos][0],g_ElementsPosition[pos][1]);
											pos += 1;
										};
									};
								};
							};
						};
					};
				};
			};
	}

	g_Showed = false;
	g_Limited = false;
	g_Scroll = 0;
	g_MaxVisible = 0;
	g_Type = 0;
	g_Elements = [];
	g_ElementsPosition = [];
	g_ElementsOldPosition = [];
}

class GUISlider
{
	constructor(tex,x,y,max,wh,type,list)
	{
		g_PosX = x;
		g_PosY = y;
		g_CurX = x;
		g_CurY = y;
		g_Max = max;
		g_WidthHeight = wh;
		g_Type = type;
		g_Texture = tex;
		for (local i = 0; i < MAX_GUIELEMENTS; ++i)
		{
			if (guiStructure[i].type == 6)
			{
				if (guiStructure[i].gui == list)
				{
					g_List = list;
				};
			};
		};
		
		local elements = g_List.getElements();
		g_Elements = elements - 1;
		if (g_List.g_Scroll > g_Elements)
		{
			g_Scroll = g_Elements;
		}
		else
		{
			g_Scroll = g_List.g_Scroll;
		};
		if (type == 0)
		{
			g_OneScroll = (max - y) / g_Elements;
			g_Slider = createTexture(x,y,wh,g_OneScroll,tex);
			setTexturePosition(g_Slider,g_CurX,g_CurY + (g_Scroll * g_OneScroll));
		}
		else if (type == 1)
		{
			g_OneScroll = (max - x) / g_Elements;
			g_Slider = createTexture(x,y,g_OneScroll,wh,tex);
			setTexturePosition(g_Slider,g_CurX + (g_Scroll * g_OneScroll),g_CurY);
		};
	}
	
	function show()
	{
		g_Showed = true;
		setTextureVisible(g_Slider,true);
		g_Scroll = g_List.g_Scroll;
		if (g_Type == 0)
		{
			setTexturePosition(g_Slider,g_CurX,g_CurY + (g_Scroll * g_OneScroll));
		}
		else
		{
			setTexturePosition(g_Slider,g_CurX + (g_Scroll * g_OneScroll),g_CurY);
		};
	}
	
	function hide()
	{
		g_Showed = false;
		setTextureVisible(g_Slider,false);
	}
	
	function isShowed()
	{
		return g_Showed;
	}
	
	function check()
	{
		local pos = getCursorPosition();
		if (g_Type == 0)
		{
			local posy = g_PosY + (g_Scroll * g_OneScroll);
			if (((pos.y >= posy) && (pos.y <= (posy + g_OneScroll))) && ((pos.x >= g_PosX) && (pos.x <= (g_PosX + g_WidthHeight))))
			{
				g_Active = true;
				for (local i = 0; i < MAX_GUIELEMENTS; ++i)
				{
					if (guiStructure[i].type == 2 && guiStructure[i].gui.isActive())
					{
						guiStructure[i].gui.setActive(false);
					};
				};
			}
			else
			{
				g_Active = false;
			};
		}
		else if (g_Type == 1)
		{
			local posx = g_PosX + (g_Scroll * g_OneScroll);
			if (((pos.x >= posx) && (pos.x <= (posx + g_OneScroll))) && ((pos.y >= g_PosY) && (pos.y <= (g_PosY + g_WidthHeight))))
			{
				g_Active = true;
				for (local i = 0; i < MAX_GUIELEMENTS; ++i)
				{
					if (guiStructure[i].type == 2 && guiStructure[i].gui.isActive())
					{
						guiStructure[i].gui.setActive(false);
					};
				};
			}
			else
			{
				g_Active = false;
			};
		};
		if (g_Move == true)
		{
			local pos = getCursorPosition();
			if (g_Type == 0)
			{
				local much = (pos.y/g_OneScroll);
				if (g_MuchY == -1)
				{
					g_MuchY = (pos.y/g_OneScroll);
				};
				if (g_MuchY > much)
				{
					if ((g_MuchY - much) >= 1)
					{
						g_List.scroll(0);
						g_Scroll = g_List.g_Scroll;
						setTexturePosition(g_Slider,g_CurX,g_CurY + (g_Scroll * g_OneScroll));
						g_MuchY = (pos.y/g_OneScroll);
					};
				}
				else
				{
					if ((much - g_MuchY) >= 1)
					{
						g_List.scroll(1);
						g_Scroll = g_List.g_Scroll;
						setTexturePosition(g_Slider,g_CurX,g_CurY + (g_Scroll * g_OneScroll));
						g_MuchY = (pos.y/g_OneScroll);
					};
				};
			}
			else
			{
				local much = (pos.x/g_OneScroll);
				if (g_MuchX == -1)
				{
					g_MuchX = (pos.x/g_OneScroll);
				};
				if (g_MuchX > much)
				{
					if ((g_MuchX - much) >= 1)
					{
						g_List.scroll(0);
						g_Scroll = g_List.g_Scroll;
						setTexturePosition(g_Slider,g_CurX + (g_Scroll * g_OneScroll),g_CurY);
						g_MuchY = (pos.x/g_OneScroll);
					};
				}
				else
				{
					if ((much - g_MuchX) >= 1)
					{
						g_List.scroll(1);
						g_Scroll = g_List.g_Scroll;
						setTexturePosition(g_Slider,g_CurX + (g_Scroll * g_OneScroll),g_CurY);
						g_MuchY = (pos.x/g_OneScroll);
					};
				};
			};
		};
		if (g_ConnectedWindow != -1)
		{
			if (g_ConnectedWindow.isMove() == true)
			{
				if (g_OldX == 2281337228)
				{
					g_OldX = pos.x;
					g_OldY = pos.y;
				};
				if (g_OldX > pos.x)
				{
					g_CurX = g_CurX - (g_OldX - pos.x);
				}
				else
				{
					g_CurX = g_CurX + (pos.x - g_OldX);
				};
				if (g_OldY > pos.y)
				{
					g_CurY = g_CurY - (g_OldY - pos.y);
				}
				else
				{
					g_CurY = g_CurY + (pos.y - g_OldY);
				};
				g_OldX = pos.x;
				g_OldY = pos.y;
				if (g_Type == 0)
				{
					setTexturePosition(g_Slider,g_CurX,g_CurY + (g_Scroll * g_OneScroll));
				}
				else
				{
					setTexturePosition(g_Slider,g_CurX + (g_Scroll * g_OneScroll),g_CurY);
				};
			}
			else
			{
				g_OldX = 2281337228;
				g_OldY = 2281337228;
			};
			if (g_ConnectedWindow.isReset() == true)
			{
				g_CurX = g_PosX;
				g_CurY = g_PosY;
				if (g_Type == 0)
				{
					setTexturePosition(g_Slider,g_PosX,g_PosY + (g_Scroll * g_OneScroll));
				}
				else
				{
					setTexturePosition(g_Slider,g_PosX + (g_Scroll * g_OneScroll),g_PosY);
				};
			};
		};
	}
	
	function connect(window)
	{
		for (local i = 0; i < MAX_GUIELEMENTS; ++i)
		{
			if (guiStructure[i].gui == window)
			{
				if (guiStructure[i].type == 2)
				{
					g_ConnectedWindow = guiStructure[i].gui;
				}
				else
				{
					print("That gui element is not window!");
				};
			};
		};
	}
	
	function disconnect()
	{
		if (g_ConnectedWindow != -1)
		{
			g_ConnectedWindow = -1;
		};
	}
	
	function isActive()
	{
		return g_Active;
	}
	
	g_Showed = false;
	g_List = -1;
	g_WidthHeight = -1;
	g_PosX = -1;
	g_PosY = -1;
	g_CurX = -1;
	g_CurY = -1;
	g_MuchY = -1;
	g_MuchX = -1;
	g_OldX = -1;
	g_OldY = -1;
	g_Max = -1;
	g_Texture = -1;
	g_Type = 0;
	g_Scroll = 0;
	g_ConnectedWindow = -1;
	g_OneScroll = 0;
	g_Slider = -1;
	g_Active = false;
	g_Move = false;
	g_Elements = -1;
}

class GUINotify
{
	constructor(x,y,max_x,max_y,time,font,text)
	{
		g_PosX = x;
		g_PosY = y;
		g_MaxX = max_x;
		g_MaxY = max_y;
		g_CurX = x;
		g_CurY = y;
		g_R = 255;
		g_G = 255;
		g_B = 255;
		g_Time = time;
		g_Font = font;
		g_Text = text;
		
		g_Notify = createDraw(text,font,x,y,g_R,g_B,g_B,true);
		
		if (g_PosX <= g_MaxX)
		{
			g_StepX = 0;
			g_OneStepX = (g_MaxX - g_PosX + 0.0) / g_Time;
		}
		else
		{
			g_StepX = 1;
			g_OneStepX = (g_PosX - g_MaxX + 0.0) / g_Time;
		};
		if (g_PosY <= g_MaxY)
		{
			g_StepY = 0;
			g_OneStepY = (g_MaxY - g_PosY + 0.0) / g_Time;
		}
		else
		{
			g_StepY = 1;
			g_OneStepY = (g_PosY - g_MaxY + 0.0) / g_Time;
		};
	}
	
	function show()
	{
		if (g_Started == false)
		{
			g_Showed = true;
		};
	}
	
	function check()
	{
		if (g_Showed == true && g_AccessNotify == false)
		{
			local isX,isY;
			if (g_StepX == 0)
			{
				if ((g_MaxX - g_PosX) >= 200)
				{
					if ((g_CurX - g_PosX) >= 200)
					{
						isX = true;
					};
				}
				else
				{
					isX = true;
				};
			}
			else
			{
				if ((g_PosX - g_MaxX) >= 200)
				{
					if ((g_PosX - g_CurX) >= 200)
					{
						isX = true;
					};
				}
				else
				{
					isX = true;
				};
			};
			if (g_StepY == 0)
			{
				if ((g_MaxY - g_PosY) >= 200)
				{
					if ((g_CurY - g_PosY) >= 200)
					{
						isY = true;
					};
				}
				else
				{
					isY = true;
				};
			}
			else
			{
				if ((g_PosY - g_MaxY) >= 200)
				{
					if ((g_PosY - g_CurY) >= 200)
					{
						isY = true;
					};
				}
				else
				{
					isY = true;
				};
			};
			if (isX == true && isY == true)
			{
				notifyShow = false;
				g_AccessNotify = true;
			};
		};
		if (g_Showed == true && g_Started == false)
		{
			if (notifyShow == false)
			{
				notifyShow = true;
				setDrawVisible(g_Notify,true);
				g_Started = true;
			};
		};
		if (g_Showed == true && g_Started == true)
		{
			if (g_CurTime != g_Time)
			{
				if (g_Alpha != 255)
				{
					g_Alpha += 5;
					setDrawColor(g_Notify,g_R,g_G,g_B,g_Alpha);
				};
				if (g_StepX == 0)
				{
					g_CurX = g_CurX + g_OneStepX;
				}
				else
				{
					g_CurX = g_CurX - g_OneStepX;
				};
				if (g_StepY == 0)
				{
					g_CurY = g_CurY + g_OneStepY;
				}
				else
				{
					g_CurY = g_CurY - g_OneStepY;
				};
				setDrawPosition(g_Notify,g_CurX,g_CurY);
				g_CurTime += 1;
			}
			else
			{
				if (g_Alpha != 0)
				{
					g_Alpha -= 5;
					setDrawColor(g_Notify,g_R,g_G,g_B,g_Alpha);
					if (g_StepX == 0)
					{
						g_CurX = g_CurX + g_OneStepX;
					}
					else
					{
						g_CurX = g_CurX - g_OneStepX;
					};
					if (g_StepY == 0)
					{
						g_CurY = g_CurY + g_OneStepY;
					}
					else
					{
						g_CurY = g_CurY - g_OneStepY;
					};
					setDrawPosition(g_Notify,g_CurX,g_CurY);
				}
				else
				{
					setDrawVisible(g_Notify,false);
					setDrawPosition(g_Notify,g_PosX,g_PosY);
					g_CurX = g_PosX;
					g_CurY = g_PosY;
					g_Showed = false;
					g_Started = false;
					g_AccessNotify = false;
					g_Alpha = 0;
					g_CurTime = 0;
				};
				
			};
		};
	}
	
	function setPosition(x,y)
	{
		g_PosX = x;
		g_PosY = y;
	}
	
	function getPosition()
	{
		local arr = [g_CurX,g_CurY];
		return arr;
	}
	
	function setText(text)
	{
		setDrawText(g_Notify,text);
		g_Text = text;
	}
	
	function getText()
	{
		return g_Text;
	}
	
	function setFont(font)
	{
		setDrawFont(g_Notify,font);
		g_Font = font;
	}
	
	function isShowed()
	{
		return g_Showed;
	}
	
	function setColor(r,g,b)
	{
		setDrawColor(g_Notify,r,g,b);
		g_R = r;
		g_G = g;
		g_B = b;
	}
	
	function getColor()
	{
		local arr = [g_R,g_G,g_B];
		return arr;
	}
	
	g_PosX = -1;
	g_PosY = -1;
	g_MaxX = -1;
	g_MaxY = -1;
	g_CurX = -1;
	g_CurY = -1;
	g_CurTime = 0;
	g_OneStepY = 0;
	g_OneStepX = 0;
	g_StepX = -1;
	g_StepY = -1;
	g_R = -1;
	g_G = -1;
	g_B = -1;
	g_Alpha = 0;
	g_Time = -1;
	g_Font = -1;
	g_Text = -1;
	g_Notify = -1;
	g_AccessNotify = false;
	g_Showed = false;
	g_Started = false;
	g_Timer = -1;
}

function createGUIButton(x,y,width,height,texture)
{
	local id = getGUIid();
	guiStructure[id].gui = GUIButton(x,y,width,height,texture);
	guiStructure[id].type = 1;
	return guiStructure[id].gui;
};

function createGUIWindow(x,y,width,height,texture)
{
	local id = getGUIid();
	guiStructure[id].gui = GUIWindow(x,y,width,height,texture, id);
	guiStructure[id].type = 2;
	return guiStructure[id].gui;
}

function createGUICheckbox(x,y,width,height,texture,texture_active)
{
	local id = getGUIid();
	guiStructure[id].gui = GUICheckbox(x,y,width,height,texture,texture_active);
	guiStructure[id].type = 3;
	return guiStructure[id].gui;
}

function createGUITextButton(text,font,x,y,r,g,b)
{
	local id = getGUIid();
	guiStructure[id].gui = GUITextButton(text,font,x,y,r,g,b);
	guiStructure[id].type = 4;
	return guiStructure[id].gui;
}

function createGUIInput(x,y,r,g,b,max,max_line)
{
	local id = getGUIid();
	guiStructure[id].gui = GUIInput(x,y,r,g,b,max,max_line);
	guiStructure[id].type = 5;
	return guiStructure[id].gui;
}

function createGUIList(type,max_visible,limited)
{
	local id = getGUIid();
	guiStructure[id].gui = GUIList(type,max_visible,limited);
	guiStructure[id].type = 6;
	return guiStructure[id].gui;
}

function createGUISlider(texture,x,y,max,wh,type,list)
{
	local id = getGUIid();
	guiStructure[id].gui = GUISlider(texture,x,y,max,wh,type,list);
	guiStructure[id].type = 7;
	return guiStructure[id].gui;
}

function createGUINotify(x,y,max_x,max_y,time,font,text)
{
	local id = getGUIid();
	guiStructure[id].gui = GUINotify(x,y,max_x,max_y,time,font,text);
	guiStructure[id].type = 8;
	return guiStructure[id].gui;
}

function getGUIid()
{
	for (local i = 0; i < MAX_GUIELEMENTS; ++i)
	{
		if (guiStructure[i].gui == -1)
		{
			return i;
			break;
		};
	};
};

function enableWindowsMovement(toggle)
{
	WINDOW_MOVEMENT = toggle;
};

addEvent("onKey",function(key,letter)
{
	for (local j = 0; j < MAX_GUIELEMENTS; ++j)
	{
		if (guiStructure[j].type == 5)
		{
			if (guiStructure[j].gui.isOpen() == true)
			{
				clearChatInput();
				if (key == KEY_BACK)
				{
					for (local i = 0; i < MAX_GUIELEMENTS; ++i)
					{
						if (guiStructure[i].type == 5)
						{
							if (guiStructure[i].gui.isOpen())
							{
								local text = guiStructure[i].gui.getInput();
								if (text.len() > 0)
								{
									text = text.slice(0,text.len() - 1);
									guiStructure[i].gui.setInput(text);
								};
							};
						};
					};
				}
				else
				{
					for (local i = 0; i < MAX_GUIELEMENTS; ++i)
					{
						if (guiStructure[i].type == 5)
						{
							if (guiStructure[i].gui.isOpen())
							{
								if (guiStructure[i].gui.letterIsAllowed(letter) && guiStructure[i].gui.letterIsBanned(letter) == false)
								{
									local text = guiStructure[i].gui.g_Input + "" + letter;
									if (text.len() > guiStructure[i].gui.g_Max)
									{
										text = text.slice(0,guiStructure[i].gui.g_Max);
										guiStructure[i].gui.setInput(text);
									}
									else
									{
										guiStructure[i].gui.setInput(text);
									};
								};
							};
						};
					};
				};
			};
		};
	};
});

addEvent("onRender",function()
{
	for (local i = 0; i < MAX_GUIELEMENTS; ++i)
	{
		if (guiStructure[i].type != 0)
		{
			guiStructure[i].gui.check();
		};
	};
});

addEvent("onClick",function(key, xpos, ypos, wheel)
{
	if (WINDOW_MOVEMENT == true)
	{
		for (local i = 0; i < MAX_GUIELEMENTS; ++i)
		{
			if (guiStructure[i].type == 2)
			{
				if (guiStructure[i].gui.isActive() == true && guiStructure[i].gui.canMove() == true)
				{
					if (key == "LEFT_DOWN")
					{
						guiStructure[i].gui.setMove(true);
					};
				};
			}
			else if (guiStructure[i].type == 7)
			{
				if (guiStructure[i].gui.g_Active == true)
				{
					if (key == "LEFT_DOWN")
					{
						guiStructure[i].gui.g_Move = true;
					};
				};
			};
		};
	};
	for (local i = 0; i < MAX_GUIELEMENTS; ++i)
	{
		if (guiStructure[i].type == 2 || guiStructure[i].type == 7)
		{
			if (guiStructure[i].gui.g_Move == true)
			{
				if (key == "LEFT_UP")
				{
					guiStructure[i].gui.g_Move = false;
					if (guiStructure[i].type == 7)
					{
						guiStructure[i].gui.g_MuchY = -1;
					}
				};
			};
		};
	};
	for (local i = 0; i < MAX_GUIELEMENTS; ++i)
	{
		if (guiStructure[i].type == 3)
		{
			if (guiStructure[i].gui.isActive() == true)
			{
				if (key == "LEFT_DOWN")
				{
					if (guiStructure[i].gui.isTurn() == false)
					{
						guiStructure[i].gui.turn(true);
					}
					else
					{
						guiStructure[i].gui.turn(false);
					};
				};
			};
		};
	};
});