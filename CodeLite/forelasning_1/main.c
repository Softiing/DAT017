#include <stdio.h>
#include <string.h>
#include <windows.h>

void printByte(char inputByte) {
	int bitNum = sizeof(inputByte)*4;
	printf("Char %c = ", inputByte);
	for(int i = 0; i < bitNum; i++) {
		printf("%i", ((inputByte >> (bitNum - i)) & 0x1));
	}
}

void printShort(short inputShort) {
	int bitNum = sizeof(inputShort)*4;
	for(int i = 0; i < bitNum; i++) {
		printf("%i", ((inputShort >> (bitNum - i)) & 0x1));
	}
}

void printInt(int inputInt) {
	int bitNum = sizeof(inputInt)*4;
	for(int i = 0; i < bitNum; i++) {
		printf("%i", ((inputInt >> (bitNum - i)) & 0x1));
	}
}

int binaryToDec(char binaryString[]) {
	int bitNum = strlen(binaryString);
	int sum = 0;
	int mul = 1;
	for(int i = 0; i < bitNum; i++) {
		if(binaryString[bitNum - i - 1] == '1') {
			sum += mul;
		}
		mul = mul * 2;
	}
	printf("Decimal of %s is %i\n", binaryString, sum);
}


int main() {

	unsigned char c = 128;
	printByte((c | binaryToDec("101010")));
	
	char fillScreen[] = "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n";
	unsigned short a = 0x8000;
	unsigned short b = 0x8000;
	while(1) {
		printf("%s", fillScreen);
		printShort(a|b);
		printf("\n");
		a <<= 1;
		b >>= 1;
		Sleep(100);
	}
	
	return 0;
}
