
enableDebugMode(true);

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
local lang = 2;

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
local reg_help_01 = createGUIButton(52.04081632653061 * ppi,30.61224489795918 * ppi,20.91836734693878 * ppi,7.142857142857143 * ppi,"MENU_INGAME.TGA");
local reg_help_02 = createGUIButton(52.04081632653061 * ppi,38.26530612244898 * ppi,20.91836734693878 * ppi,7.142857142857143 * ppi,"MENU_INGAME.TGA");
local reg_help_03 = createGUIButton(52.04081632653061 * ppi,45.91836734693878 * ppi,20.91836734693878 * ppi,7.142857142857143 * ppi,"MENU_INGAME.TGA");
local reg_help_04 = createGUIButton(52.04081632653061 * ppi,53.57142857142857 * ppi,20.91836734693878 * ppi,3.571428571428571 * ppi,"MENU_INGAME.TGA");
local reg_help_05 = createGUIButton(52.04081632653061 * ppi,53.57142857142857 * ppi,20.91836734693878 * ppi,8.673469387755102 * ppi,"MENU_INGAME.TGA");
local reg_help_01_frame = createGUIButton(52.04081632653061 * ppi,30.61224489795918 * ppi,20.91836734693878 * ppi,7.142857142857143 * ppi,"INV_SLOT_HIGHLIGHTED.TGA");
local reg_help_02_frame = createGUIButton(52.04081632653061 * ppi,38.26530612244898 * ppi,20.91836734693878 * ppi,7.142857142857143 * ppi,"INV_SLOT_HIGHLIGHTED.TGA");
local reg_help_03_frame = createGUIButton(52.04081632653061 * ppi,45.91836734693878 * ppi,20.91836734693878 * ppi,7.142857142857143 * ppi,"INV_SLOT_HIGHLIGHTED.TGA");
local reg_help_04_frame = createGUIButton(52.04081632653061 * ppi,53.57142857142857 * ppi,20.91836734693878 * ppi,3.571428571428571 * ppi,"INV_SLOT_HIGHLIGHTED.TGA");
local reg_help_05_frame = createGUIButton(52.04081632653061 * ppi,53.57142857142857 * ppi,20.91836734693878 * ppi,8.673469387755102 * ppi,"INV_SLOT_HIGHLIGHTED.TGA");

