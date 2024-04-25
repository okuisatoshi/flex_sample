%{
#include <stdio.h>
int n = 0;
%}

%%

[^ \t\n]+    { n++; }

%%

int main()
{
    yylex();
    printf("%d\n", n);
}
