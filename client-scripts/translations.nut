
local trans = [];

local en = {
	reg_password = {text = "Password:", x = 0},
	reg_hidepassword = {text = "Hide password", x = 0},
	reg_wrongpassword = {text = "Wrong password!", x = 0},
	reg_accountde = {text = "Account does not exist!", x = 0},
	reg_login = {text = "Log In", x = 0},
	reg_registration = {text = "Registration", x = 0},
	reg_exit = {text = "Exit", x = 0},
	reg_help_1_01 = {text = "The max. password length", x = 0},
	reg_help_1_02 = {text = "13 symbols.", x = 0},
	reg_help_2_01 = {text = "The password must be entered", x = 0},
	reg_help_2_02 = {text = "by Latin characters and", x = 0},
	reg_help_2_03 = {text = "numbers.", x = 0},
	reg_help_3_01 = {text = "In any case, do not tell", x = 0},
	reg_help_3_02 = {text = "anyone your password!", x = 0},
	reg_help_4_01 = {text = "How to change language?", x = 0},
	reg_help_4_02 = {text = "To change the language, exit the game,", x = 0},
	reg_help_4_03 = {text = "change the language the launcher, and", x = 0},
	reg_help_4_04 = {text = "sign back in.", x = 0},
	reg_help_4_05 = {text = "Hide", x = 0}
};

local pl = {
	reg_password = {text = "Haslo:", x = 0},
	reg_hidepassword = {text = "Ukryte haslo", x = 0},
	reg_wrongpassword = {text = "Zle haslo!", x = 0},
	reg_accountde = {text = "Konto nie istnieje!", x = 0},
	reg_login = {text = "Zaloguj", x = 0},
	reg_registration = {text = "Zarejestruj", x = 0},
	reg_exit = {text = "Wyjdz", x = 0},
	reg_help_1_01 = {text = "Maksymalna dіugosc hasla", x = 0},
	reg_help_1_02 = {text = "13 liter.", x = 0},
	reg_help_2_01 = {text = "Haslo musi miec wprowadzone", x = 0},
	reg_help_2_02 = {text = "lacinskie litery i ", x = 0},
	reg_help_2_03 = {text = "numery.", x = 0},
	reg_help_3_01 = {text = "Nie podawaj nikomu", x = 0},
	reg_help_3_02 = {text = "swojego hasla!", x = 0}
	reg_help_4_01 = {text = "Jak zmienic jezyk?", x = 0},
	reg_help_4_02 = {text = "Zeby zmienic jezyk, zamknij gre,", x = 0},
	reg_help_4_03 = {text = "zmien jezyk w launcherze, i", x = 0},
	reg_help_4_04 = {text = "zaloguj sie ponownie.", x = 0},
	reg_help_4_05 = {text = "Ukryj", x = 0}
};


local ru = {
	reg_password = {text = "Пароль:", x = 0},
	reg_hidepassword = {text = "Скрыть пароль", x = 0},
	reg_wrongpassword = {text = "Неверный пароль!", x = 0},
	reg_accountde = {text = "Аккаунт не существует!", x = 0},
	reg_login = {text = "Вход", x = 0},
	reg_registration = {text = "Регистрация", x = 0},
	reg_exit = {text = "Выход", x = 0},
	reg_help_1_01 = {text = "Максимальная длина пароля", x = 0},
	reg_help_1_02 = {text = "13 символов.", x = 0},
	reg_help_2_01 = {text = "Пароль должен вводится", x = 0},
	reg_help_2_02 = {text = "Латинскими символами и", x = 0},
	reg_help_2_03 = {text = "числами.", x = 0},
	reg_help_3_01 = {text = "Ни в коем случае, не говорите", x = 0},
	reg_help_3_02 = {text = "никому свой пароль!", x = 0}
	reg_help_4_01 = {text = "Как сменить язык?", x = 0},
	reg_help_4_02 = {text = "Чтобы сменить язык, выйдите из игры,", x = 0},
	reg_help_4_03 = {text = "смените язык лаунчера, и", x = 0},
	reg_help_4_04 = {text = "войдите в игру.", x = 0},
	reg_help_4_05 = {text = "Скрыть", x = 0}
};

trans.append(en);
trans.append(pl);
trans.append(ru);

function getTranslations()
{
	return trans;
}