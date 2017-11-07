#include <stdio.h>
#include <string.h>

void printByte(char inputByte) {
	int bitNum = sizeof(inputByte)*4;
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

void printBinary(char binaryString[]) {
	int bitNum = strlen(binaryString);
	int sum = 0;
	int mul = 1;
	for(int i = 0; i < bitNum; i++) {
		if(binaryString[bitNum - i - 1] == '1') {
			sum += mul;
		}
		mul = mul * 2;
	}
	printf("Decimal of %s is %i", binaryString, sum);
}

int main() {
	printByte('s');
	printf("\n");
	printShort(55);
	printf("\n");
	printInt(55);
	printf("\n");
	printBinary("0111");
	return 0;
}
