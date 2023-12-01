#include<stdio.h>
#include<string.h>

int main()
{
        char password[10];
        int checkvalue =0;
        printf("Enter your password\n");
        gets(password);
        if(strcmp(password,"abcdefghi"))
        {
                printf("Try again\n");
        }
        else
        {
                printf("Verified\n");
                checkvalue=1;
        }
        if(checkvalue)
        {
        printf("Important code( system, administrative, can be anything\n");
        }
}