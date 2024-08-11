import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;


import '../../../../core/constants/constants.dart';
import '../../../../core/error/exception.dart';
import '../models/product_model.dart';

abstract class ProductRemoteDataSource {
  Future<void> addProduct(ProductModel productModel);
  Future<List<ProductModel>> getAllProduct();
  Future<ProductModel> getProduct(String id);
  Future<void> deleteProduct(String id);
  Future<ProductModel> updateProduct(
      {required String id,
      required String name,
      required int price,
      required String description});
}

class ProductRemoteDataSourceImpl extends ProductRemoteDataSource {
  final http.Client client;

  ProductRemoteDataSourceImpl({required this.client});

  @override
  Future<List<ProductModel>> getAllProduct() async {
    final response = await client.get(Uri.parse(Urls.baseUrl));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body) as Map<String, dynamic>;

      List<ProductModel> products = [];
      for (var data in jsonData['data']) {
        products.add(ProductModel.fromJson(data));
      }

      return products;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<ProductModel> getProduct(String id) async {
    final response = await client.get(Uri.parse('${Urls.baseUrl}/$id'));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body) as Map<String, dynamic>;

      ProductModel productModel = ProductModel.fromJson(jsonData['data']);

      return productModel;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<void> deleteProduct(String id) async {
    final response = await client.delete(Uri.parse('${Urls.baseUrl}/$id'));

    if (response.statusCode != 200) {
      throw ServerException();
    }
  }

  @override
  Future<ProductModel> updateProduct(
      {required String id,
      required String name,
      required int price,
      required String description}) async {
    final response = await client.put(Uri.parse('${Urls.baseUrl}/$id'),
        headers: null,
        body: json.encode(
            {'name': name, 'description': description, 'price': price}));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body) as Map<String, dynamic>;
      final productData = jsonData['data'];
      return ProductModel.fromJson(productData);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<void> addProduct(ProductModel productModel) async {

    var request = http.MultipartRequest('POST', Uri.parse(Urls.baseUrl));
    request.fields.addAll({
        'name' : productModel.name,
        'description' : productModel.description,
        'price' : productModel.price.toString(),
    }
    );
    
    request.files.add(await http.MultipartFile.fromPath('image', productModel.image));
    http.StreamedResponse response = await request.send();

    if (response.statusCode != 200){
        throw ServerException();
    }
  }
}
