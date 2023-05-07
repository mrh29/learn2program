#include <stdio.h>

int main(int argc, char* arg[]) {

    // User's name and age
    // TODO: change to your own name and age
    char* name = "Alice";
    int age = 42;

    // print the name and age
    printf("Hello, world. My name is %s, and I am %u\n", name, age);

/* Multi-line comment
 *  This comment spans multiple
 *  lines and continues
 *  until it is closed */
    if (age < 12) {
        printf("You're a child\n");
    } else if (age < 20) {
        printf("You're a teen\n");
    } else if (age < 30) {
        printf("You're in your twenties\n");
    } else if (age == 100) {
        printf("You're a century old!\n");
    } else {
        printf("You're older than 30\n");
    }

    return 0;
}