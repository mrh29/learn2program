#include <stdio.h>

int main(int argc, char* arg[]) {

    char* name = "Alan";
    int age = 42;

    printf("Hello, world. My name is %s, and I am %u\n", name, age);

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