local regdraw_header = createGUITextButton(servername,"Font_Old_20_White_Hi.TGA",35.1530612244898 * ppi,30.66326530612245 * ppi,255,255,255);
local regdraw_password = createGUITextButton(trans[lang].reg_password.text,"Font_Old_10_White_Hi.TGA",31.88775510204082 * ppi + trans[lang].reg_password.x,38.77551020408163 * ppi,255,255,255);
local regdraw_hidepassword = createGUITextButton(trans[lang].reg_hidepassword.text,"Font_Old_10_White_Hi.TGA",38.87755102040816 * ppi + trans[lang].reg_hidepassword.x,42.60204081632653 * ppi,255,255,255);
local regdraw_hidepassword_mark = createGUITextButton("X","Font_Old_20_White_Hi.TGA",48.46938775510204 * ppi,41.78571428571429 * ppi,255,255,255);
local regdraw_wrongpass = createGUITextButton(trans[lang].reg_wrongpassword.text,"Font_Old_10_White_Hi.TGA",35.96938775510204 * ppi + trans[lang].reg_wrongpassword.x,34.94897959183673 * ppi,255,0,0);
local regdraw_accountde = createGUITextButton(trans[lang].reg_accountde.text,"Font_Old_10_White_Hi.TGA",35.35714285714286 * ppi + trans[lang].reg_accountde.x,34.94897959183673 * ppi,255,0,0);
local regdraw_login = createGUITextButton(trans[lang].reg_login.text,"Font_Old_10_White_Hi.TGA",40.30612244897959 * ppi + trans[lang].reg_login.x,48.62244897959184 * ppi,255,255,255);
local regdraw_registration = createGUITextButton(trans[lang].reg_registration.text,"Font_Old_10_White_Hi.TGA",38.31632653061224 * ppi + trans[lang].reg_registration.x,53.36734693877551 * ppi,255,255,255);
local regdraw_exit = createGUITextButton(trans[lang].reg_exit.text,"Font_Old_10_White_Hi.TGA",49.08163265306122 * ppi + trans[lang].reg_exit.x,55.66326530612245 * ppi,255,255,255);
regdraw_exit.setActiveColor(255,255,0);
local regdraw_help_1_01 = createGUITextButton(trans[lang].reg_help_1_01.text,"Font_Old_10_White_Hi.TGA",53.41836734693878 * ppi + trans[lang].reg_help_1_01.x,31.27551020408163 * ppi,255,255,255);
local regdraw_help_1_02 = createGUITextButton(trans[lang].reg_help_1_02.text,"Font_Old_10_White_Hi.TGA",53.41836734693878 * ppi + trans[lang].reg_help_1_02.x,33.31632653061224 * ppi,255,255,255);
local regdraw_help_2_01 = createGUITextButton(trans[lang].reg_help_2_01.text,"Font_Old_10_White_Hi.TGA",53.41836734693878 * ppi + trans[lang].reg_help_2_01.x,39.38775510204081 * ppi,255,255,255);
local regdraw_help_2_02 = createGUITextButton(trans[lang].reg_help_2_02.text,"Font_Old_10_White_Hi.TGA",53.41836734693878 * ppi + trans[lang].reg_help_2_02.x,41.12244897959184 * ppi,255,255,255);
local regdraw_help_2_03 = createGUITextButton(trans[lang].reg_help_2_03.text,"Font_Old_10_White_Hi.TGA",53.41836734693878 * ppi + trans[lang].reg_help_2_03.x,42.85714285714286 * ppi,255,255,255);
local regdraw_help_3_01 = createGUITextButton(trans[lang].reg_help_3_01.text,"Font_Old_10_White_Hi.TGA",53.41836734693878 * ppi + trans[lang].reg_help_3_01.x,46.58163265306122 * ppi,255,255,255);
local regdraw_help_3_02 = createGUITextButton(trans[lang].reg_help_3_02.text,"Font_Old_10_White_Hi.TGA",53.41836734693878 * ppi + trans[lang].reg_help_3_02.x,48.62244897959184 * ppi,255,255,255);
local regdraw_help_4_01 = createGUITextButton(trans[lang].reg_help_4_01.text,"Font_Old_10_White_Hi.TGA",53.41836734693878 * ppi + trans[lang].reg_help_4_01.x,54.08163265306122 * ppi,255,255,255);
regdraw_help_4_01.setActiveColor(255,255,0);
local regdraw_help_4_02 = createGUITextButton(trans[lang].reg_help_4_02.text,"Font_Old_10_White_Hi.TGA",53.41836734693878 * ppi + trans[lang].reg_help_4_02.x,54.38775510204082 * ppi,255,255,255);
local regdraw_help_4_03 = createGUITextButton(trans[lang].reg_help_4_03.text,"Font_Old_10_White_Hi.TGA",53.41836734693878 * ppi + trans[lang].reg_help_4_03.x,56.42857142857143 * ppi,255,255,255);
local regdraw_help_4_04 = createGUITextButton(trans[lang].reg_help_4_04.text,"Font_Old_10_White_Hi.TGA",53.41836734693878 * ppi + trans[lang].reg_help_4_04.x,58.46938775510204 * ppi,255,255,255);
local regdraw_help_4_05 = createGUITextButton(trans[lang].reg_help_4_05.text,"Font_Old_10_White_Hi.TGA",67.80612244897959 * ppi + trans[lang].reg_help_4_05.x,59.89795918367347 * ppi,255,255,255);
regdraw_help_4_05.setActiveColor(255,255,0);

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
local camvob = createVob("camvob.3D", 46587.144531, 2669.584473, -6546.013184, 10.504526, 0.000000, -0.863396);

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
	
	// help
	reg_help_01.show();
	reg_help_02.show();
	reg_help_03.show();
	reg_help_04.show();
	reg_help_01_frame.show();
	reg_help_02_frame.show();
	reg_help_03_frame.show();
	reg_help_04_frame.show();
	
	regdraw_help_1_01.show();
	regdraw_help_1_02.show();
	regdraw_help_2_01.show();
	regdraw_help_2_02.show();
	regdraw_help_2_03.show();
	regdraw_help_3_01.show();
	regdraw_help_3_02.show();
	regdraw_help_4_01.show();
	//
	
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
	
	// help
	reg_help_01.hide();
	reg_help_02.hide();
	reg_help_03.hide();
	reg_help_04.hide();
	reg_help_05.hide();
	reg_help_01_frame.hide();
	reg_help_02_frame.hide();
	reg_help_03_frame.hide();
	reg_help_04_frame.hide();
	reg_help_05_frame.hide();
	
	regdraw_help_1_01.hide();
	regdraw_help_1_02.hide();
	regdraw_help_2_01.hide();
	regdraw_help_2_02.hide();
	regdraw_help_2_03.hide();
	regdraw_help_3_01.hide();
	regdraw_help_3_02.hide();
	regdraw_help_4_01.hide();
	//
	
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
			regdraw_hidepassword_mark.setPosition(pos.x + 10,pos.y + 10);
		}
	}
	else
	{
		reg_mark_tap = false;
		local pos = regdraw_hidepassword_mark.getPosition();
		regdraw_hidepassword_mark.setPosition(pos.x - 10,pos.y - 10);
	}
	
	if (reg_login_tap == false)
	{
		if (reg_login.isActive())
		{
			reg_login_tap = true;
			local pos = regdraw_login.getPosition();
			regdraw_login.setPosition(pos.x + 10,pos.y + 10);
		}
	}
	else
	{
		reg_login_tap = false;
		local pos = regdraw_login.getPosition();
		regdraw_login.setPosition(pos.x - 10,pos.y - 10);
	}
	
	if (reg_register_tap == false)
	{
		if (reg_register.isActive())
		{
			reg_register_tap = true;
			local pos = regdraw_registration.getPosition();
			regdraw_registration.setPosition(pos.x + 10,pos.y + 10);
		}
	}
	else
	{
		reg_register_tap = false;
		local pos = regdraw_registration.getPosition();
		regdraw_registration.setPosition(pos.x - 10,pos.y - 10);
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
		local have_account = true;
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
				regdraw_wrongpass.setText(trans[lang].reg_wrongpassword.text + " (" + p_getPasswordTry() + "/3)");
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
	
	if (regdraw_help_4_01.isActive())
	{
		reg_help_04.hide();
		reg_help_04_frame.hide();
		regdraw_help_4_01.hide();
		
		reg_help_05.show();
		reg_help_05_frame.show();
		regdraw_help_4_02.show();
		regdraw_help_4_03.show();
		regdraw_help_4_04.show();
		regdraw_help_4_05.show();
	}
	
	if (regdraw_help_4_05.isActive())
	{
		reg_help_04.show();
		reg_help_04_frame.show();
		regdraw_help_4_01.show();
		
		reg_help_05.hide();
		reg_help_05_frame.hide();
		regdraw_help_4_02.hide();
		regdraw_help_4_03.hide();
		regdraw_help_4_04.hide();
		regdraw_help_4_05.hide();
	}
}

