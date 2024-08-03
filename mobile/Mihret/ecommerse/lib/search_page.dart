import 'package:ecommerse/data.dart';
import 'package:ecommerse/widgets.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  bool filter = false;

  RangeValues currentRange = const RangeValues(20, 80);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Align(
            alignment: Alignment.center, child: Text("Search Product")),
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Stack(children: [
                  TextField(
                    decoration: InputDecoration(
                        hintText: "Leather",
                        label: const Text(
                          "Search",
                          style: TextStyle(
                            color: Color(0xFF666666),
                          ),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(
                                color: Colors.grey, width: 1.0)),
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 212, 224, 208),
                                width: 1))),
                  ),
                  Positioned(
                      top: 5,
                      right: 0,
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.arrow_forward,
                            color: Colors.blue,
                          )))
                ]),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: Material(
                  color: const Color(0xFF3F51F3), // Set the background color
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(12), // Rounded rectangle shape
                  ),
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        filter = !filter;
                      });
                    },
                    icon: const Icon(Icons.filter_list),
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ProductCard(
                    product: Product(
                      image: 'images/image.png',
                      title: 'Derby Leather Shoes',
                      price: '120',
                      rating: 4.0,
                      subtitle: 'Men’s shoe',
                      detail_image: 'images/image2.png',
                      detail:
                              "A Ikru leather shoe is a classic and versatile footwear option characterized by its open lacing system, where the shoelace eyelets are sewn on top of the vamp (the upper part of the shoe). This design feature provides a more relaxed and casual look compared to the closed lacing system of oxford shoes. Derby shoes are typically made of high-quality leather, known for its durability and elegance, making them suitable for both formal and casual occasions. With their timeless style and comfortable fit, derby leather shoes are a staple in any well-rounded wardrobe.",
                    ),
                  ),
                  ProductCard(
                    product: Product(
                      image: 'images/image.png',
                      title: 'Derby Leather Shoes',
                      price: '120',
                      rating: 4.0,
                      subtitle: 'Men’s shoe',
                      detail_image: 'images/image2.png',
                      detail:
                              "A Ikru leather shoe is a classic and versatile footwear option characterized by its open lacing system, where the shoelace eyelets are sewn on top of the vamp (the upper part of the shoe). This design feature provides a more relaxed and casual look compared to the closed lacing system of oxford shoes. Derby shoes are typically made of high-quality leather, known for its durability and elegance, making them suitable for both formal and casual occasions. With their timeless style and comfortable fit, derby leather shoes are a staple in any well-rounded wardrobe.",
                    ),
                  ),
                  ProductCard(
                    product: Product(
                      image: 'images/image.png',
                      title: 'Derby Leather Shoes',
                      price: '120',
                      rating: 4.0,
                      subtitle: 'Men’s shoe',
                      detail_image: 'images/image2.png',
                      detail:
                              "A Ikru leather shoe is a classic and versatile footwear option characterized by its open lacing system, where the shoelace eyelets are sewn on top of the vamp (the upper part of the shoe). This design feature provides a more relaxed and casual look compared to the closed lacing system of oxford shoes. Derby shoes are typically made of high-quality leather, known for its durability and elegance, making them suitable for both formal and casual occasions. With their timeless style and comfortable fit, derby leather shoes are a staple in any well-rounded wardrobe.",
                    ),
                  ),
                ],
              ),
            ),
          ),
          filter
              ? Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 25.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: TextFieldCard(
                              text: "",
                              "Category",
                              fill: false,
                            ),
                          ),
                          Column(
                            children: [
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.0),
                                child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text("Price")),
                              ),
                              RangeSlider(
                                  min: 0,
                                  max: 100,
                                  labels: RangeLabels(
                                    currentRange.start.round().toString(),
                                    currentRange.end.round().toString(),
                                  ),
                                  divisions: 10,
                                  activeColor: const Color(0xFF3F51F3),
                                  inactiveColor: const Color(0xFFD9D9D9),
                                  values: currentRange,
                                  onChanged: (RangeValues values) {
                                    setState(() {
                                      currentRange = values;
                                    });
                                  })
                            ],
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue[800],
                                  minimumSize: const Size(366, 50),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8))),
                              onPressed: () {
                                setState(() {
                                  filter = false;
                                });
                                // Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                                //   return  const SearchPage();
                                // }));
                              },
                              child: const Text(
                                "APPLY",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              : Container()
        ],
      ),
    );
  }
}
