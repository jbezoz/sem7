#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <gmp.h>

#define P 968665207
#define Q 1490187607

////////////////// DEPENDENT RSA ///////////////////

// function to generate keys
void keygen(mpz_t n, mpz_t e, mpz_t d, mpz_t k) {
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

    // pick k coprime with n randomly
    gmp_randstate_t state;
    gmp_randinit_default(state);
    gmp_randseed_ui(state, time(NULL));
    mpz_urandomm(k, state, n);
    mpz_gcd(gcd, k, n);
    while(mpz_cmp_ui(gcd, 1) != 0) {
        mpz_urandomm(k, state, n);
        mpz_gcd(gcd, k, n);
    }

    // calculate phi_n
    mpz_sub_ui(p, p, 1);
    mpz_sub_ui(q, q, 1);
    mpz_mul(phi_n, p, q);

    // pick e coprime with phi_n randomly
    mpz_urandomm(e, state, phi_n);
    mpz_gcd(gcd, e, phi_n);
    while(mpz_cmp_ui(gcd, 1) != 0) {
        mpz_urandomm(e, state, phi_n);
        mpz_gcd(gcd, e, phi_n);
    }

    // calculate d
    mpz_invert(d, e, phi_n);

    // print keys
    gmp_printf("e = %Zd, d = %Zd, k = %Zd\n", e, d, k);

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
    mpz_t n, e, d, k;
    mpz_inits(n, e, d, k, NULL);
    keygen(n, e, d, k);

    printf("--ENCRYPT--\n");

    // get plaintext
    mpz_t plaintext;
    mpz_init(plaintext);
    printf("Enter plaintext: ");
    gmp_scanf("%Zd", plaintext);

    // generate k_ciphertext
    mpz_t k_ciphertext, temp;
    mpz_inits(k_ciphertext, temp, NULL);
    mpz_add_ui(temp, k, 1);
    mpz_powm(k_ciphertext, temp, e, n);          // k_ciphertext = (k+1)^e mod n
    gmp_printf("k_ciphertext = %Zd\n", k_ciphertext);

    // encrypt plaintext
    mpz_t ciphertext;
    mpz_init(ciphertext);
    mpz_powm(temp, k, e, n);                    // ciphertext = P*k^e mod n
    mpz_mul(ciphertext, plaintext, temp);
    mpz_mod(ciphertext, ciphertext, n); 

    // print ciphertext
    gmp_printf("ciphertext = %Zd\n", ciphertext);

    printf("--DECRYPT--\n");

    //decrypt k ciphertext
    mpz_t k_plaintext;
    mpz_init(k_plaintext);
    mpz_powm(temp, k_ciphertext, d, n);          // k_plaintext = k_ciphertext^d mod n - 1
    mpz_sub_ui(k_plaintext, temp, 1);
    gmp_printf("k_plaintext = %Zd\n", k_plaintext);

    //decrypt ciphertext
    mpz_powm(temp, k_plaintext, e, n);
    mpz_invert(temp, temp, n);
    mpz_mul(plaintext, ciphertext, temp);       // plaintext = ciphertext(k_plaintext^e)^-1 mod n
    mpz_mod(plaintext, plaintext, n);
    
    // print plaintext
    gmp_printf("plaintext = %Zd\n", plaintext);

    // free variables
    mpz_clears(plaintext, k_plaintext, n, e, d, k, ciphertext, k_ciphertext, temp, NULL);
    return 0;
}