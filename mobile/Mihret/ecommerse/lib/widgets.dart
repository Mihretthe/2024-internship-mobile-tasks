

import 'package:ecommerse/data.dart';
import 'package:ecommerse/detail_page.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {

  const ProductCard({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (BuildContext context) {
            return  DetailPage(product:  product);
          }));
        },
        child: Card(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(product.image),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(product.title),
                  Text("\$${product.price.toString()}"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    product.subtitle,
                    style: const TextStyle(color: Colors.grey),
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      Text(
                        "(${product.rating.toString()})",
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
  final String? text;
const TextFieldCard(this.title,  {this.text, this.dollar = false, this.area = false, super.key, this.fill = true});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        Stack(children: [
          TextField(
            controller: TextEditingController(text: (text != null)?text:"" ),
            
            keyboardType: dollar? TextInputType.number: TextInputType.text,
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
          dollar ? Positioned(
            right: 0,
            
            child: Container(
              margin: const EdgeInsets.only(left:5, right: 5, bottom: 5, top: 5),
              color: const Color(0xFFF3F3F3),
              padding: const EdgeInsets.all(15),
              child: const Align(
                alignment: Alignment.bottomRight,
                child:  Text('\$'),
              ),
            ),
          ):Container(),
        ])
      ],
    );
  }
}


