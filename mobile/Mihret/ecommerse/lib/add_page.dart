import 'dart:io';

import 'package:ecommerse/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final ImagePicker _picker = ImagePicker();
  XFile? _image;

  Future<void> _pickImage(ImageSource source) async {
    final XFile? image = await _picker.pickImage(source: source);
    setState(() {
      _image = image;
    });
  }

  Widget banner() {
    return Container(
      width: 366,
      height: 160,
      padding: const EdgeInsets.all(50),
      decoration: BoxDecoration(
          color: const Color(0xFFF3F3F3),
          borderRadius: BorderRadius.circular(16)),
      child: Column(
        mainAxisAlignment: _image == null
            ? MainAxisAlignment.spaceEvenly
            : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                _pickImage(ImageSource.gallery);
              });
            },
            child: const Icon(
              Icons.image_outlined,
              size: 40,
            ),
          ),
          (_image == null)
              ? const Text(
                  "upload image",
                  style: TextStyle(
                      fontWeight: FontWeight.w500, color: Color(0xFF3E3E3E)),
                )
              : Container(
                  height: 90,
                  color: Colors.blue,
                  width: 300,
                  child: Expanded(
                      child: Image.file(
                    File(
                      _image!.path,
                    ),
                    fit: BoxFit.contain,
                  )))
        ],
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Align(
            alignment: Alignment.center, child: Text("Add Product")),
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
              const TextFieldCard("name"),
              const TextFieldCard("category"),
              const TextFieldCard("price", dollar: true),
              const TextFieldCard("description", area: true),
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
                    "ADD",
                    style: TextStyle(color: Color.fromARGB(255, 210, 206, 206)),
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
                      Navigator.of(context).pop();
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
