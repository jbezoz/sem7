#include<stdio.h>
#include<gmp.h>
#include<time.h>

// seed for generating prime Q
#define Q 999

// secret keys of A and B
#define A_private 12
#define B_private 13

void get_possible_generator(mpz_t p, mpz_t q, mpz_t g){
    mpz_t u, tmp;
    mpz_inits(u,tmp,NULL);

    // randomly pick u mod p
    gmp_randstate_t rand_state;
    gmp_randinit_mt(rand_state);
    gmp_randseed_ui(rand_state, time(NULL));
    mpz_urandomm(u, rand_state, p);
    gmp_printf("u = %Zd\n", u);
    
    // calculate g = u^(p-1)/q mod p
    mpz_sub_ui(tmp, p, 1);
    mpz_divexact(tmp, tmp, q);
    mpz_powm(g, u, tmp, p);
    mpz_clears(u, tmp, NULL);
    gmp_randclear(rand_state);
}

void get_q(mpz_t q){
    mpz_t tmp;
    mpz_init(tmp);
    mpz_set_ui(tmp, Q);
    mpz_nextprime(q, tmp);
    mpz_clear(tmp);
}

void get_public_prime_and_generator(mpz_t p, mpz_t g){
    mpz_t q;
    mpz_init(q);
    get_q(q);
    mpz_mul_ui(p, q, 2);
    mpz_add_ui(p, p, 1);

    // keep adding q until p is prime, i.e p = q*r + 1
    while(!mpz_probab_prime_p(p, 10)){
        mpz_add(p, p, q);
    }
    while(mpz_cmp_ui(g, 1) == 0) {
        get_possible_generator(p, q, g);
    }
}

int main() {

    // initialize public prime and generator
    mpz_t p, g;
    mpz_t private_a, private_b;
    mpz_inits(p, g, private_a, private_b, NULL);
    mpz_set_ui(g, 1);    
    mpz_set_ui(private_a, A_private);
    mpz_set_ui(private_b, B_private);
    get_public_prime_and_generator(p, g);
    gmp_printf("p = %Zd\n", p);
    gmp_printf("g = %Zd\n", g);

    // users A and B calculate public keys
    printf("Generating public keys...");
    mpz_t public_a, public_b;
    mpz_inits(public_a, public_b, NULL);
    mpz_powm(public_a, g, private_a, p);
    mpz_powm(public_b, g, private_b, p);
    gmp_printf("\nA's public key : %Zd\n", public_a);
    gmp_printf("B's public key %Zd\n", public_b);

    // users A and B calculate shared secret keys using public keys of other
    printf("Generating shared keys...");
    mpz_t shared_a, shared_b;
    mpz_inits(shared_a, shared_b, NULL);
    mpz_powm(shared_a, public_b, private_a, p);
    mpz_powm(shared_b, public_a, private_b, p);
    gmp_printf("\nA's shared key : %Zd\n", shared_a);
    gmp_printf("B's shared key : %Zd\n", shared_b);

    return 0;
}