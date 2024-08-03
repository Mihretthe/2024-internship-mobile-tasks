// import 'dart:ffi';

import 'package:ecommerse/add_page.dart';
import 'package:ecommerse/data.dart';
// import 'package:ecommerse/detail_page.dart';
import 'package:ecommerse/search_page.dart';
import 'package:ecommerse/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
        child: Scaffold(
          body: Column(
            children: [
              header(),
              bigTitle("Available Products", Icons.search),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ProductCard(
                        product: Product(
                          image: 'images/image.png',
                          detail_image: 'images/image2.png',
                          title: 'Ikru Shoes',
                          price: '120',
                          rating: 4.0,
                          subtitle: 'Men’s shoe',
                          detail:
                              "A Ikru leather shoe is a classic and versatile footwear option characterized by its open lacing system, where the shoelace eyelets are sewn on top of the vamp (the upper part of the shoe). This design feature provides a more relaxed and casual look compared to the closed lacing system of oxford shoes. Derby shoes are typically made of high-quality leather, known for its durability and elegance, making them suitable for both formal and casual occasions. With their timeless style and comfortable fit, derby leather shoes are a staple in any well-rounded wardrobe.",
                        ),
                      ),
                      ProductCard(
                        product: Product(
                          image: 'images/image.png',
                          detail_image: 'images/mercy.png',
                          title: 'Mercy Shoes',
                          price: '120',
                          rating: 4.0,
                          subtitle: 'Men’s shoe',
                          detail:
                              "A Mercy leather shoe is a classic and versatile footwear option characterized by its open lacing system, where the shoelace eyelets are sewn on top of the vamp (the upper part of the shoe). This design feature provides a more relaxed and casual look compared to the closed lacing system of oxford shoes. Derby shoes are typically made of high-quality leather, known for its durability and elegance, making them suitable for both formal and casual occasions. With their timeless style and comfortable fit, derby leather shoes are a staple in any well-rounded wardrobe.",
                        ),
                      ),
                      ProductCard(
                        product: Product(
                          image: 'images/image.png',
                          detail_image: 'images/image2.png',
                          title: 'Yumi Shoes',
                          price: '120',
                          rating: 4.0,
                          subtitle: 'Men’s shoe',
                          detail:
                              "A Yumi's leather shoe is a classic and versatile footwear option characterized by its open lacing system, where the shoelace eyelets are sewn on top of the vamp (the upper part of the shoe). This design feature provides a more relaxed and casual look compared to the closed lacing system of oxford shoes. Derby shoes are typically made of high-quality leather, known for its durability and elegance, making them suitable for both formal and casual occasions. With their timeless style and comfortable fit, derby leather shoes are a staple in any well-rounded wardrobe.",
                        ),
                      ),
                      ProductCard(
                        product: Product(
                          image: 'images/image.png',
                          title: 'Mahlu Shoes',
                          price: '120',
                          rating: 4.0,
                          subtitle: 'Men’s shoe',
                          detail:
                              "A Mahlu leather shoe is a classic and versatile footwear option characterized by its open lacing system, where the shoelace eyelets are sewn on top of the vamp (the upper part of the shoe). This design feature provides a more relaxed and casual look compared to the closed lacing system of oxford shoes. Derby shoes are typically made of high-quality leather, known for its durability and elegance, making them suitable for both formal and casual occasions. With their timeless style and comfortable fit, derby leather shoes are a staple in any well-rounded wardrobe.",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
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
        ),
      ),
    );
  }
}
