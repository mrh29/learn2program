#include <stdio.h>
#include <stdint.h>
#include <assert.h>

// Password requirements
#define REQUIRED_UPPER_CASE (1)
#define REQUIRED_NUMBERS    (1)
#define REQUIRED_SPECIAL    (1)

// Number of supported special chars
#define NUM_SPECIAL         (6)       

// Global array of supported special chars
char special[NUM_SPECIAL] = {'!', '@', '#', '$', '%', '&'};

uint8_t is_upper(char c) {
    return (c >= 'A') && (c <= 'Z');
}

uint8_t is_lower(char c) {
    return (c >= 'a') && (c <= 'z');
}

uint8_t is_special(char c) {
    // Iterate over special char array
    for (int i = 0; i < NUM_SPECIAL; i++) {
        if (c == special[i]) {
            return 1;
        }
    }
    return 0;
}

uint8_t is_number(char c) {
    return (c >= '0') && (c <= '9');
}


#define NUM_TESTS (9)

typedef struct password_test_t {
    const char* password;
    uint8_t length;
    uint8_t result;
} password_test_t;

static password_test_t password_tests[NUM_TESTS] = {{"IMeet3Requirements!", 21, 1},
                                                        // only numbers
                                                        {"12345678", 9, 0},
                                                        // only lowercase
                                                        {"abcdefghi", 10, 0},
                                                        // only uppercase
                                                        {"ABCDEFG", 8, 0},
                                                        // only special
                                                        {"!@#S\%&", 6, 0},
                                                        // no special
                                                        {"abcDEFG123", 11, 0},
                                                        // no number
                                                        {"abcDEF$\%&", 9, 0},
                                                        // no uppercase
                                                        {"abc123$\%&", 10, 0},
                                                        // unsupported character
                                                        {"abcDEF123$\%)", 13, 0}};


uint8_t validate_password(const char* password, uint8_t length) {

    uint8_t upper_count = 0;
    uint8_t special_count = 0;
    uint8_t number_count = 0;

    // Iterate over each char in the password
    for (int i = 0; i < length; i++) {
        // The \0 character is special and marks the end of a string
        if (password[i] == '\0') {
            break;
        }
        if (is_upper(password[i])) {
            // ++ is a special operator that is equivalent to upper_count = upper_count + 1;
            upper_count++;
        } else if (is_lower(password[i])) {
            // no-op
        } else if (is_special(password[i])) {
            special_count++;
        } else if (is_number(password[i])) {
            number_count++;
        }
        else {
            printf("Unsupported character!\n");
            return 0;
        }
    }

    // Check that our counts meet the requirements
    return special_count >= REQUIRED_SPECIAL &&
            upper_count >= REQUIRED_UPPER_CASE &&
            number_count >= REQUIRED_NUMBERS;
}

int main(int argc, char* argv[]) {
    for (int i = 0; i < NUM_TESTS; i++) {
        assert(validate_password(password_tests[i].password, password_tests[i].length) == password_tests[i].result);
    }
    printf("All tests passed!\n");
    return 0;
}