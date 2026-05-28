#! /bin/bash
#
# titles_extract.sh - Verifica todas as divs e extrai os títulos 
#
#	Site:		github.com/ThonBorges
#	Autor:		Celthon Borges
#	Manutenção:	Celthon Borges
#
# ------------------------------------------------------------------------------ #
#
#	O script utilizará o Lynx para passar por todas as divs que contém
#	títulos com a identificação blurb e em sequência, restringirá a consulta
#	apenas à parte que contem o titulo utilizando grep com expressões
#	regulares.
#	Por fim, cairá no loop while que irá listar para o usuário todos os 
#	títulos encontrados, alterando a cor de saida para facilitar a leitura.
#
#	Exemplo:
#		./titles_extract.sh
# ------------------------------------------------------------------------------ #
#
#	Histórico:
#
#	v1.0 - 27/05/2026 - Celthon Borges
#		- Criação do script de lista títulos
#
# ------------------------------------------------------------------------------ #
#
# 	Testado em Bash version 5.2.21
# 
# ---------------------------------------VARIAVEIS------------------------------- #

TITLES_FILE="titlesTest.txt"

RED="\033[31;1m"
GREEN="\033[32;1m"

# ---------------------------------------TESTES---------------------------------- #

if [ ! -x "$(which lynx)" ]; then
	sudo apt install lynx -y		# Instala o lynx caso não esteja.
else
	echo "$(basename $0) em execução!"
	printf "\n"
	printf "\n"
fi					

# ---------------------------------------EXECUÇÃO-------------------------------- #

lynx -source http://lxer.com/ | grep blurb | sed 's/<div.*line">//;s/<\/span.*//' > titlesTest.txt

while read -r title_lxer; do
	echo -e "${RED}Title: ${GREEN}$title_lxer"
done <"$TITLES_FILE"

# ------------------------------------------------------------------------------- #
