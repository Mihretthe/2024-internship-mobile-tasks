import 'package:flutter/material.dart';

import '../widgets/logo.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/onboarding.png'),
                fit: BoxFit.cover,
              ),
            ),
            
          ),
          Container(
              width: double.infinity,
              height: double.infinity,
              color: const Color(0x003F51F3).withOpacity(0.5)),
          const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Logo(),
                  SizedBox(
                    width: 312,
                    height: 38,
                    child: Align(
                      
                    alignment: Alignment.center,
                    child: Text(
                      "Ecommerce APP",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        fontSize: 36,
                        fontFamily: 'Poppins',
                      ),
                    ),
                                    ),
                  )
              ],
            ),
          )
        ],
      ),
    );
  }
}
