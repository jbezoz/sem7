#include <stdio.h>
#include <stdlib.h>
#include <gmp.h>

// user-key pair - Database (DB)
#define KEY 6

// hash for user authentication - Authentication Server (AS)
#define HASH 98765

// symmetric encryption - Authentication Server (AS)
void encrypt(mpz_t hash) {
    char* text = mpz_get_str(NULL, 10, hash);
    int val;
    for(int i = 0; text[i] != '\0'; i++) {
        val = text[i] - '0';
        val = (val + KEY) % 10;
        text[i] = val + '0';
    }
    mpz_set_str(hash, text, 10);
    free(text);
}

// symmetric decryption - User
void decrypt(mpz_t hash) {
    char* text = mpz_get_str(NULL, 10, hash);
    int val;
    for(int i = 0; text[i] != '\0'; i++) {
        val = text[i] - '0';
        val = (val - KEY) % 10;
        if(val < 0) {val = val + 10;}
        text[i] = val + '0';
    }
    mpz_set_str(hash, text, 10);
    free(text);
}

// function to get ticket granting ticket - Authentication Server (AS)
void getTGT(mpz_t hash) {
    mpz_set_ui(hash, HASH);
    encrypt(hash);
}

// function to check if the hash was decrypted properly - Authentication Server (AS)
int checkHash(mpz_t hash) {
    printf("Authenticating user...");
    if(mpz_cmp_ui(hash, HASH) == 0) {
        printf("User authenticated!\n");
        return 1;
    }
    else {
        printf("User could not be authenticated!\n");
        return 0;
    }
}

// function to get service ticket (session key) - Ticket Granting Server (TGS)
void getST(mpz_t hash, mpz_t session_key) {
    if(checkHash(hash)) {
        mpz_set_ui(session_key, 12345);
    }
}

// function to get session key - Key Distibution Center (KDC)
void getKeys(mpz_t session_key) {
    mpz_t hash;
    mpz_init(hash);
    getTGT(hash);
    gmp_printf("Encrypted ticket: %Zd\n", hash);
    decrypt(hash);
    gmp_printf("Decrypted ticket: %Zd\n", hash);
    getST(hash, session_key);
    mpz_clear(hash);
}

int main() {
    mpz_t session_key;
    mpz_init(session_key);

    // user requests the KDC to provide a session key
    printf("Requesting ticket...\n");
    getKeys(session_key);
    gmp_printf("Session key: %Zd\n", session_key);

    mpz_clear(session_key);
    return 0;
}
