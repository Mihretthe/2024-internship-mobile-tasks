
import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entity/product.dart';
import '../repository/productRepository.dart';

class DeleteProductUseCase{

  final ProductRepository productRepository;
  DeleteProductUseCase(this.productRepository);

  Future <Either<Failure, Product>> call(String id){
    return productRepository.deleteProduct(id);
  }

}