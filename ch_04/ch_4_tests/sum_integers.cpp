// sum over a vector of integers
#include "sum_integers.hpp"
#include<vector>

int sum_integers(const std::vector<int> integers){
    auto sum=0;
    for(auto i:integers){
        sum=sum+i;
    }
    return sum;

}