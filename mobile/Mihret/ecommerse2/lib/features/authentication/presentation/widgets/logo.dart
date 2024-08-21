import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final double width;
  final double height;
  final double fontSize;
  const Logo({super.key, this.width = 264, this.height = 121, this.fontSize = 113});

  @override
  Widget build(BuildContext context) {
    return Center(
                  child: Container(
                   decoration: BoxDecoration(
                      border: Border.all(color: Color.fromARGB(255, 161, 167, 218), width: 0.9),
                      boxShadow: const [BoxShadow(
                        color: Colors.grey,
                        blurRadius: 3,
                        offset: Offset(0.1, 0.3)
                      )],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(7),
                    ),
                    width: width,
                    height: height,
                    child:   Center(
                       
                        child: Text(
                      "ECOM",
                      style: TextStyle(
                        color: Color(0xFF3F51F3),
                        fontSize: fontSize,
                        fontWeight: FontWeight.w900,
                        fontFamily: 'CaveatBrush',
                        
                      ),
                    )),
                  ),
                );
  }
}