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
	reg_password = {text = "Haslo:", x = 100},
	reg_hidepassword = {text = "Ukryte haslo", x = 100},
	reg_wrongpassword = {text = "Zle haslo!", x = 200},
	reg_accountde = {text = "Konto nie istnieje!", x = 150},
	reg_login = {text = "Zaloguj", x = -50},
	reg_registration = {text = "Zarejestruj", x = 50},
	reg_exit = {text = "Wyjdz", x = -80},
	reg_help_1_01 = {text = "Maksymalna d�ugosc hasla", x = 0},
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
	reg_help_4_05 = {text = "Ukryj", x = 40}
};


local ru = {
	reg_password = {text = "������:", x = 0},
	reg_hidepassword = {text = "������ ������", x = 0},
	reg_wrongpassword = {text = "�������� ������!", x = 0},
	reg_accountde = {text = "������� �� ����������!", x = 0},
	reg_login = {text = "����", x = 0},
	reg_registration = {text = "�����������", x = 0},
	reg_exit = {text = "�����", x = -120},
	reg_help_1_01 = {text = "������������ ����� ������", x = 0},
	reg_help_1_02 = {text = "13 ��������.", x = 0},
	reg_help_2_01 = {text = "������ ������ ��������", x = 0},
	reg_help_2_02 = {text = "���������� ��������� �", x = 0},
	reg_help_2_03 = {text = "�������.", x = 0},
	reg_help_3_01 = {text = "�� � ���� ������, �� ��������", x = 0},
	reg_help_3_02 = {text = "������ ���� ������!", x = 0}
	reg_help_4_01 = {text = "��� ������� ����?", x = 0},
	reg_help_4_02 = {text = "����� ������� ����, �������", x = 0},
	reg_help_4_03 = {text = "�� ����, ������� ���� ��������", x = 0},
	reg_help_4_04 = {text = "� ������� � ����.", x = 0},
	reg_help_4_05 = {text = "������", x = 0}
};

trans.append(en);
trans.append(pl);
trans.append(ru);

function getTranslations()
{
	return trans;
}