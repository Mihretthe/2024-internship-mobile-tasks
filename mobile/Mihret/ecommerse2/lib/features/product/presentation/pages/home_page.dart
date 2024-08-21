import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../service_locator.dart';
import '../../domain/usecase/add_product.dart';
import '../../domain/usecase/delete_product.dart';
import '../../domain/usecase/get_all_product.dart';
import '../../domain/usecase/get_product.dart';
import '../../domain/usecase/update_product.dart';
import '../bloc/blocs.dart';
import '../bloc/events.dart';
import '../bloc/states.dart';
import '../widgets/widgets.dart';
import 'add_page.dart';
import 'search_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  Future <void> _refreshProducts(BuildContext context) async {
    print('refreshing');
  BlocProvider.of<ProductBloc>(context).add(GetAllProductEvent());
}

  @override
  State<HomePage> createState() => _HomePageState();
}



class _HomePageState extends State<HomePage> {
  
  Widget bigTitle(title, button) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.w500, fontSize: 24),
          ),
          Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  border: Border.all(
                      width: 1, style: BorderStyle.solid, color: Colors.grey),
                  borderRadius: const BorderRadius.all(Radius.circular(11))),
              child: IconButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (BuildContext context) {
                      return const SearchPage();
                    }));
                  },
                  icon: const Icon(Icons.search, color: Colors.grey)))
        ],
      ),
    );
  }

  Widget header() {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 10),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(11)),
            ),
            child: const Card(
              color: Colors.grey,
            ),
          ),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "July 14, 2023",
                  style: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.w500),
                ),
                Row(
                  children: [
                    Text("Hello,"),
                    Text(
                      "Yohannes",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w500),
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(11)),
                border: Border.all(
                    width: 1, color: const Color.fromARGB(255, 205, 203, 203))),
            child: Stack(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.notifications_outlined,
                      color: Colors.grey,
                      size: 25,
                    )),
                Positioned(
                    top: 10,
                    right: 10,
                    child: Container(
                      width: 12,
                      height: 12,
                      decoration: const BoxDecoration(
                          color: Colors.blue, shape: BoxShape.circle),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       
    body: Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(top: 25),
      child: Column(
        children: [
          header(),
          bigTitle("Available Products", Icons.search),
          BlocProvider(
            create: (context) => ProductBloc(
                addProductUseCase: getIt<AddProductUseCase>(),
                deleteProductUseCase: getIt<DeleteProductUseCase>(),
                updateProductUseCase: getIt<UpdateProductUseCase>(),
                getAllProductUseCase: getIt<GetAllProductUseCase>(),
                getProductUseCase: getIt<GetProductUseCase>())
              ..add(GetAllProductEvent()),
            child: Expanded(
              child: RefreshIndicator(
                  onRefresh: () => widget._refreshProducts(context),
                  child: BlocBuilder<ProductBloc, ProductState>(
                    builder: (context, state) {
                      if (state is LoadingState) {
                        return const CircularProgressIndicator();
                      } else if (state is LoadedState) {
                        // print(state.products);
                        if (state.products.isEmpty) {
                          return const Text('No products available');
                        }
                        return ListView.builder(
                          itemCount: state.products.length,
                          itemBuilder: (context, index) {
                            return ProductCard(product: state.products[index]);
                          },
                        );
                      
                      } else if (state is ErrorState) {
                  print(state.message); 
                        return const Text('Failed to fetch products');
                      } else {
                        return Container();
                      }
                    },
                  ),
                
              ),
            ),
          ),
        ],
      ),
      
    ),
    floatingActionButton: SizedBox(
            width: 60,
            height: 60,
            child: FloatingActionButton(
              shape: const CircleBorder(),
              backgroundColor: const Color(0xFF3F51F3),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return const AddProduct();
                }));
              },
              child: const Icon(
                Icons.add,
                color: Colors.white,
                size: 25,
              ),
            ),
          ),
  );
}}
