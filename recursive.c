#include <stdio.h>
#include <string.h>

char input[100];
int i = 0;

void E();
void Eprime();
void T();

void E() {
    printf("E -> T E'\n");
    T();
    Eprime();
}

void Eprime() {
    if (input[i] == '+') {
        printf("E' -> + T E'\n");
        i++;
        T();
        Eprime();
    } else {
        printf("E' -> ε\n");
    }
}

void T() {
    if (input[i] == 'i' && input[i + 1] == 'd') {
        printf("T -> id\n");
        i += 2;
    } else {
        printf("Error: Expected 'id' at position %d\n", i);
    }
}

int main() {
    printf("Enter the input string (use id for identifiers): ");
    scanf("%s", input);

    printf("\nParsing steps:\n");
    E();

    if (i == strlen(input))
        printf("\nParsing successful — String accepted!\n");
    else
        printf("\nParsing failed — String rejected!\n");

    return 0;
}
