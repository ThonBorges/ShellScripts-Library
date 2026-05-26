#!/usr/bin/env bash
#
#
TESTE="VARIAVEL 
DE TESTE"

echo "$TESTE"

printf "\n"
printf "\n"

echo "------------TESTE DE CALCULO----------------------"
printf "\n"
printf "\n"

NUMERO_1=35
NUMERO_2=7

TOTAL=$((NUMERO_1*NUMERO_2))

echo "$TOTAL"

printf "\n"
printf "\n"

echo "------------VARIAVEL LIGADA A PROCESSO----------------------"
printf "\n"
printf "\n"

SAIDA_USER=$(tail -n 2 /var/log/auth.log)

echo "$SAIDA_USER"

printf "\n"
printf "\n"

echo "-------------PALAVRAS RESERVADAS DO SHELL---------------------"
printf "\n"
printf "\n"

echo "Parametro 1: $1"
echo "Parametro 2: $2"
echo "Todos os parametros: $*"
echo "Quantidade de parametros utilizados: $#"
echo "Saida do ultimo comando(0 = sucesso): $?"
echo "PID: $$"
echo "Nome do script que está sendo executado: $0"

printf "\n"
printf "\n"

echo "-------------EXEMPLO DE IF COM SOMA---------------------"
printf "\n"
printf "\n"

VAR_1=2
VAR_2=8

soma=$((VAR_1 + VAR_2))

if (( soma % 2 == 0 )); then
	printf "A soma das variaveis\n é divisivel por 2"
else
	echo "Variáveis não divisíveis"
fi

printf "\n"
printf "\n"

echo "----------------IF DE VALIDAÇÃO DE PARÂMETRO------------------"
printf "\n"
printf "\n"

echo "Parametro 1: $1"
par_1=$1

if (( par_1 >= 10  )); then
	echo "PID: $$"
	echo "Nome do Script: $0"
else
	echo "Tudo normal por aqui..."
fi

printf "\n"
printf "\n"

echo "--------------LAÇO FOR ------------------"
printf "\n"
printf "\n"

for (( i=1; i<=10; i++ )); do
	printf "$i\n"
done

printf "\n"
printf "\n"

echo "--------------LAÇO FOR 2 ------------------"
printf "\n"
printf "\n"

Frutas=(
	'Laranja'
	'Abacaxi'
	'limao'
	'abacate'
)

for i in "${Frutas[@]}"; do
	echo "$i"
done

printf "\n"
printf "\n"

echo "---------------WHILE-----------------------"
printf "\n"
printf "\n"

contador=0

while [[ $contador -lt ${#Frutas[@]} ]]; do
	echo $contador
	contador=$(($contador+1))
done
