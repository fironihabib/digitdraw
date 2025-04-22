# DigitDraw DSL - A Custom Drawing Language
DigitDraw is designed as a domain-specific language (DSL). This language allows you to create your own graphical programming language with drawing commands, function definitions, conditional statements, loops, and more.

# About the Project
This project covers all phases of language design:

Lexer (lexer.l): Defines the tokens from the input file.

Parser (parser.y): Interprets tokens according to grammar rules.

Sample Test Files: The language structure is tested with 20 different .txt files.

Report: Includes a report.docx file explaining the project's features and the language design.

# Language Features
DigitDraw language supports the following structures:

- Assignment and augmented assignment: <-, =<-, +<-, -<-

- Conditional statements: eger (if), ise (then), aksi (else)

- Loop structures: dongu (while), iken (while), neki (do-while), for, to

- Function definition and call: fonk (function), knof (end function), ID(...)

- List definition and indexing: list[1, 2], list[0]

- Drawing commands: daire_ciz (draw_circle), cizgi_ciz (draw_line), dikdortgen_ciz (draw_rectangle), ucgen_ciz (draw_triangle)

- Keyboard control: tus_basildi (key_pressed), TUS_YUKARI (KEY_UP), etc.

- Flow control: break, continue, dondur (return)

- Switch-case structure

- Input/Output: input, print

# Compilation and Execution
Use the following commands to compile and run the project in a Linux terminal:

bash
Copy
Edit
# Compilation steps:
bison -d parser.y
flex lexer.l
gcc -o digitdraw parser.tab.c lex.yy.c -lfl

# Running a test:
./digitdraw < test1.txt
To automatically run all tests:

bash
Copy
Edit
for i in {1..20}; do
  echo "----- test$i.txt -----"
  ./digitdraw < test$i.txt
done
# 📁 Project Structure
bash
Copy
Edit
digitdraw/
├── lexer.l               # Token definitions
├── parser.y              # BNF grammar rules
├── report.docx           # Project report
├── digitdraw             # Compiled executable
├── test1.txt ~ test20.txt # Test inputs
└── README.md             # This description file
# Test Files
The project includes 20 different test files, all of which successfully pass grammar validation (including tests 18-20).

# Developer
Fironi Habibzade

# License
This project was developed as part of an academic assignment. It is intended for personal use.
