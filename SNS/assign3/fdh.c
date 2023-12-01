#include <gmp.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <openssl/sha.h>
// FDH 
// Function to generate RSA keys
void generate_keys(mpz_t n, mpz_t e, mpz_t d)
{
    mpz_t p, q, phi;
    mpz_inits(p, q, phi, NULL);

    gmp_randstate_t state;
    gmp_randinit_default(state);
    gmp_randseed_ui(state, rand());

    mpz_urandomb(p, state, 512);
    mpz_urandomb(q, state, 512);
    mpz_nextprime(p, p);
    mpz_nextprime(q, q);

    mpz_mul(n, p, q);

    mpz_t p_1, q_1;
    mpz_inits(p_1, q_1, NULL);

    mpz_sub_ui(p_1, p, 1);
    mpz_sub_ui(q_1, q, 1);
    mpz_mul(phi, p_1, q_1);

    mpz_set_ui(e, 65537);
    mpz_invert(d, e, phi);

    mpz_clears(p, q, phi, p_1, q_1, NULL);
    gmp_randclear(state);
}

// FDH signature generation using RSA
void fdh_sign(mpz_t signature, const char *message, mpz_t d, mpz_t n)
{
    unsigned char hash[SHA256_DIGEST_LENGTH];
    SHA256((unsigned char*)message, strlen(message), hash);

    mpz_t m;
    mpz_init(m);
    // here m is getting hashed and then we are signing it
    mpz_import(m, SHA256_DIGEST_LENGTH, 1, sizeof(hash[0]), 0, 0, hash);

    mpz_powm(signature, m, d, n);

    mpz_clear(m);
}

// FDH signature verification using RSA
int fdh_verify(const char *message, mpz_t signature, mpz_t e, mpz_t n)
{
    unsigned char hash[SHA256_DIGEST_LENGTH];
    SHA256((unsigned char*)message, strlen(message), hash);

    mpz_t m, decrypted_signature;
    mpz_init(m);
    mpz_init(decrypted_signature);
    
    mpz_import(m, SHA256_DIGEST_LENGTH, 1, sizeof(hash[0]), 0, 0, hash);

    mpz_powm(decrypted_signature, signature, e, n);

    int result = mpz_cmp(m, decrypted_signature);
    // here we are just checking if the hash value we got and the decypted msg are smae or not

    mpz_clear(m);
    mpz_clear(decrypted_signature);

    return result == 0;
}

int main()
{
    mpz_t n, e, d, signature;
    mpz_inits(n, e, d, signature, NULL);

    generate_keys(n, e, d);

    const char *message = "This is a test message";
    fdh_sign(signature, message, d, n);

    printf("Signature: ");
    mpz_out_str(stdout, 16, signature);
    printf("\n");

    int is_valid = fdh_verify(message, signature, e, n);
    printf("Signature is %s\n", is_valid ? "valid" : "invalid");

    mpz_clears(n, e, d, signature, NULL);

    return 0;
}