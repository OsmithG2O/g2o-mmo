

local p_LoggedIn = false;

local p_Password = "";
local p_Login = "";

local p_passwordTry = 0;

function p_getPasswordTry()
{
	return p_passwordTry;
}

function p_setPasswordTry(arg)
{
	p_passwordTry = arg;
}

function p_SetLoggedIn(arg)
{
	p_LoggedIn = arg;
}

function p_GetLoggedIn()
{
	return p_LoggedIn;
}

function p_SetPassword(arg)
{
	p_Password = arg;
}

function p_GetPassword()
{
	return p_Password;
}

function p_SetLogin(arg)
{
	p_Login = arg;
}

function p_GetPassword()
{
	return p_Login;
}