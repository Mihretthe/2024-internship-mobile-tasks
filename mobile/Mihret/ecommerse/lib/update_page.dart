
import 'dart:io';

import 'package:ecommerse/data.dart';
import 'package:ecommerse/home_page.dart';
import 'package:ecommerse/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class UpdateProduct extends StatefulWidget {
  const UpdateProduct({super.key, required this.product});
  final Product product;
  @override
  State<UpdateProduct> createState() => _UpdateProductState();
}

class _UpdateProductState extends State<UpdateProduct> {
  final ImagePicker _picker = ImagePicker();
  XFile? _image;
  String? name;
  String? category;
  double? price;
  String? description;

  Future<void> _pickImage(ImageSource source) async {
    final XFile? image = await _picker.pickImage(source: source);
    setState(() {
      _image = image;
    });
  }

  Widget banner() {
    return GestureDetector(
       onTap: () {
              setState(() {
                _pickImage(ImageSource.gallery);
                debugPrint(_image.toString());
              });
            },
      child: Container(
        width: 366,
        height: 200,
        decoration: BoxDecoration(
            color: const Color(0xFFF3F3F3),
            borderRadius: BorderRadius.circular(16)),
        child: Expanded(
          child: Column(
            mainAxisAlignment: _image == null
                ? MainAxisAlignment.spaceEvenly
                : MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  _image != null? Image.file(File(_image!.path)):
                  Image.asset( widget.product.image, fit: BoxFit.cover,), 
                  const Positioned(
                   child: Icon(
                    Icons.update,
                    size: 40,),
                 ),
                ],
              )
                , const Text(
                      "update image",
                      style: TextStyle(
                          fontWeight: FontWeight.w500, color: Color(0xFF3E3E3E)),
                    )
             
                    
                  
                    
            ],
          ),
        ),
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Align(
            alignment: Alignment.center, child: Text("Update")),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              banner(),
               TextFieldCard("name", text: widget.product.title,),
               TextFieldCard("category", text: widget.product.subtitle,),
               TextFieldCard("price", dollar: true, text: widget.product.price),
               TextFieldCard("description", area: true, text: widget.product.detail,),
              Container(
                margin: const EdgeInsets.all(6),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[800],
                      minimumSize: const Size(366, 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8))),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    "Update",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(6),
                child: OutlinedButton(
                    style: ButtonStyle(
                        minimumSize:
                            WidgetStateProperty.all<Size>(const Size(366, 50)),
                        side: WidgetStateProperty.all<BorderSide>(
                            const BorderSide(
                          color: Colors.red,
                          width: 1,
                        )),
                        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)))),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                        return const HomePage();
                      }));
                    },
                    child: const Text("DELETE",
                        style: TextStyle(color: Colors.red))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
