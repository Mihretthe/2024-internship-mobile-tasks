import 'product.dart';
import 'dart:io';

void main(){
  
  Ecommerce commerce = Ecommerce();
  while (true){
  print("*************************Welcome***************************************");
  print("      1. Add New Products");
  print("      2. View All Products");
  print("      3. View Single Product");
  print("      4. Edit Product");
  print("      5. Delete Product");
  print("***********************************************************************");

  String? choice = stdin.readLineSync();
  if (choice == null){
    print("Invalid Input try again");
    main();
  }
  int choose = int.parse(choice ?? '0');
  if (choose == 0 || choose > 5){
    print("Invalid input try again");
    main();
  }
  if (choose == 1){
    commerce.addNewProduct();
  }else if (choose == 2){
    commerce.viewAllProducts();
  }else if (choose == 3){
    print("Product Name:");
    String? name = stdin.readLineSync();
    commerce.viewProductByName(name);
  }else if(choose == 4){
    print("Product Name:");
    String? name = stdin.readLineSync();
    commerce.editProduct(name);
  }else{
    print("Product Name:");
    String? name = stdin.readLineSync();
    commerce.deleteByName(name);
  }
  print("Press 1 to continue else any key");
   String? cont = stdin.readLineSync();
   int contt = int.parse(cont ?? '0');
   if (contt != 1){
      return ;
   }
   }

  
}

class Ecommerce{

  var  _products = [];

  void addNewProduct(){
      print("Product Name:");
      String? name = stdin.readLineSync();
      if (name == null){
        print("Invalid input try again");
        return;
      }
      print("Product Description:");
      String? description = stdin.readLineSync();
      if (description == null){
        print("Invalid input try again");
        return;
      }
      print("Product price:");
      String? price = stdin.readLineSync();
    
      if (price == null){
        print("Invalid input try again");
        return;
      }
      double new_value = double.parse(price); 

      Product p = Product();
      p.name = name;
      p.description = description;
      p.price = new_value;
    _products.add(p);
    print("Product added successfully!");
  }

  void viewAllProducts(){
    print("");
      for (var p in _products){
        print("Product Name: ${p.name}");
        print("Product Description: ${p.description}");
        print("Product Price: ${p.price}");
        print("");
      }
    print("This is all!");
  }

  void viewProductByName(String? name){
    print("");
      for (var p in _products){
        if (p.name == name){
          print("Product found successfully!!!");
          print("Product Name: ${p.name}");
          print("Product Description: ${p.description}");
          print("Product Price: ${p.price}");
          print("");
          return;
        }        
      }
      print("Product Not Found!");
  }

  void editProduct(name){

    print("");
      for (var p in _products){
        if (p.name == name){
          print("Product Name:");
          String? newName = stdin.readLineSync(); 
          if (newName != ""){
            p.name = newName;
          }else{
            print("The product name will continue as it was");
          }
          print("Product Description:");
          String? newDescription = stdin.readLineSync(); 
          if (newDescription != ""){
            p.description = newDescription;
          }else{
            print("The product description will continue as it was");
          }
          print("Product Price:");
          String? new_price = stdin.readLineSync(); 
          if (new_price != ""){
              double new_value = double.parse(new_price ?? '0');
              p.price = new_value;
          }else{
            print("The product price will continue as it was.");
          }         

          print("");
          print("Edited version");
          print("Product Name: ${p.name}");
          print("Product Description: ${p.description}");
          print("Product Price: ${p.price}");
          print("");
          return;
        }        
      }
      print("Product Not Found!");

  }

  void deleteByName(String? name){
    int index = -1;
      for (int i = 0; i < _products.length; i ++){
        if (_products[i].name == name){
            index = i;
            break;
        }
      }

    if (index == -1){
      print("Product Not Found!");
    }else{
      _products.removeAt(index);
      print("Deleted Successfully");
    }

  }
} 