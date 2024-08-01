import 'package:ecommerse/add_page.dart';
import 'package:ecommerse/detail_page.dart';
import 'package:ecommerse/search_page.dart';
import 'package:ecommerse/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

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
                    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
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
          Stack(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.notifications_outlined,
                    color: Colors.grey,
                    size: 30,
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
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                header(),
                bigTitle("Available Products", Icons.search),
                const SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                        ProductCard(
                          image: 'images/image.png',
                          title: 'Derby Leather Shoes',
                          price: '120',
                          rating: 4.0,
                          subtitle: 'Men’s shoe'),
                       ProductCard(
                          image: 'images/image.png',
                          title: 'Derby Leather Shoes',
                          price: '120',
                          rating: 4.0,
                          subtitle: 'Men’s shoe'),
                       ProductCard(
                          image: 'images/image.png',
                          title: 'Derby Leather Shoes',
                          price: '120',
                          rating: 4.0,
                          subtitle: 'Men’s shoe'),
                       ProductCard(
                          image: 'images/image.png',
                          title: 'Derby Leather Shoes',
                          price: '120',
                          rating: 4.0,
                          subtitle: 'Men’s shoe'),
                    ],
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton: SizedBox(
            width: 52,
            height: 52,
            child: FloatingActionButton(
              shape: const CircleBorder(),
              backgroundColor: const Color.fromARGB(255, 16, 85, 142),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
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
        ),
      ),
    );
  }
}
