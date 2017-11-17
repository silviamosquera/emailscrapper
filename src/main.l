
%{
#include <stdio.h>
%}

AlfaNum [a-zA-Z0-9]
Especial [_\-~.]
EspecialFim [_\-~]

%%

{Especial}+({AlfaNum}*{Especial}*)*"@"({AlfaNum}*{Especial}*)* {  //Evita casos em que o usuário começa com caractéres especiais
}
{AlfaNum}+({AlfaNum}*{Especial}*)*{Especial}+"@"({AlfaNum}*{Especial}*)* { //Evita casos em que o usuário termina com caractéres especiais
}
{AlfaNum}+({AlfaNum}*{Especial}*)*{AlfaNum}+"@"{Especial}+({AlfaNum}*{Especial}*)* { //Evita casos em que o domínio começa com caractéres especiais
}
{AlfaNum}+({AlfaNum}*{Especial}*)*{AlfaNum}+"@"({AlfaNum}*{Especial}*)*{EspecialFim}+ { //Evita casos em que o domínio termina com caractéres especiais
}
{AlfaNum}+({AlfaNum}*{Especial}*)*{AlfaNum}+"@"{AlfaNum}+({AlfaNum}*{Especial}*)*{AlfaNum}+ {
	printf("%s\n", yytext);
}
{AlfaNum}+({AlfaNum}*{Especial}*)*{AlfaNum}+"@"{AlfaNum} {
	printf("%s\n", yytext);
}

[ \t\n] {}
. {}


%%

int main() {
  yylex();
  return 0;
}
