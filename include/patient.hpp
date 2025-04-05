#include <string>
#include <iostream>
#include <ctime>

using namespace std;

/// @brief Class representing a patient
/// @details This class contains the patient's first name, last name, address, phone number, and email.
class Patient
{
private:
    u_int id;
    string firstName;
    string lastName;
    string address;
    string dob;
    string regDate;
    string phoneNumber;
    string email;

    void setRegistrationDate();

public:
    Patient(string firstName, string lastName, string address, string dob);
    Patient(string firstName, string lastName, string address, string dob, string phoneNumber, string email);
    ~Patient();

    int getId() { return id; }
    string getFirstName() { return firstName; }
    string getLastName() { return lastName; }
    string getAddress() { return address; }
    string getDob() { return dob; }
    string getRegDate() { return regDate; }
    string getPhoneNumber() { return phoneNumber; }
    string getEmail() { return email; }

    void PrintPatientInfo();
};