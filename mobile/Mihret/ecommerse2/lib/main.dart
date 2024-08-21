

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// import 'features/product/domain/usecase/add_product.dart';
// import 'features/product/domain/usecase/get_product.dart';
// import 'features/product/data/data_sources/remote_data_source.dart';
// import 'features/product/data/models/product_model.dart';
import 'features/authentication/presentation/pages/onboarding.dart';
import 'features/authentication/presentation/pages/sign_in.dart';
import 'features/product/presentation/pages/home_page.dart';
import 'service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
   
  await setUp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context)  {
    
    return const MaterialApp(
      home: SignIn()      
    );
  }
}
