import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String name;
  const CustomButton({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
      alignment: Alignment.center,
      backgroundColor: Color(0xFF3F51F3),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      minimumSize: const Size(288, 42), // Set the width and height here
      ),
      child: Text(
      name,
      style: const TextStyle(
        color: Colors.white,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
      ),
    );
    
  }
}
