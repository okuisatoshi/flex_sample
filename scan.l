%{
#include <stdio.h>

#define ID    256
#define NUM   257
#define EQ    258
#define NEQ   259
#define LEQ   260
#define GEQ   261
#define IF    262
#define ELSE  263
#define WHILE 264
#define RET   265
#define INT   266
%}

%%

[ \t\n] { /* スペースは無視 */ }

\/\/.*$ { /* コメント(//から行末まで)は無視 */ }

"=="     { return EQ; }
"!="     { return NEQ; }
"<="     { return LEQ; }
">="     { return GEQ; }
"if"     { return IF; }
"else"   { return ELSE; }
"while"  { return WHILE; }
"return" { return RET; }
"int"    { return INT; }

[0-9]+ {
    return NUM;
}

[a-zA-Z][a-zA-Z0-9_]* {
    return ID;
}

. { return yytext[0]; }

%%

int main()
{
    int token;
    while ((token = yylex())) {
        printf("%3d:%s\n", token, yytext);
    }
}
