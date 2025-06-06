/* A Bison parser, made by GNU Bison 3.8.2.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2021 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <https://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

#ifndef YY_YY_PARSER_TAB_H_INCLUDED
# define YY_YY_PARSER_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token kinds.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    YYEMPTY = -2,
    YYEOF = 0,                     /* "end of file"  */
    YYerror = 256,                 /* error  */
    YYUNDEF = 257,                 /* "invalid token"  */
    INT = 258,                     /* INT  */
    FLOAT = 259,                   /* FLOAT  */
    STRING = 260,                  /* STRING  */
    ID = 261,                      /* ID  */
    ASSIGN = 262,                  /* ASSIGN  */
    AUG_ASSIGN = 263,              /* AUG_ASSIGN  */
    EGER = 264,                    /* EGER  */
    AKSI = 265,                    /* AKSI  */
    ISE = 266,                     /* ISE  */
    DONGU = 267,                   /* DONGU  */
    IKEN = 268,                    /* IKEN  */
    NEKI = 269,                    /* NEKI  */
    FONK = 270,                    /* FONK  */
    KNOF = 271,                    /* KNOF  */
    DONDUR = 272,                  /* DONDUR  */
    DAIRE_CIZ = 273,               /* DAIRE_CIZ  */
    CIZGI_CIZ = 274,               /* CIZGI_CIZ  */
    DIKDORTGEN_CIZ = 275,          /* DIKDORTGEN_CIZ  */
    UCGEN_CIZ = 276,               /* UCGEN_CIZ  */
    TUS_BASILDI = 277,             /* TUS_BASILDI  */
    TUS_TURU = 278,                /* TUS_TURU  */
    VE = 279,                      /* VE  */
    VEYA = 280,                    /* VEYA  */
    DEGIL = 281,                   /* DEGIL  */
    LE = 282,                      /* LE  */
    GE = 283,                      /* GE  */
    NEQ = 284,                     /* NEQ  */
    POW = 285,                     /* POW  */
    BREAK = 286,                   /* BREAK  */
    CONTINUE = 287,                /* CONTINUE  */
    INPUT = 288,                   /* INPUT  */
    PRINT = 289,                   /* PRINT  */
    SWITCH = 290,                  /* SWITCH  */
    CASE = 291,                    /* CASE  */
    DEFAULT = 292,                 /* DEFAULT  */
    LIST = 293,                    /* LIST  */
    FOR = 294,                     /* FOR  */
    TO = 295,                      /* TO  */
    LBRACKET = 296,                /* LBRACKET  */
    RBRACKET = 297,                /* RBRACKET  */
    LOWER_THAN_ELSE = 298,         /* LOWER_THAN_ELSE  */
    INDEX_ACCESS = 299             /* INDEX_ACCESS  */
  };
  typedef enum yytokentype yytoken_kind_t;
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 9 "parser.y"

    int ival;
    float fval;
    char* sval;

#line 114 "parser.tab.h"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;


int yyparse (void);


#endif /* !YY_YY_PARSER_TAB_H_INCLUDED  */
