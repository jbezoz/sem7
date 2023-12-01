#include <stdio.h>
#include <gmp.h>
#include <time.h>
#include <stdlib.h>

void generate_key_pair(mpz_t p, mpz_t g, mpz_t x, mpz_t y) {
    // Generate a random prime number p
    gmp_randstate_t state;
    gmp_randinit_default(state);
    gmp_randseed_ui(state, time(NULL));
    mpz_urandomb(p, state, 256); // 256-bit prime, adjust as needed
    mpz_nextprime(p, p);

    // Choose a random private key x (1 < x < p-1)
    mpz_urandomm(x, state, p);
    mpz_sub_ui(x, x, 1);
    mpz_mod(x, x, p);
    mpz_add_ui(x, x, 1);

    // Choose a random integer g (1 < g < p-1)
    mpz_urandomm(g, state, p);
    mpz_sub_ui(g, g, 1);
    mpz_mod(g, g, p);
    mpz_add_ui(g, g, 1);

    // Compute the public key y = g^x mod p
    mpz_powm(y, g, x, p);

    gmp_randclear(state);
}

void elgamal_encrypt(mpz_t c1, mpz_t c2, const mpz_t m, const mpz_t g, const mpz_t y, const mpz_t p) {
    // Choose a random integer k (1 < k < p-2)
    mpz_t k;
    mpz_init(k);
    gmp_randstate_t state;
    gmp_randinit_default(state);
    gmp_randseed_ui(state, time(NULL));
    mpz_urandomm(k, state, p);
    mpz_sub_ui(k, k, 1);
    mpz_mod(k, k, p);
    mpz_add_ui(k, k, 1);

    // Compute c1 = g^k mod p
    mpz_powm(c1, g, k, p);

    // Compute c2 = (m * y^k) mod p
    mpz_powm(c2, y, k, p);
    mpz_mul(c2, c2, m);
    mpz_mod(c2, c2, p);

    mpz_clear(k);
    gmp_randclear(state);
}

void elgamal_decrypt(mpz_t m, const mpz_t c1, const mpz_t c2, const mpz_t x, const mpz_t p) {
    // Compute s = c1^x mod p
    mpz_t s;
    mpz_init(s);
    mpz_powm(s, c1, x, p);

    // Compute the modular inverse of s
    mpz_t s_inverse;
    mpz_init(s_inverse);
    mpz_invert(s_inverse, s, p);

    // Compute m = (c2 * s_inverse) mod p
    mpz_mul(m, c2, s_inverse);
    mpz_mod(m, m, p);

    mpz_clear(s);
    mpz_clear(s_inverse);
}

int main() {
    mpz_t p, g, x, y, m, c1, c2;
    mpz_inits(p, g, x, y, m, c1, c2, NULL);

    // Generate key pair
    generate_key_pair(p, g, x, y);

    // Message to be encrypted
    mpz_set_ui(m, 12345);

    gmp_printf("Original message: %Zd\n", m);

    // Encrypt the message
    elgamal_encrypt(c1, c2, m, g, y, p);
    gmp_printf("Encrypted message c1: %Zd\n", c1);
    gmp_printf("Encrypted message c2: %Zd\n", c2);


    // Decrypt the message
    elgamal_decrypt(m, c1, c2, x, p);

    gmp_printf("Decrypted message: %Zd\n", m);

    mpz_clears(p, g, x, y, m, c1, c2, NULL);

    return 0;
}
