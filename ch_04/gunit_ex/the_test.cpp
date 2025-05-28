#include "sum_integers.hpp"
#include "gtest/gtest.h"
#include<vector>

// int main(){
int main( int argc, char **argv ){
    ::testing::InitGoogleTest(&argc, argv);
    return RUN_ALL_TESTS();
}

TEST(example, sum_zero){
    auto integers={1,2,3,4,5};

    auto result=sum_integers(integers);
    ASSERT_EQ(result,15);

}


// TEST(example, sum_one){
//     auto integers={1,2,3,4,5};

//     auto result=sum_integers(integers);
//     ASSERT_EQ(result,0);

// }