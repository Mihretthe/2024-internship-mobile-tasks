import 'package:dartz/dartz.dart';
import 'package:ecommerse2/core/error/failure.dart';
import 'package:ecommerse2/features/product/domain/entity/product.dart';
import 'package:ecommerse2/features/product/domain/usecase/update_product.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../helpers/test_helper.mocks.dart';

void main() {
  late MockProductRepository mockProductRepository;
  late UpdateProductUseCase updateProductUseCase;

  setUp(() {
    mockProductRepository = MockProductRepository();
    updateProductUseCase = UpdateProductUseCase(mockProductRepository);
  });

  Product product = const Product(
      id: '1',
      name: 'Nike',
      category: 'Shoe',
      description: 'A great Shoe',
      image: 'The Nike',
      price: 99.0);
    String id = '1';

  test('Updated Successfully', () async {
    //arrange
    when(mockProductRepository.updateProduct(id)).thenAnswer((_) async =>  Right(product));

    //act
    final result = await updateProductUseCase.call(id);

    //assert
    expect(result, Right(product));
  } );

  //testing Failure
  Failure failure = const ConnectionFailure('Connection Error');

  test('Failure Update Product', () async {
    //arrange
    when(mockProductRepository.updateProduct(id)).thenAnswer((_) async => Left(failure));

    //act
    final result = await updateProductUseCase.call(id);

    //assert
    expect(result, Left(failure));

  });

}
