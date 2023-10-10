#include <stdint.h>
#include<iostream>
using namespace std;


uint16_t count_leading_zeros(uint32_t x) {
    x |= (x >> 1);
    x |= (x >> 2);
    x |= (x >> 4);
    x |= (x >> 8);
    x |= (x >> 16);

    /* count ones (population count) */
    x -= ((x >> 1) & 0x55555555);
    x = ((x >> 2) & 0x33333333) + (x & 0x33333333);
    x = ((x >> 4) + x) & 0x0f0f0f0f;
    x += (x >> 8);
    x += (x >> 16);
    int a = (32 - (x & 0x3f));

    return (32 - (x & 0x3f));
}

int main(void)
{
    int divisor = 8, dividend = 19;
    int move_right = 31 - count_leading_zeros(divisor);
    int result = dividend >> move_right;
    printf("%d divided by %d = %d\n", dividend, divisor, result);
    int remainder = dividend & (divisor - 1);
    printf("remainder = %d", remainder);
    return 0;
}