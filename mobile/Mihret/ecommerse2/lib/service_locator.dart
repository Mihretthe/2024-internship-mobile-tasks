import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/network/network_info.dart';
import 'features/product/data/data_sources/local_data_source.dart';
import 'features/product/data/data_sources/remote_data_source.dart';
import 'features/product/data/repositories/product_repository_impl.dart';
import 'features/product/domain/repository/productRepository.dart';
import 'features/product/domain/usecase/add_product.dart';
import 'features/product/domain/usecase/delete_product.dart';
import 'features/product/domain/usecase/get_all_product.dart';
import 'features/product/domain/usecase/get_product.dart';
import 'features/product/domain/usecase/update_product.dart';
import 'features/product/presentation/bloc/blocs.dart';

final getIt = GetIt.instance;

Future<void> setUp() async {
  final client = http.Client();
  InternetConnectionChecker connectionChecker = InternetConnectionChecker();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  getIt.registerLazySingleton<InternetConnectionChecker>(
      () => connectionChecker);
  getIt.registerLazySingleton<http.Client>(() => client);
  getIt.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  getIt.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(getIt()));
  getIt.registerLazySingleton<LocalDataSource>(
      () => LocalDataSourceImpl(sharedPreferences: getIt()));
  getIt.registerLazySingleton<ProductRemoteDataSource>(
      () => ProductRemoteDataSourceImpl(client: getIt()));
  getIt.registerLazySingleton<ProductRepository>(
      () => ProductRepositoryImpl(getIt(), getIt(), getIt()));
  getIt.registerLazySingleton(() => GetAllProductUseCase(getIt()));
  getIt.registerLazySingleton(() => GetProductUseCase(getIt()));
  getIt.registerLazySingleton(() => UpdateProductUseCase(getIt()));
  getIt.registerLazySingleton(() => DeleteProductUseCase(getIt())); 
  getIt.registerLazySingleton(() => AddProductUseCase(getIt()));
  getIt.registerSingleton(() => ProductBloc(
        updateProductUseCase: getIt<UpdateProductUseCase>(),
        addProductUseCase: getIt<AddProductUseCase>(),
        deleteProductUseCase: getIt<DeleteProductUseCase>(),
        getAllProductUseCase: getIt<GetAllProductUseCase>(),
        getProductUseCase: getIt<GetProductUseCase>(),
      ));
      
}