// Error message before registration window

local err_background = createGUIWindow(26.88775510204082 * ppi,33.16326530612245 * ppi,30.35714285714286 * ppi,22.44897959183673 * ppi,"MENU_INGAME.TGA");
err_background.access(false);
local err_exit_button = createGUIButton(38.26530612244898 * ppi,50 * ppi,7.653061224489796 * ppi,4.081632653061224 * ppi,"INV_TITEL.TGA");

local err_header = createGUITextButton(trans[lang].err_header.text,"Font_Old_20_White_Hi.TGA",39.79591836734694 * ppi + trans[lang].err_header.x,34.18367346938776 * ppi,255,0,0);
local err_string1 = createGUITextButton("","Font_Old_10_White_Hi.TGA",27.90816326530612 * ppi,39.79591836734694 * ppi,255,255,255);
local err_string2 = createGUITextButton("","Font_Old_10_White_Hi.TGA",27.90816326530612 * ppi,41.83673469387755 * ppi,255,255,255);
local err_string3 = createGUITextButton("","Font_Old_10_White_Hi.TGA",27.90816326530612 * ppi,43.87755102040816 * ppi,255,255,255);
local err_string4 = createGUITextButton("","Font_Old_10_White_Hi.TGA",27.90816326530612 * ppi,45.91836734693878 * ppi,255,255,255);
local err_exit = createGUITextButton(trans[lang].err_exit.text,"Font_Old_10_White_Hi.TGA",40.76530612244898 * ppi + trans[lang].err_exit.x,50.91836734693878 * ppi,255,255,255);

