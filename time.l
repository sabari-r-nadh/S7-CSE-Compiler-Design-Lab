%{
#include <stdio.h>
#include <stdlib.h>

int h, m, s; 
%}
%%
([0-9]{2}):([0-9]{2}):([0-9]{2}) {
    // Extract hours, minutes, and seconds
    sscanf(yytext, "%d:%d:%d", &h, &m, &s);

    if (h >= 0 && h < 12)
        printf("Good Morning\n");
    else if (h >= 12 && h < 17)
        printf("Good Afternoon\n");
    else if (h >= 17 && h < 24)
        printf("Good Evening\n");
    else
        printf("Invalid Time\n");
}
.|\n ; // ignore other characters
%%

int main() {
    printf("Enter time in 24HR format (HH:MM:SS): ");
    yylex();
    return 0;
}
