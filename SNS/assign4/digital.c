#include <stdio.h>
#include <gmp.h>
#include <stdbool.h>
#include<time.h>
#include<string.h>
typedef struct dig_cert_struct{
    int vn;
    int sn;
    char issuer[111];
    char from[44];
    char to[44];
    char sub[111];
    mpz_t signed_pub_key;
}dig_cert;
void generate_CA_keys(mpz_t CA_pub_key,mpz_t CA_priv_key,mpz_t n){
    mpz_t p,q,phin;
    mpz_inits(p,q,phin,NULL);
    mpz_set_str(p,"53",10);
    mpz_set_str(q,"59",10);
    mpz_set_str(CA_pub_key,"3",10);
    mpz_mul(n,p,q);
    mpz_sub_ui(p,p,1);
    mpz_sub_ui(q,q,1);
    mpz_mul(phin,p,q);
    mpz_invert(CA_priv_key, CA_pub_key, phin);
    mpz_clears(p,q,phin,NULL);
}
dig_cert create_digital_certificate(dig_cert subject_cert,char* subject_name,mpz_t subject_pub_key,time_t timestamp,mpz_t CA_priv_key,mpz_t n){
    subject_cert.vn=2;
    subject_cert.sn=1;
    strcpy(subject_cert.issuer,"MyCertificateAuthority");
    strcpy(subject_cert.from,ctime(&timestamp));
    struct tm *time_info;

    // Get the timestamp
    time(&timestamp);
    time_info = localtime(&timestamp);

    // Add 24 hours
    time_info->tm_hour += 24;

    // Use mktime to normalize the time
    timestamp = mktime(time_info);
    strcpy(subject_cert.to,ctime(&timestamp));
    strcpy(subject_cert.sub,subject_name);

    mpz_powm(subject_cert.signed_pub_key,subject_pub_key,CA_priv_key,n);
    FILE *file = fopen("digital_certificate.pem", "w");
    if (file) {
        fprintf(file, "Version Number : %d\n",subject_cert.vn);
        fprintf(file, "Serial Number : %d\n",subject_cert.sn);
        fprintf(file, "Issuer Name : %s\n",subject_cert.issuer);
        fprintf(file, "Valid From : %s",subject_cert.from);
        

        fprintf(file, "Valid Till : %s",subject_cert.to);
        fprintf(file, "Subject Name : %s\n",subject_cert.sub);
        
        char * str=NULL;
        str=mpz_get_str(str,10,subject_cert.signed_pub_key);
        fprintf(file, "Subject Public key(digitally signed) : %s",str);
        fclose(file);
    }
    return subject_cert;
}
int main(){
    mpz_t CA_pub_key,CA_priv_key,n;
    mpz_inits(CA_pub_key,CA_priv_key,n,NULL);
    generate_CA_keys(CA_pub_key,CA_priv_key,n);
    gmp_printf("CA_public_key : %Zd\nCA_private_key : %Zd\n",CA_pub_key,CA_priv_key);
    mpz_t bob_pub_key;
    mpz_inits(bob_pub_key,NULL);

    mpz_set_str(bob_pub_key, "53", 10);
    gmp_printf("subject public key : %Zd\n",bob_pub_key);
    time_t timestamp;
    time(&timestamp);
    dig_cert bob_cert;
    mpz_init(bob_cert.signed_pub_key);
    bob_cert=create_digital_certificate(bob_cert,"bob",bob_pub_key,timestamp,CA_priv_key,n);
    
    mpz_t result;
    mpz_inits(result,NULL);
    mpz_powm(result,bob_cert.signed_pub_key,CA_pub_key,n);
    gmp_printf("public key decrypted using CA's public key : %Zd\n",result);
    return 0;
}