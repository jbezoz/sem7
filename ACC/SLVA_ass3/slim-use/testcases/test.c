#include <stdio.h>

int main() {
	int a,b,c,d;
	scanf("%d %d %d %d",&a,&b,&c,&d);
	b = 1 + a;
	c = 2 + a;
	d = 3 + a;
	if(b < d) {
		a = b + 1;
	} else {
		a = d + 5;
	}
	while(b > 5) {
		b = b - 1;
	}
	return a + c;
}
// int main() {
// 	int a,b,c;
// 	scanf("%d %d %d",&a,&b,&c);
// 	a = 1;
// 	if(a > b) {
// 		b = a + c;
// 	} else {
// 		a = b - 1;
// 		b = a + c;
// 	}
// 	c = 1;
// 	while(a <= b) {
// 		a++;
// 	}
// 	return a + b + c;
// }

// int main() {
// 	int a,b,c,d;
// 	scanf("%d %d %d %d",&a,&b,&c,&d);
// 	b = 1 + a;
// 	c = 2 + a;
// 	d = 3 + a;
// 	if(b < d) {
// 		a = b - 1;
// 	} else {
// 		a = d + 5;
// 	}
// 	if(b > 5) {
// 		b = a - 1;
// 	} 
// 	return a + c;
// }


