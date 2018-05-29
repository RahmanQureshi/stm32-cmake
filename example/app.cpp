#include <stdio.h>

extern "C" {
    int app_start();
}

int app_start()
{
    printf("In app_start()");
    while(1);
}