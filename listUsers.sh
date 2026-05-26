#! /bin/bash
#
# listUsers.sh - Extrai usuários do /etc/passwd
#
#  Site:		github.com/ThonBorges
#  Autor:		Celthon Borges
#  Manutenção:		Celthon Borges
#
#  ------------------------------------------------------------------- #
#
#  Irá extrair os usuários do /etc/passwd, havendo a possibilidade de
#  filtrar em Maiusculos ou ordem alfabética.
#
#  	Exemplos: 
#  		$ ./listUsers.sh -s -m
#
#  	Neste exemplo, os usuários serão listados em maiúsculas e em
#  	ordem alfabética.
#
#  ------------------------------------------------------------------- #
#
#  Histórico:
#
#  	v1.0 - 25/05/2026 - Celthon Borges
#  		- Criada as variaveis e execução base do programa.
#
#  	v1.1 - 25/05/2026 - Celthon Borges
#  		- Adicionado parâmetro "basename" para melhor 
#  	descrição do programa executado e atribuição de cases
#  	nas condicionais if para melhor manutenção.
#
#  	v1.2 - 25/05/2026 - Celthon Borges
#  		- Adição de flags na execução do programa.
#  		- Adição de nova função no menu "-m"
#
#  	v1.3 - 25/05/2026 - Celthon Borges
#  		- Adição de loop While
#  		- Uso de loop para checar duas funções simultaneas.
#
#  ------------------------------------------------------------------- #
#
#  Testado em Bash version 5.2.21
#
#
#  ------------------------------------------------------------------ #

	
#  --------------------------VARIAVEIS------------------------------- #

	USERS="$(cat /etc/passwd | cut -d : -f 1)"
	
	USER_OPTIONS="
	$(basename $0) - [OPTIONS]

		-h --> Help menu
		-v --> Version
		-s --> Output ordenation
		-m --> Put it in uppercase
	"
	VERSION="v1.3"
	KEY_ORDER=0
	KEY_UPPER=0

#  --------------------------TESTES---------------------------------- #

#	if [[ "$1" == "-h"  ]]; then
#		echo "$USER_OPTIONS" && exit 0
#	fi
#
#	if [[ "$1" == "-v"  ]]; then
#		echo "$0 - $VERSION" && exit 0
#	fi
#	
#	if [[ "$1" == "-s"  ]]; then
#		echo "$USERS" | sort && exit 0
#	fi

#  --------------------------FUNÇÕES--------------------------------- #



#  --------------------------EXECUÇÃO-------------------------------- #

while test -n "$1"; do
	case "$1" in 
		-h) echo "$USER_OPTIONS" && exit 0 			            ;;
		-v) echo "$0 - $VERSION" && exit 0 			            ;;
		-s) KEY_ORDER=1                    			            ;;
		-m) KEY_UPPER=1			   			                    ;;
	 	*) echo "Invalid parameter, review main menu" && exit 1 ;;
	esac
	shift
done

[ $KEY_ORDER -eq 1 ] && USERS=$(echo "$USERS" | sort)
[ $KEY_UPPER -eq 1 ] && USERS=$(echo "$USERS" | tr [a-z] [A-Z])

echo "$USERS"

#  ------------------------------------------------------------------ #
