%{
#include <stdio.h>
int hour, min, sec;
%}

%%
([0-9]{2}):([0-9]{2}):([0-9]{2}) {
    sscanf(yytext, "%d:%d:%d", &hour, &min, &sec);

    if(hour >= 0 && hour < 12)
        printf("Good Morning\n");
    else if(hour >= 12 && hour < 17)
        printf("Good Afternoon\n");
    else if(hour >= 17 && hour < 24)
        printf("Good Evening\n");
    else
        printf("Invalid Time\n");
}
%%

int main() {
    printf("Enter time in HH:MM:SS format: ");
    yylex();
    return 0;
}
