

import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entity/product.dart';

abstract class ProductRepository{
  Future<Either<Failure, List<Product>>> getAllProduct();
  Future<Either<Failure, Product>> deleteProduct(String id);
  Future<Either<Failure, Product>> updateProduct(String id);
  Future<Either<Failure, void>> addProduct(Product product);
  Future <Either<Failure, Product>> getProduct(String id);
  
}


