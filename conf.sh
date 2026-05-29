#! /bin/bash
#
# -------------------------------VARIÁVEIS--------------------------- #

	CONFIG_FILE="configuracao.cf"
	UPPERCASE=
	COLORS=
	MESSAGE="Você conseguiu!"

	CIAN="\033[36;1m"
	LIGHT_GREY="\033[37;1m"
#
# -------------------------------FUNÇÕES------------------------------------------------------------------------- #

	defParameter () {
		local parameter="$(echo $1 | cut -d = -f 1)" # Pega o primeiro parametro que é o nome da variavel
		local value="$(echo $1 | cut -d = -f 2)" # Nessa parte ele pega o valor da variavel

		case "$parameter" in
			UPPERCASE) UPPERCASE=$value	;;
			COLORS)    COLORS=$value	;;
		esac
	}	
# 	
#	No laço, estamos checando se a linha possui algum valor e enviando
#	à função defParameter a linha como parametro $1.
#	Depois, damos cut para separar o nome da variavel na coluna 1, que vai ficar
#	armazenado na variavel local parameter e fazemos a mesma coisa no valor
#	da coluna 2, que ficará armazenado na variavel local value.
#	O case foi chamado para atribuir as variaveis do nosso script para as variaveis de ambiente
#	e designar seus respectivos valores.
#
# -------------------------------TESTES--------------------------------------------------------------------------- #

	if [ ! -r "$CONFIG_FILE" ]; then
		echo "Acesso de leitura negado" && exit 1
	fi

# -------------------------------EXECUÇÃO------------------------------------------------------------------------- #

	while read -r linha; do
		if [ "$(echo $linha | cut -c1)" = "#" ]; then # Verifica se o primeiro caracter é um "#" e o pula
			continue
		elif [ ! "$linha" ]; then  # Verifica se a linha não é nula e caso seja, pula ela.
			continue
		fi
		defParameter "$linha"
	done < "$CONFIG_FILE"

	[ $UPPERCASE -eq 1  ] && MESSAGE="$(echo -e $MESSAGE | tr [a-z] [A-Z])"
	[ $COLORS -eq 1  ] && MESSAGE="$(echo -e ${CIAN}$MESSAGE)"

	echo "$MESSAGE"

# ----------------------------------------------------------------------------------------------------------------- #
