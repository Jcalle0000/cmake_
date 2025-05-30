#include "buggy.hpp"

int main(){
    int return_code=use_after_free();
    return return_code;
}