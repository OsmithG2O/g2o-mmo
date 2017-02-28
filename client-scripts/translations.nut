
local trans = [];

local en = {
	reg_password = {text = "Password:", x = 0},
	reg_hidepassword = {text = "Hide password", x = 0},
	reg_wrongpassword = {text = "Wrong password!", x = 0},
	reg_accountde = {text = "Account does not exist!", x = 0},
	reg_login = {text = "Log In", x = 0},
	reg_registration = {text = "Registration", x = 0},
	reg_exit = {text = "Exit", x = 0}
};

local pl = {};

local ru = {
	reg_password = {text = "Пароль:", x = 0},
	reg_hidepassword = {text = "Скрыть пароль", x = 0},
	reg_wrongpassword = {text = "Неверный пароль!", x = 0},
	reg_accountde = {text = "Аккаунт не существует!", x = 0},
	reg_login = {text = "Войти", x = 0},
	reg_registration = {text = "Регистрация", x = 0},
	reg_exit = {text = "Выход", x = 0},
};

trans.append(en);
trans.append(pl);
trans.append(ru);

function getTranslations()
{
	return trans;
}