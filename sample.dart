import 'dart:io';

class Authentication {
  String? username;
  String? password;

  bool register(String username, String password) {
    this.username = username;
    this.password = password;

    return true;
  }

  Map login(String username, String password) {
    if (this.username == username && this.password == password) {
      return {"status": true, "message": "Login successfully"};
    } else {
      return {"status": false, "message": "Login failed"};
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

  void viewProduct() {
    print("Product List");
    print("Name\tPrice\tQuantity");
    for (Product product in products) {
      print("${product.name}\t${product.price}\t${product.quantity}");
    }
  }
}

void main() {
  // Get login response
  Authentication auth = new Authentication();
  Product product = new Product();

  bool isAppOpen = true;

  print(
      "---------------------Welcome Simple POS System------------------------");
  while (isAppOpen) {
    print("1. Login");
    print("2. Register");
    print("3. Exit");
    print("Enter your choice:");
    int choice = int.parse(stdin.readLineSync()!);

    // Switch case
    switch (choice) {
      case 1:
        print("---------------Login Screen----------------");
        print("Enter your username: ");
        String username = stdin.readLineSync()!;
        print("Enter your password: ");
        String password = stdin.readLineSync()!;

        Map response = auth.login(username, password);

        if (response['status']) {
          print(response['message']);
          print("Welcome ${auth.username}");

          // POS System
          print("---------------POS System----------------");
          bool isPosOpen = true;
          while (isPosOpen) {
            print("1. Add product");
            print("2. View product");
            print("3. Delete product");
            print("4. Exit POS");

            print("Enter your choice:");
            int posChoice = int.parse(stdin.readLineSync()!);
            switch (posChoice) {
              case 1:
                print("Enter product name:");
                String name = stdin.readLineSync()!;
                print("Enter product price:");
                double price = double.parse(stdin.readLineSync()!);
                print("Enter product quantity:");
                int quantity = int.parse(stdin.readLineSync()!);

                product.addProduct(name, price, quantity);
                break;
              case 2:
                product.viewProduct();
                break;
              case 3:
                print("Enter product name to delete: ");
                String name = stdin.readLineSync()!;
                product.products.removeWhere((element) => element.name == name);
                break;
              case 4:
                isPosOpen = false;
                break;
              default:
                print("Invalid choice");
            }
          }
        } else {
          print(response['message']);
        }
        break;
      case 2:
        print("-----------------Registration Form-----------------");
        print("Enter username:");
        String username = stdin.readLineSync()!;
        print("Enter password:");
        String password = stdin.readLineSync()!;

        bool isRegisterSuccess = auth.register(username, password);

        if (isRegisterSuccess) {
          print("Register successful");
        } else {
          print("Register failed");
        }
        break;
      case 3:
        isAppOpen = false;
        break;
      default:
        print("Invalid choice");
    }
  }
  print("Thank you for using Simple POS System");
}
