
local res = getResolution(); 
local a = res.width; 
local b = res.height; 
local pix = 37.79527559055; 
local inc = 0.39; 
local dia = sqrt(a*a + b*b); 
local dia_to_sm = (dia/pix); 
local sm_to_inc = (dia_to_sm.tointeger() * inc); 
local ppi = dia/sm_to_inc;
ppi = ppi.tointeger();

// Getting translations

local trans = getTranslations();

//

// JUST FOR TEST. DELETE
local servername = "Test MMORPG";
//

// Login / Registration

local reg_window = createGUIWindow(30.66326530612245 * ppi,30.1530612244898 * ppi,21.42857142857143 * ppi,28.41836734693878 * ppi,"MENU_INGAME.TGA");
reg_window.access(false);
local reg_passfield = createGUIButton(38.41836734693878 * ppi,38.21428571428571 * ppi,12.55102040816327 * ppi,3.010204081632653 * ppi,"INV_TITEL.TGA");
local reg_hidepass = createGUIButton(47.70408163265306 * ppi,41.93877551020408 * ppi,2.755102040816327 * ppi,3.418367346938776 * ppi,"INV_TITEL.TGA");
local reg_login = createGUIButton(38.72448979591837 * ppi,47.6530612244898 * ppi,6.173469387755102 * ppi,3.979591836734694 * ppi,"INV_TITEL.TGA");
local reg_register = createGUIButton(37.09183673469388 * ppi,52.19387755102041 * ppi,9.693877551020408 * ppi,4.23469387755102 * ppi,"INV_TITEL.TGA");

local regdraw_header = createGUITextButton(servername,"Font_Old_20_White_Hi.TGA",35.1530612244898 * ppi,30.66326530612245 * ppi,255,255,255);
local regdraw_password = createGUITextButton(trans[0].reg_password.text,"Font_Old_10_White_Hi.TGA",31.88775510204082 * ppi,38.77551020408163 * ppi,255,255,255);
local regdraw_hidepassword = createGUITextButton(trans[0].reg_hidepassword.text,"Font_Old_10_White_Hi.TGA",38.87755102040816 * ppi,42.60204081632653 * ppi,255,255,255);
local regdraw_hidepassword_mark = createGUITextButton("X","Font_Old_20_White_Hi.TGA",48.46938775510204 * ppi,41.78571428571429 * ppi,255,255,255);
local regdraw_wrongpass = createGUITextButton(trans[0].reg_wrongpassword.text,"Font_Old_10_White_Hi.TGA",35.96938775510204 * ppi,34.94897959183673 * ppi,255,0,0);
local regdraw_accountde = createGUITextButton(trans[0].reg_accountde.text,"Font_Old_10_White_Hi.TGA",35.35714285714286 * ppi,34.94897959183673 * ppi,255,0,0);
local regdraw_login = createGUITextButton(trans[0].reg_login.text,"Font_Old_10_White_Hi.TGA",40.30612244897959 * ppi,48.62244897959184 * ppi,255,255,255);
local regdraw_registration = createGUITextButton(trans[0].reg_registration.text,"Font_Old_10_White_Hi.TGA",38.31632653061224 * ppi,53.36734693877551 * ppi,255,255,255);
local regdraw_exit = createGUITextButton(trans[0].reg_exit.text,"Font_Old_10_White_Hi.TGA",49.08163265306122 * ppi,55.66326530612245 * ppi,255,255,255);
regdraw_exit.setActiveColor(255,255,0);

local reg_pass_allowed = ["q","Q","w","W","e","E","r","R","t","T","y","Y","u","U","i","I","o","O","p","P","a","A","s","S","d","D","f","F","g","G","h","H","j","J","k","K","l","L","z","Z","X","c","C","v","V","b","B","n","N","m","M","1","2","3","4","5","6","7","8","9","0"];

local reg_password_input = createGUIInput(39.38775510204082 * ppi,38.72448979591837 * ppi,255,255,255,13,13);
reg_password_input.setAllowedLetters(reg_pass_allowed);
reg_password_input.setPass(true);

// Locals

local reg_open = false;
local reg_passhidden = true;
local reg_mark_tap = false;
local reg_login_tap = false;
local reg_register_tap = false;
local reg_tim = -1;

function gui_ShowRegistration()
{
	reg_window.show();
	reg_passfield.show();
	reg_hidepass.show();
	reg_login.show();
	reg_register.show();
	
	regdraw_header.show();
	regdraw_password.show();
	regdraw_hidepassword.show();
	regdraw_hidepassword_mark.show();
	regdraw_login.show();
	regdraw_registration.show();
	regdraw_exit.show();
	
	reg_password_input.show();
	
	reg_open = true;
	reg_passhidden = true;
	reg_mark_tap = false;
	reg_login_tap = false;
	reg_register_tap = false;
}

function gui_HideRegistration()
{
	reg_window.hide();
	reg_passfield.hide();
	reg_hidepass.hide();
	reg_login.hide();
	reg_register.hide();
	
	regdraw_header.hide();
	regdraw_password.hide();
	regdraw_hidepassword.hide();
	regdraw_hidepassword_mark.hide();
	regdraw_login.hide();
	regdraw_registration.hide();
	regdraw_exit.hide();
	
	reg_password_input.hide();
	
	reg_open = false;
}

