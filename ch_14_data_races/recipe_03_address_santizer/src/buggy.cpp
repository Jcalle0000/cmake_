#include "buggy.hpp"
#include <iostream>

// this return 0
int leak(){
    double *my_array = new double[1000];
    // forget to deallocate the array
    return 0;
}

// this returns something undefined 

int use_after_free(){
    double *another_array=new double[1000];
    delete[]another_array;
    std::cout<< another_array[123]<< "\n";
}