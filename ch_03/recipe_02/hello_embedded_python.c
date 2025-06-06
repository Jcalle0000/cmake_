// #include<Python.h>

// int main(int argc, char *argv[]){

//     Py_SetProgramName( argv[0] ); // optional but recommended

//     Py_Initialize();
//     PyRun_SimpleString("from time import time,ctime\n"
//         "print 'Today is' ctime(time() )\n");
    
//     Py_Finalize();
//     return 0;
// }

#include <Python.h>
#include <wchar.h>

int main(int argc, char *argv[]) {
    wchar_t *program = Py_DecodeLocale(argv[0], NULL);
    if (program == NULL) {
        fprintf(stderr, "Fatal error: cannot decode argv[0]\n");
        exit(1);
    }

    Py_SetProgramName(program);  // Required in Python 3
    Py_Initialize();

    PyRun_SimpleString(
        "from time import time, ctime\n"
        "print('Today is', ctime(time()))\n"
    );

    Py_Finalize();
    PyMem_RawFree(program);
    return 0;
}