function gui_regSetButtonsColors()
{
	if (reg_hidepass.isActive())
	{
		regdraw_hidepassword_mark.setColor(255,255,0);
		regdraw_hidepassword_mark.setActiveColor(255,255,0);
	}
	else
	{
		regdraw_hidepassword_mark.setColor(255,255,255);
		regdraw_hidepassword_mark.setActiveColor(255,255,255);
	}
	
	if (reg_login.isActive())
	{
		regdraw_login.setColor(255,255,0);
		regdraw_login.setActiveColor(255,255,0);
	}
	else
	{
		regdraw_login.setColor(255,255,255);
		regdraw_login.setActiveColor(255,255,255);
	}
	
	if (reg_register.isActive())
	{
		regdraw_registration.setColor(255,255,0);
		regdraw_registration.setActiveColor(255,255,0);
	}
	else
	{
		regdraw_registration.setColor(255,255,255);
		regdraw_registration.setActiveColor(255,255,255);
	}
}

function gui_regAnimateButtons()
{
	if (reg_mark_tap == false)
	{
		if (reg_hidepass.isActive())
		{
			reg_mark_tap = true;
			local pos = regdraw_hidepassword_mark.getPosition();
			regdraw_hidepassword_mark.setPosition(pos[0] + 10,pos[1] + 10);
		}
	}
	else
	{
		reg_mark_tap = false;
		local pos = regdraw_hidepassword_mark.getPosition();
		regdraw_hidepassword_mark.setPosition(pos[0] - 10,pos[1] - 10);
	}
	
	if (reg_login_tap == false)
	{
		if (reg_login.isActive())
		{
			reg_login_tap = true;
			local pos = regdraw_login.getPosition();
			regdraw_login.setPosition(pos[0] + 10,pos[1] + 10);
		}
	}
	else
	{
		reg_login_tap = false;
		local pos = regdraw_login.getPosition();
		regdraw_login.setPosition(pos[0] - 10,pos[1] - 10);
	}
	
	if (reg_register_tap == false)
	{
		if (reg_register.isActive())
		{
			reg_register_tap = true;
			local pos = regdraw_registration.getPosition();
			regdraw_registration.setPosition(pos[0] + 10,pos[1] + 10);
		}
	}
	else
	{
		reg_register_tap = false;
		local pos = regdraw_registration.getPosition();
		regdraw_registration.setPosition(pos[0] - 10,pos[1] - 10);
	}
}

function gui_regConfirm()
{
	if (regdraw_exit.isActive())
	{
		exitGame();
	}
	else if (reg_register.isActive())
	{
		//need check account
		//next code is just for tests
		local have_account = false;
		if (have_account == false)
		{
			gui_HideRegistration();
		}
		else
		{
			if (reg_tim != -1)
			{
				killTimer(reg_tim);
				reg_tim = -1;
				regdraw_accountde.hide();
				regdraw_wrongpass.hide();
			}
			regdraw_accountde.show();
			reg_tim = setTimer(function()
			{
				regdraw_accountde.hide();
				reg_tim = -1;
			},3000,false);
		}
	}
	else if (reg_login.isActive())
	{
		//need check account
		//next code is just for tests
		local right_pass = false;
		if (right_pass == true)
		{
			gui_HideRegistration();
		}
		else
		{
			if (reg_tim != -1)
			{
				killTimer(reg_tim);
				reg_tim = -1;
				regdraw_accountde.hide();
				regdraw_wrongpass.hide();
			}
			p_setPasswordTry(p_getPasswordTry() + 1);
			if (p_getPasswordTry() > 3)
			{
				exitGame();
			}
			else
			{
				regdraw_wrongpass.setText(trans[0].reg_wrongpassword.text + " (" + p_getPasswordTry() + "/3)");
				regdraw_wrongpass.show();
				reg_tim = setTimer(function()
				{
					regdraw_wrongpass.hide();
					reg_tim = -1;
				},3000,false);
			}
		}
	}
	else if (reg_hidepass.isActive())
	{
		if (reg_password_input.isPass())
		{
			reg_password_input.setPass(false);
			regdraw_hidepassword_mark.hide();
		}
		else
		{
			reg_password_input.setPass(true);
			regdraw_hidepassword_mark.show();
		}
	}
	
	if (reg_passfield.isActive())
	{
		if (!reg_password_input.isOpen())
		{
			reg_password_input.open();
		}
	}
	else
	{
		if (reg_password_input.isOpen())
		{
			reg_password_input.close();
		}
	}
}

addEvent("onClick",function(key,x,y,wheel)
{
	if (key == "LEFT_DOWN")
	{
		gui_regAnimateButtons();
	}
	else
	{
		gui_regAnimateButtons();
		gui_regConfirm();
	}
});

addEvent("onRender",function()
{
	gui_regSetButtonsColors();
});


addEvent("onRespawn",function()
{
	gui_ShowRegistration();
});