%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "parser.tab.h"
extern int yylineno;
%}

%%

"--".*                          { /* yorum satırı */ }
[ \t\r]+                        { }
\n                              { yylineno++; }

"<-"                            { return ASSIGN; }
"=<-"                           { return AUG_ASSIGN; }
"+<-"                           { return AUG_ASSIGN; }
"-<-"                           { return AUG_ASSIGN; }

"eger"                          { return EGER; }
"aksi"                          { return AKSI; }
"ise"                           { return ISE; }
"dongu"                         { return DONGU; }
"iken"                          { return IKEN; }
"neki"                          { return NEKI; }

"fonk"                          { return FONK; }
"knof"                          { return KNOF; }
"dondur"                        { return DONDUR; }

"daire_ciz"                     { return DAIRE_CIZ; }
"cizgi_ciz"                     { return CIZGI_CIZ; }
"dikdortgen_ciz"                { return DIKDORTGEN_CIZ; }
"ucgen_ciz"                     { return UCGEN_CIZ; }

"tus_basildi"                   { return TUS_BASILDI; }
"TUS_YUKARI"|"TUS_ASAGI"|"TUS_SOLA"|"TUS_SAGA" { return TUS_TURU; }

"ve"                            { return VE; }
"veya"                          { return VEYA; }
"degil"                         { return DEGIL; }

"break"                         { return BREAK; }
"continue"                      { return CONTINUE; }
"input"                         { return INPUT; }
"print"                         { return PRINT; }

"switch"                        { return SWITCH; }
"case"                          { return CASE; }
"default"                       { return DEFAULT; }

"for"                           { return FOR; }
"to"                            { return TO; }

"list"                          { return LIST; }

"<="                            { return LE; }
">="                            { return GE; }
"<>"                            { return NEQ; }
"="                             { return '='; }
"<"                             { return '<'; }
">"                             { return '>'; }

"+"                             { return '+'; }
"-"                             { return '-'; }
"*"                             { return '*'; }
"/"                             { return '/'; }
"%"                             { return '%'; }
"**"                            { return POW; }

"("                             { return '('; }
")"                             { return ')'; }
"{"                             { return '{'; }
"}"                             { return '}'; }
"["                             { return LBRACKET; }
"]"                             { return RBRACKET; }
":"                             { return ':'; }
","                             { return ','; }
[0-9]+\.[0-9]+                  { yylval.fval = atof(yytext); return FLOAT; }
[0-9]+                          { yylval.ival = atoi(yytext); return INT; }
\"[^\"]*\"                      { yylval.sval = strdup(yytext); return STRING; }
[a-zA-Z_][a-zA-Z0-9_]*          { yylval.sval = strdup(yytext); return ID; }

.                               {
                                  printf("Hata: Satır %d - geçersiz karakter '%s'\n", yylineno, yytext);
                                  exit(1);
                                }

%%

int yywrap() { return 1; }

