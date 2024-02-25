// sim_main.cpp
#include "Vicecream_pkg.h"
#include "verilated.h"

int main(int argc, char **argv, char **env) {
    Verilated::commandArgs(argc, argv);
    Vicecream_pkg* top = new Vicecream_pkg;
    while (!Verilated::gotFinish()) { top->eval(); }
    delete top;
    return 0;
}

