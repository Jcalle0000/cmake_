#include<chrono>
#include<iostream>
#include<thread>

static const int num_threads=16;

void increase(int i, int &s){
    std::this_thread::sleep_for(std::chrono::seconds(1) ) ;
    std::cout<< "thread " << i<< " increases "<< s++ << "\n"; 
}

int main(){
    std::thread t[num_threads]; // array of threads?
    int s=0;

    // start threads
    for(auto i= 0;i<num_threads;i++){
        t[i]=std::thread(increase, i, std::ref(s) );
    }

    // join threads with main
    for(auto i=0;i<num_threads;i++){
        t[i].join();
    }
    std::cout<< "final s: "<< s <<"\n";

}

// this will manifest data races since we are modifying the same address
// the final s that is printed will differ from run to run
// we will use threadSantizer