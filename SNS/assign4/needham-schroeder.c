#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <gmp.h>

// user-key pair - Database (DB)
#define KEY_A 3
#define KEY_B 5

// user-ID pair - Database (DB)
#define ID_A 1
#define ID_B 2

// increment for predefined function to verify session
#define ADDR 4

// predefined function to verify session
void applyFunc(mpz_t num) {
    mpz_add_ui(num, num, ADDR);
}

// symmetric encryption - User
void encrypt(mpz_t msg, int key) {
    char* text = mpz_get_str(NULL, 10, msg);
    int val;
    for(int i = 0; text[i] != '\0'; i++) {
        val = text[i] - '0';
        val = (val + key) % 10;
        text[i] = val + '0';
    }
    mpz_set_str(msg, text, 10);
    free(text);
}

// symmetric decryption - User
void decrypt(mpz_t msg, int key) {
    char* text = mpz_get_str(NULL, 10, msg);
    int val;
    for(int i = 0; text[i] != '\0'; i++) {
        val = text[i] - '0';
        val = (val - key) % 10;
        if(val < 0) {val = val + 10;}
        text[i] = val + '0';
    }
    mpz_set_str(msg, text, 10);
    free(text);
}

// function to get session key - Key Distibution Center (KDC) to User A (initiator)
void getKeys(mpz_t msgA, mpz_t msgB) {
    
    // a random key is generated for the session by KDC
    mpz_t key_s;
    mpz_init(key_s);
    gmp_randstate_t state;
    gmp_randinit_default(state);
    gmp_randseed_ui(state, time(NULL));
    mpz_t range;
    mpz_init(range);
    mpz_set_ui(range, 10);
    mpz_urandomm(key_s, state, range); // generates a random number between 0 and 10
    mpz_set(msgA, key_s);
    encrypt(msgA, KEY_A);
    mpz_set(msgB, key_s);
    encrypt(msgA, KEY_B);
    encrypt(msgA, KEY_A);

    // user A receives the message and decrypts their part
    decrypt(msgA, KEY_A);
    gmp_printf("Key received from KDC: %Zd\n", msgA);
    mpz_clear(range);
    gmp_randclear(state);
}

// function to share session key - User A (initiator) to User B (responder)
void shareKeys(mpz_t msgB, mpz_t nonce) {

    // user B receives their part of the encrypted text from user A
    decrypt(msgB, KEY_A);
    decrypt(msgB, KEY_B);

    // user B generates a nonce for session and encrypts it with received session key
    printf("Generating nonce...");
    gmp_randstate_t state;
    gmp_randinit_default(state);
    gmp_randseed_ui(state, time(NULL));
    mpz_t range;
    mpz_init(range);
    mpz_set_ui(range, 100000);
    mpz_urandomm(nonce, state, range); // generates a random number between 0 and 100000
    gmp_printf("Nonce generated: %Zd\n", nonce);
    mpz_clear(range);
    gmp_randclear(state);
}

// function to verify session - User B (responder) to User A (initiator)
void verifySession(mpz_t nonce, mpz_t key_s) {
    mpz_t check_nonce;
    mpz_init(check_nonce);
    mpz_set(check_nonce, nonce);
    applyFunc(check_nonce);

    // user B generates a nonce and encrypts with the session key
    encrypt(nonce, mpz_get_ui(key_s));

    // user A decrypts this received nonce and applies a predefined function
    // then encrypts with session key and sends back to B for verification
    decrypt(nonce, mpz_get_ui(key_s));
    applyFunc(nonce);
    encrypt(nonce, mpz_get_ui(key_s));

    // user B decrypts and verifies the session
    decrypt(nonce, mpz_get_ui(key_s));
    if(mpz_cmp(nonce, check_nonce) == 0) {
        printf("Session verified!\n");
    } else {
        printf("Unable to verify session!\n");
    }
}

int main() {
    mpz_t msgA, msgB;
    mpz_inits(msgA, msgB, NULL);

    // user A requests the KDC to provide a session key
    printf("Requesting session key for A -> B...\n");
    getKeys(msgA, msgB);
    
    // user A shares a part of the received message with user B
    printf("A sharing session key with B...\n");
    mpz_t nonce;
    mpz_init(nonce);
    shareKeys(msgB, nonce);

    // user B shares a random nonce with user A encrypted with session key
    // the session is verified if A returns an encrypted predefined function of this nonce
    printf("Verifying session...");
    mpz_t check_nonce;
    mpz_init(check_nonce);
    verifySession(nonce, msgA);

    mpz_clears(msgA, msgB, nonce, check_nonce, NULL);
    return 0;
}
