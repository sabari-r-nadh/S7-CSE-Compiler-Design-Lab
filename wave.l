%{
#include <stdio.h>
%}

%%
up|down        { printf("|"); }
top            { printf("--"); }
bottom         { printf("__"); }
[ \t\n]+       { /* ignore spaces/tabs/newlines */ }
.              { /* ignore other single characters */ }
%%

int main() {
    printf("Enter a line of code:\n");
    yylex();
    return 0;
}

int yywrap(){
    return 1;
}