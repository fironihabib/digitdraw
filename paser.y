%{
#include <stdio.h>
#include <stdlib.h>
extern int yylex();
extern int yylineno;
void yyerror(const char *s);
%}

%union {
    int ival;
    float fval;
    char* sval;
}

%token <ival> INT
%token <fval> FLOAT
%token <sval> STRING
%token <sval> ID

%token ASSIGN AUG_ASSIGN

%token EGER AKSI ISE
%token DONGU IKEN NEKI
%token FONK KNOF DONDUR
%token DAIRE_CIZ CIZGI_CIZ DIKDORTGEN_CIZ UCGEN_CIZ
%token TUS_BASILDI TUS_TURU

%left '+' '-' '*' '/' '%' '**'
%left '=' '<' '>' "<=" ">=" "<>"
%left VE VEYA
%right DEĞİL

%start program

%%

program
    : statement_list
    ;

statement_list
    : statement_list statement
    | statement
    ;

statement
    : assignment
    | expression_statement
    | draw_command
    | if_statement
    | while_statement
    | function_definition
    | function_call
    | keypress_statement
    | ';'
    ;

assignment
    : ID ASSIGN expression          { printf("[OK] Atama: %s\n", $1); }
    | ID AUG_ASSIGN expression      { printf("[OK] Arttırma/azaltma: %s\n", $1); }
    ;

expression_statement
    : expression                    { /* sadece bir ifade */ }
    ;

expression
    : INT
    | FLOAT
    | STRING
    | ID
    | expression '+' expression
    | expression '-' expression
    | expression '*' expression
    | expression '/' expression
    | expression '%' expression
    | expression '**' expression
    | expression '=' expression
    | expression '<' expression
    | expression '>' expression
    | expression "<=" expression
    | expression ">=" expression
    | expression "<>" expression
    | expression VE expression
    | expression VEYA expression
    | DEĞİL expression
    ;

if_statement
    : EGER expression ISE statement AKSI statement { printf("[OK] Koşullu ifade\n"); }
    ;

while_statement
    : DONGU expression IKEN statement NEKI         { printf("[OK] Döngü\n"); }
    ;

function_definition
    : FONK ID param_list ':' statement_list KNOF   { printf("[OK] Fonksiyon tanımı: %s\n", $2); }
    ;

param_list
    : /* boş */ 
    | ID
    | ID param_list
    ;

function_call
    : ID expression_list                           { printf("[OK] Fonksiyon çağrısı: %s\n", $1); }
    ;

expression_list
    : expression
    | expression expression_list
    ;

draw_command
    : DAIRE_CIZ expression expression expression   { printf("[OK] daire_ciz\n"); }
    | CIZGI_CIZ expression expression expression expression { printf("[OK] cizgi_ciz\n"); }
    | DIKDORTGEN_CIZ expression expression expression expression { printf("[OK] dikdortgen_ciz\n"); }
    | UCGEN_CIZ expression expression expression expression expression expression { printf("[OK] ucgen_ciz\n"); }
    ;

keypress_statement
    : EGER TUS_BASILDI TUS_TURU ISE statement      { printf("[OK] Tuş kontrolü\n"); }
    ;

%%

void yyerror(const char *s) {
    fprintf(stderr, "Hata: Satır %d - %s\n", yylineno, s);
}

int main() {
    if (yyparse() == 0) {
        printf("[Başarılı] Kod gramer kurallarına uygundur.\n");
    }
    return 0;
}

