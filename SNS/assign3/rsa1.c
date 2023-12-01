#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <gmp.h>

#define P 968665207
#define Q 1490187607

////////////////// NORMAL RSA ///////////////////

// function to generate keys
void keygen(mpz_t n, mpz_t e, mpz_t d) {
    mpz_t p, q, phi_n, gcd, temp;
    mpz_inits(p, q, phi_n, gcd, temp, NULL);

    // use P and Q to get primes p and q
    mpz_set_ui(p, P);
    mpz_nextprime(p, p);
    mpz_set_ui(q, Q);
    mpz_nextprime(q, q);

    // calculate n
    mpz_mul(n, p, q);
    gmp_printf("p = %Zd, q = %Zd, n = %Zd\n", p, q, n);

    // calculate phi_n
    mpz_sub_ui(p, p, 1);
    mpz_sub_ui(q, q, 1);
    mpz_mul(phi_n, p, q);

    // pick e coprime with phi_n randomly
    gmp_randstate_t state;
    gmp_randinit_default(state);
    gmp_randseed_ui(state, time(NULL));
    mpz_urandomm(e, state, phi_n);
    mpz_gcd(gcd, e, phi_n);
    while(mpz_cmp_ui(gcd, 1) != 0) {
        mpz_urandomm(e, state, phi_n);
        mpz_gcd(gcd, e, phi_n);
    }

    // calculate d
    mpz_invert(d, e, phi_n);

    // print keys
    gmp_printf("e = %Zd, d = %Zd\n", e, d);

    // check if ed = 1 mod phi_n
    mpz_mul(temp, e, d);
    mpz_mod(temp, temp, phi_n);
    if(mpz_cmp_ui(temp, 1) != 0) {
        printf("Something went wrong!");
    }

    // free uneeded variables
    mpz_clears(p, q, phi_n, gcd, temp, NULL);
    gmp_randclear(state);
}

int main() 
{
    printf("--KEYGEN--\n");

    // get keys
    mpz_t n, e, d;
    mpz_inits(n, e, d, NULL);
    keygen(n, e, d);

    printf("\n--ENCRYPTION--\n");

    // get plaintext
    mpz_t plaintext;
    mpz_init(plaintext);
    printf("Enter plaintext: ");
    gmp_scanf("%Zd", plaintext);

    // encrypt plaintext
    mpz_t ciphertext;
    mpz_init(ciphertext);
    mpz_powm(ciphertext, plaintext, e, n);

    // print ciphertext
    gmp_printf("ciphertext = %Zd\n", ciphertext);

    printf("\n--DECRYPTION--\n");

    // decrypt ciphertext
    mpz_powm(plaintext, ciphertext, d, n);
    
    // print plaintext
    gmp_printf("plaintext = %Zd\n", plaintext);

    // free variables
    mpz_clears(plaintext, n, e, d, ciphertext, NULL);
    return 0;
}