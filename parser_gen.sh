#! /bin/bash
#

	CONFIG_FILE="$1"
	
	[ ! -e "$CONFIG_FILE"  ] && echo "ERRO: Arquivo não existe!" && exit 1
	[ ! -r "$CONFIG_FILE"  ] && echo "ERRO: Arquivo não tem permissão de leitura!" && exit 1

	while read -r linha
	do
		[ "$(echo $linha | cut -c1)" = "#"  ] && continue  # Ignora linhas de comentarios
		[ ! "$linha"  ] && continue # Ignora linhas em branco
	
		parameter="$(echo $linha | cut -d = -f 1)"
		value="$(echo $linha | cut -d = -f 2)"

		echo "CONF_$parameter=$value"
	done < "$CONFIG_FILE"