// Error locales

local err_exit_tap = false;

function err_Show()
{
	err_background.show();
	err_exit_button.show();
	
	err_header.show();
	err_string1.show();
	err_string2.show();
	err_string3.show();
	err_string4.show();
	err_exit.show();
}

function err_Hide()
{
	err_background.hide();
	err_exit_button.hide();
	
	err_header.hide();
	err_string1.hide();
	err_string2.hide();
	err_string3.hide();
	err_string4.hide();
	err_exit.hide();
}

function err_SetText(num)
{
	if (num == 1)
	{
		err_string1.setText(trans[lang].err_msg1_01.text);
		local pos1 = err_string1.getPosition();
		err_string1.setPosition(pos1.x + trans[lang].err_msg1_01.x,pos1.y);
		err_string2.setText(trans[lang].err_msg1_02.text);
		local pos2 = err_string2.getPosition();
		err_string2.setPosition(pos2.x + trans[lang].err_msg1_02.x,pos2.y);
		err_string3.setText(trans[lang].err_msg1_03.text);
		local pos3 = err_string3.getPosition();
		err_string3.setPosition(pos3.x + trans[lang].err_msg1_03.x,pos3.y);
		err_string4.setText(trans[lang].err_msg1_04.text);
		local pos4 = err_string4.getPosition();
		err_string4.setPosition(pos4.x + trans[lang].err_msg1_04.x,pos4.y);
	}
}

function gui_errSetButtonsColors()
{
	if (err_exit_button.isActive())
	{
		err_exit.setColor(255,255,0);
		err_exit.setActiveColor(255,255,0);
	}
	else
	{
		err_exit.setColor(255,255,255);
		err_exit.setActiveColor(255,255,255);
	}
}

function gui_errAnimateButtons()
{
	if (err_exit_tap == false)
	{
		if (err_exit_button.isActive())
		{
			local pos = err_exit.getPosition();
			err_exit.setPosition(pos.x + 10,pos.y + 10);
			err_exit_tap = true;
		}
	}
	else
	{
		local pos = err_exit.getPosition();
		err_exit.setPosition(pos.x - 10,pos.y - 10);
		err_exit_tap = false;
	}
}

function gui_errConfirm()
{
	if (err_exit_button.isActive())
	{
		exitGame();
	}
}

addEvent("onClick",function(key,x,y,wheel)
{
	if (key == "LEFT_DOWN")
	{
		gui_regAnimateButtons();
		
		gui_errAnimateButtons();
	}
	else
	{
		gui_regAnimateButtons();
		gui_regConfirm();
		
		gui_errAnimateButtons();
		gui_errConfirm();
	}
});

addEvent("onRender",function()
{
	gui_regSetButtonsColors();
	
	gui_errSetButtonsColors();
});


addEvent("onRespawn",function()
{
	//gui_ShowRegistration();
	enableInterface(1,false);
	enableInterface(2,false);
	enableInterface(3,false);
	enableInterface(4,false);
	setCameraBehindVob(camvob);
	err_SetText(1);
	err_Show();
});