
#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>





int main(int argc, char *argv[])
{
  float input;
  float x0 = 10;
  int iterations = 10;
  bool printIts = true;
  // float result;

  if (argc != 2) {
    printf("invalid arguments. usage: sqrt 10\n");
    return 1;
  } else {
    input = atoi(argv[1]);
  }
  
  int result;
  testme(iterations, result);
  // get the square root from newton raphson method
  // result = nr_sqrt(&input, &x0, &iterations, &printIts);

  // print results
  // printf("The square root of %f is %f\n", input, result);

  return 0;
}
