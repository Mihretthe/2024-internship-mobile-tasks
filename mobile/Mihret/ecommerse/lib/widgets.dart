

import 'package:ecommerse/detail_page.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final title;
  final image;
  final price;
  final subtitle;
  final rating;

  const ProductCard({super.key,this.title, this.image, this.price, this.rating, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (BuildContext context) {
            return const DetailPage();
          }));
        },
        child: Card(
            child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Image.asset(image),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(title),
                  Text("\$$price"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    subtitle,
                    style: const TextStyle(color: Colors.grey),
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      Text(
                        "($rating)",
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }
}

class TextFieldCard extends StatelessWidget {
  final title;
  final dollar;
  final fill;
  final area;
  const TextFieldCard(this.title, {this.dollar = false, this.area = false, super.key, this.fill = true});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        Stack(children: [
          TextField(
            maxLines: area ? 4 : 1,
            decoration: InputDecoration(
                
                filled: fill? true: false,
                fillColor: const Color(0xFFF3F3F3),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide:  BorderSide(
                        color: (fill)?Colors.transparent:Colors.grey, width: fill?2.0:1.0)),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color.fromARGB(255, 212, 224, 208), width: 2))),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Text(dollar ? '\$' : ""),
            ),
          )
        ])
      ],
    );;
  }
}