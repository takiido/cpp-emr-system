#include "patient.hpp"

/// @brief Constructor for the Patient class
/// @details This constructor initializes the patient with additional info.
/// @param firstName Patient's first name
/// @param lastName Patient's last name
/// @param address Patient's address
/// @param dob Patient's date of birth
/// @param phoneNumber Patient's phone number
/// @param email Patient's email
Patient::Patient(string firstName, string lastName, string address, string dob, string phoneNumber, string email)
{
    this->firstName = firstName;
    this->lastName = lastName;
    this->address = address;
    this->dob = dob;
    this->phoneNumber = phoneNumber;
    this->email = email;
    setRegistrationDate();
}

/// @brief Constructor for the Patient class
/// @details Default patient constructor.
/// @param firstName 
/// @param lastName 
/// @param address 
/// @param dob 
Patient::Patient(string firstName, string lastName, string address, string dob)
{
    this->firstName = firstName;
    this->lastName = lastName;
    this->address = address;
    this->dob = dob;
    this->phoneNumber = "";
    this->email = "";
    setRegistrationDate();
}

Patient::~Patient() { }

void Patient::PrintPatientInfo()
{
    cout << "Patient "<< id << " Information:" << endl;
    cout << "First Name: " << firstName << endl;
    cout << "Last Name: " << lastName << endl;
    cout << "Address: " << address << endl;
    cout << "Date of Birth: " << dob << endl;
    cout << "Phone Number: " << phoneNumber << endl;
    cout << "Email: " << email << endl;
    cout << "Registered: " << regDate << endl;
}

void Patient::setRegistrationDate() {
    time_t now = time(0);
    struct tm tstruct;

    tstruct = *localtime(&now);
    regDate = to_string(tstruct.tm_mon) + "/" + to_string(tstruct.tm_mday) + "/" + to_string(tstruct.tm_year + 1900);
}