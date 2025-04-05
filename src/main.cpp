#include <iostream>
#include <string>

#include "patient.hpp"

using namespace std;

int main() {
    Patient p1("John", "Doe", "1 Main Street", "01/01/2000", "1234567890", "johndoe@gmail.com");

    p1.PrintPatientInfo();

    return 0;
}