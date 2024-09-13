import 'dart:io';

class Authentication {
  String? firstname;
  String? lastname;
  int? age;
  String? gender;
  Map<String, String>? address;
  String? username;
  String? password;

  Authentication({String? city, String? barangay}) {
    this.address = {"city": city ?? "", "barangay": barangay ?? ""};
  }

  void printAddress() {
    print("City: ${this.address?["city"]}");
    print("Barangay: ${this.address?["barangay"]}");
  }

  bool register(String firstname, String lastname, int age, String gender,
      String city, String barangay, String username, String password) {
    this.firstname = firstname;
    this.lastname = lastname;
    this.age = age;
    this.gender = gender;
    this.address = {"city": city, "barangay": barangay};
    this.username = username;
    this.password = password;

    return true;
  }

  Map login(String uname, String pword) {
    if (this.username == uname && this.password == pword) {
      return {"status": true, "message": "Login Successful"};
    } else {
      return {"status": false, "message": "Login Failed"};
    }
  }
}

class EditCredentials extends Authentication {
  bool editFname(String new_fname) {
    this.firstname = new_fname;

    if (this.firstname == new_fname) {
      return true;
    } else {
      return false;
    }
  }

  bool editLname(String new_lname) {
    this.lastname = new_lname;

    if (this.lastname == new_lname) {
      return true;
    } else {
      return false;
    }
  }

  bool editAge(int new_age) {
    this.age = new_age;

    if (this.age == new_age) {
      return true;
    } else {
      return false;
    }
  }

  bool editGender(String new_gender) {
    this.gender = new_gender;

    if (this.gender == new_gender) {
      return true;
    } else {
      return false;
    }
  }

  bool editAddress(String new_city, String new_barangay) {
    if (this.address != null) {
      this.address!["city"] = new_city;
      this.address!["barangay"] = new_barangay;

      return true;
    } else {
      return false;
    }
  }

  bool editUsername(String new_username) {
    this.username = new_username;

    if (this.username == new_username) {
      return true;
    } else {
      return false;
    }
  }

  bool editPassword(String new_password) {
    this.password = new_password;

    if (this.password == new_password) {
      return true;
    } else {
      return false;
    }
  }
}

