import 'dart:io';

class Authentication {
  String? username;
  String? password;

  bool register(String username, String password) {
    this.username = username;
    this.password = password;

    return true;
  }

  Map login(String uname, String pword) {
    if (this.username == uname && this.password == pword) {
      return {"status": true, "message": "Login Successfully"};
    } else {
      return {"status": false, "message": "Login Failed"};
    }
  }
}

class Product {
  String? name;
  double? price;
  int? quantity;
  List<Product> products = [];

  void addProduct(String name, double price, int quantity) {
    Product product = new Product();
    product.name = name;
    product.price = price;
    product.quantity = quantity;

    products.add(product);
  }
}

void main() {
  Authentication auth = new Authentication();

  print("WELCOME TO SIMPLE POS SYSTEM");

  bool isOpen = true;

  while (isOpen) {
    print("1.) Login");
    print("2.) Register");
    print("3.) Exit");
    print("Your choice: ");
    int choice = int.parse(stdin.readLineSync()!);

    switch (choice) {
      case 1:
        print("Login");
        print("Enter your username: ");
        String uname = stdin.readLineSync()!;
        print("Enter your password: ");
        String pword = stdin.readLineSync()!;

        Map response = auth.login(uname, pword);

        if (response["status"]) {
          print(response["message"]);

          print("1.) Add product");
          print("2.) View product");
          print("3.) Delete product");
          print("4.) Exit POS");
          print("Your choice: ");
          int posChoice = int.parse(stdin.readLineSync()!);
          print(posChoice);
        } else {
          print(response["status"]);
        }

        break;
      case 2:
        print("Register");
        print("Enter your username:");
        String username = stdin.readLineSync()!;
        print("Enter your password:");
        String password = stdin.readLineSync()!;

        bool isRegisterSuccess = auth.register(username, password);

        if (isRegisterSuccess) {
          print("Register Successful");
        } else {
          print("Register Failed");
        }

        break;
      case 3:
        isOpen = false;
        break;
      default:
        print("Invalid choice");
        break;
    }
  }
  print("Thank you for using simple POS system!");
}
