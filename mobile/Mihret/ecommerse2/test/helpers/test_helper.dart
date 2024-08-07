import 'package:ecommerse2/features/product/domain/repository/productRepository.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';

@GenerateMocks(

  [
    ProductRepository
  ],
  customMocks: [MockSpec<http.Client>(as: #MockHttpClient)],

)

void main() {}