void main() {
  String? city;
  String? barangay;
  // Use EditCredentials for both registration and editing
  EditCredentials editcredentials = new EditCredentials();
  //I did not create an object of the Authentication class since it was inherited by EditCredentials class.

  print("Welcome to Nestler's Restaurant!");

  bool isOpen = true;

  while (isOpen) {
    try {
      print("1.) Register");
      print("2.) Login");
      print("3.) Exit");
      print("Your choice: ");
      int choice = int.parse(stdin.readLineSync()!);

      switch (choice) {
        case 1:
          print("REGISTER");
          print("Enter first name: ");
          String firstname = stdin.readLineSync()!;
          print("Enter last name: ");
          String lastname = stdin.readLineSync()!;
          print("Enter age: ");
          int age = int.parse(stdin.readLineSync()!);

          bool isGenderAcceptable = true;
          String gender;

          do {
            print("Enter gender(M/F): ");
            gender = stdin.readLineSync()!;
            if (gender == 'M' || gender == 'F') {
              isGenderAcceptable = false;
            } else {
              print("Please type 'M' or 'F' only");
            }
          } while (isGenderAcceptable);

          print("Enter Address: ");
          print("City: ");
          city = stdin.readLineSync()!;
          print("Barangay: ");
          barangay = stdin.readLineSync()!;
          print("Enter username: ");
          String username = stdin.readLineSync()!;
          print("Enter password: ");
          String password = stdin.readLineSync()!;

          bool isRegistered = editcredentials.register(firstname, lastname, age,
              gender, city, barangay, username, password);

          if (isRegistered) {
            print("Registration Successful!");
          } else {
            print("Registration failed");
          }
          break;
        case 2:
          print("LOGIN");
          print("Enter your username: ");
          String uname = stdin.readLineSync()!;
          print("Enter your password:");
          String pword = stdin.readLineSync()!;

          Map response = editcredentials.login(uname, pword);

          if (response["status"]) {
            print(response["message"]);
            print(
                "Welcome ${editcredentials.firstname} ${editcredentials.lastname}");

            bool isAppOpen = true;

            while (isAppOpen) {
              try {
                print("MAIN CONTROLLER");
                print("1.) Show credentials");
                print("2.) Edit credentials");
                print("3.) Logout");
                print("Your choice: ");
                int app_choice = int.parse(stdin.readLineSync()!);

                switch (app_choice) {
                  case 1:
                    print("First name: ${editcredentials.firstname}");
                    print("Last name: ${editcredentials.lastname}");
                    print("Age: ${editcredentials.age}");
                    print("Gender: ${editcredentials.gender}");
                    editcredentials.printAddress();
                    print("Username: ${editcredentials.username}");
                    print("Password: ${editcredentials.password}");
                    break;
                  case 2:
                    print("What do you want to edit?");
                    print("1.) Edit first name");
                    print("2.) Edit last name");
                    print("3.) Edit age");
                    print("4.) Edit gender");
                    print("5.) Edit address");
                    print("6.) Edit username");
                    print("7.) Edit password");
                    print("8.) Back");
                    print("Your choice: ");
                    int edit_choice = int.parse(stdin.readLineSync()!);

                    switch (edit_choice) {
                      case 1:
                        print("Enter new first name: ");
                        String new_fname = stdin.readLineSync()!;

                        bool isNewFname = editcredentials.editFname(new_fname);

                        if (isNewFname) {
                          print("First name edit successful");
                        } else {
                          print("First name edit failed");
                        }
                        break;
                      case 2:
                        print("Enter new last name: ");
                        String new_lname = stdin.readLineSync()!;

                        bool isNewLname = editcredentials.editLname(new_lname);

                        if (isNewLname) {
                          print("Last name edit successful");
                        } else {
                          print("Last name edit failed");
                        }
                        break;
                      case 3:
                        print("Enter new age: ");
                        int new_age = int.parse(stdin.readLineSync()!);

                        bool isNewAge = editcredentials.editAge(new_age);

                        if (isNewAge) {
                          print("Age edit successful");
                        } else {
                          print("Age edit failed");
                        }
                        break;
                      case 4:
                        String new_gender;

                        bool isSuccessNewGender = true;

                        while (isSuccessNewGender) {
                          print("Enter new gender: ");
                          new_gender = stdin.readLineSync()!;

                          if (new_gender == 'M' || new_gender == 'F') {
                            bool isNewGender =
                                editcredentials.editGender(new_gender);

                            if (isNewGender) {
                              print("Gender edit successful");
                            } else {
                              print("Gender edit failed");
                            }

                            isSuccessNewGender = false;
                          } else {
                            print("Please enter only 'M' or 'F'");
                          }
                        }

                        break;
                      case 5:
                        print("Enter new City: ");
                        String new_city = stdin.readLineSync()!;
                        print("Enter new Barangay: ");
                        String new_barangay = stdin.readLineSync()!;

                        bool isAddressUpdated =
                            editcredentials.editAddress(new_city, new_barangay);

                        if (isAddressUpdated) {
                          print("Address Updated Successfully");
                        } else {
                          print("Address update failed");
                        }
                        break;
                      case 6:
                        print("Enter new username: ");
                        String new_uname = stdin.readLineSync()!;

                        bool isNewUname =
                            editcredentials.editUsername(new_uname);

                        if (isNewUname) {
                          print("Username edit successful");
                        } else {
                          print("Username name edit failed");
                        }
                        break;
                      case 7:
                        print("Enter new password: ");
                        String new_pword = stdin.readLineSync()!;

                        bool isNewPword =
                            editcredentials.editPassword(new_pword);

                        if (isNewPword) {
                          print("Password edit successful");
                        } else {
                          print("Password edit failed");
                        }
                        break;
                      case 8:
                        print("");
                        break;
                      default:
                        print("Invalid choice");
                        break;
                    }
                    break;
                  case 3:
                    print("Successfully logged out");
                    isAppOpen = false;
                    break;
                  default:
                    print("Invalid choice");
                    break;
                }
              } catch (e, s) {
                print("Exception details: $e");
                print("Track trace: $s");
                print("Try another choice again");
              }
            }
          } else {
            print(response["message"]);
          }

          break;
        case 3:
          isOpen = false;
          break;
        default:
          print("Invalid choice.");
          break;
      }
    } catch (e, s) {
      print("Exception details: $e");
      print("Track trace: $s");
      print("Try another choice again");
    }
  }
  print("Thank you for coming!");
}
