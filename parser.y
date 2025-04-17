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
%token VE VEYA DEGIL
%token LE GE NEQ POW
%token BREAK CONTINUE
%token INPUT PRINT
%token SWITCH CASE DEFAULT
%token LIST
%token FOR TO
%token LBRACKET RBRACKET
%nonassoc LOWER_THAN_ELSE
%nonassoc AKSI

%left '+' '-'
%left '*' '/' '%'
%right POW
%left '=' '<' '>' LE GE NEQ
%left VE VEYA
%right DEGIL
%left INDEX_ACCESS

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
    | draw_command
    | if_else_statement
    | while_statement
    | function_definition
    | function_call
    | keypress_statement
    | return_statement
    | break_statement
    | continue_statement
    | print_statement
    | switch_case_statement
    | for_loop
    ;

assignment
    : ID ASSIGN expression
    | ID AUG_ASSIGN expression
    ;

expression
    : primary_expression
    | expression '+' expression
    | expression '-' expression
    | expression '*' expression
    | expression '/' expression
    | expression '%' expression
    | expression POW expression
    | expression '=' expression
    | expression '<' expression
    | expression '>' expression
    | expression LE expression
    | expression GE expression
    | expression NEQ expression
    | expression VE expression
    | expression VEYA expression
    | DEGIL expression
    | '(' expression ')'
    ;

primary_expression
    : INT
    | FLOAT
    | STRING
    | ID
    | INPUT
    | ID LBRACKET expression RBRACKET %prec INDEX_ACCESS
    | list_literal
    ;

list_literal
    : LIST LBRACKET expression_list_opt RBRACKET
    ;

expression_list_opt
    : /* empty */
    | expression_list
    ;

expression_list
    : expression
    | expression ',' expression_list
    ;

draw_command
    : DAIRE_CIZ expression expression expression
    | CIZGI_CIZ expression expression expression expression
    | DIKDORTGEN_CIZ expression expression expression expression
    | UCGEN_CIZ expression expression expression expression expression expression
    ;

if_else_statement
    : EGER expression ISE block %prec LOWER_THAN_ELSE
    | EGER expression ISE block AKSI block
    ;

while_statement
    : DONGU expression IKEN block NEKI
    ;

for_loop
    : FOR ID INT TO INT block
    ;

function_definition
    : FONK ID param_list ':' block KNOF
    ;

param_list
    : /* empty */
    | ID param_list
    ;

function_call
    : ID '(' ')'
    | ID '(' expression_list ')'
    ;

keypress_statement
    : EGER TUS_BASILDI TUS_TURU ISE block
    ;

return_statement
    : DONDUR expression
    ;

break_statement
    : BREAK
    ;

continue_statement
    : CONTINUE
    ;

print_statement
    : PRINT expression
    ;

switch_case_statement
    : SWITCH expression '{' case_blocks optional_default '}'
    ;

case_blocks
    : case_blocks CASE INT ':' block_or_statement
    | CASE INT ':' block_or_statement
    ;

optional_default
    : DEFAULT ':' block_or_statement
    | /* empty */
    ;

block_or_statement
    : block
    | statement
    ;

block
    : '{' inner_statements '}'
    ;

inner_statements
    : /* empty */
    | statement_list
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

