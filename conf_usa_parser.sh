#! /bin/bash
#
#

	CONFIG_FILE="configuracao.cf"
	MESSAGE="Mensagem de Teste"
	UPPERCASE=
	COLORS=
	CIAN="\033[36;1m"

	eval $(./parser_gen.sh $CONFIG_FILE)

	[ "$(echo $CONF_UPPERCASE)" = "1"  ] && UPPERCASE=1
	[ "$(echo $CONF_COLORS)" = "1" ] && COLORS=1

	[ "$UPPERCASE" = "1"  ] && MESSAGE="$(echo -e $MESSAGE | tr [a-z] [A-Z])"
	[ "$COLORS" =  "1" ] && MESSAGE="$(echo -e ${CIAN}$MESSAGE)"

	echo -e "$MESSAGE"
