#include "sum_integers.hpp" // sum_integers.hpp is now in src directory

#include <vector>

int main() {
  auto integers = {1, 2, 3, 4, 5};

  if (sum_integers(integers) == 15) {
    return 0;
  } else {
    return 1;
  }
}