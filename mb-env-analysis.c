/* RESULT:
	size of int: 4
	size of long: 4
	size of long long: 8
	size of void *: 4
	size of sig_atomic_t: 4
	size of size_t: 4
	size of off_t: 4
	size of time_t: 4
*/

#include <stdio.h>
#include <stdlib.h>
#include <signal.h>
#include "xparameters.h"
#include "xil_cache.h"

void print(char *str);

int main()
{
	#ifdef XPAR_MICROBLAZE_USE_ICACHE
		Xil_ICacheEnable();
	#endif
	#ifdef XPAR_MICROBLAZE_USE_DCACHE
		Xil_DCacheEnable();
	#endif

    print("Env analysis (size_of): \r\n \r\n");

    printf("size of int: %d \r\n", (int)sizeof(int));
    printf("size of long: %d \r\n", (int)sizeof(long));
    printf("size of long long: %d \r\n", (int)sizeof(long long));
    printf("size of void *: %d \r\n", (int)sizeof(void *));
    printf("size of sig_atomic_t: %d \r\n", (int)sizeof(sig_atomic_t));
    printf("size of size_t: %d \r\n", (int)sizeof(size_t));
    printf("size of off_t: %d \r\n", (int)sizeof(off_t));
    printf("size of time_t: %d \r\n", (int)sizeof(time_t));

    Xil_DCacheDisable();
    Xil_ICacheDisable();

    return 0;
}
