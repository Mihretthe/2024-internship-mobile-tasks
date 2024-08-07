import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entity/product.dart';
import '../repository/productRepository.dart';

class UpdateProductUseCase {
  final ProductRepository productRepository;
  UpdateProductUseCase(this.productRepository);

  Future <Either<Failure, Product>> call(String id){
    return productRepository.updateProduct(id);
  }

}
