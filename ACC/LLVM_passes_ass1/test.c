#include <stdio.h>
int main() {
    int x;
    scanf("%d",&x);
    int y = 2 * x;
    int z = y + 10;
    if(z % 2) {
        z++;
    } else {
        z -= 10;
        z /= 2;
    }
    return z;
}
