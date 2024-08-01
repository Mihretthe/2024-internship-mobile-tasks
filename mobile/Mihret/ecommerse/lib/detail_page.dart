import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  
  int current = 39;

  Widget sizeNumber(number) {
    return GestureDetector(
      onTap: () {
        setState(() {
           current = int.parse(number);
        debugPrint('$current');
        });
       
      },
      child:  Container(
          width: 60,
          height: 60,
          decoration:  BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(color:(current != int.parse(number))?  const Color.fromARGB(255, 236, 236, 247).withOpacity(0.5): const Color.fromARGB(255, 7, 80, 214)
              ),
              
            ]  ,
          
          ),
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          margin: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
          child: Center(child: Text(number, style:  TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color:(current == int.parse(number))? Colors.white: Colors.black)),)),
        
      
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(children: [
              Image.asset('images/image2.png'),
              Positioned(
                  top: 20,
                  left: 15,
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Colors.white),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back_ios_new_rounded,
                          size: 18, color: Colors.blue),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ))
            ]),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Men's shoe",
                    style: TextStyle(color: Colors.grey),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      Text(
                        "(4.0)",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Derby Leather",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 89, 87, 87),
                      )),
                  Text("\$120"),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Size:",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child:SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
                children: [sizeNumber('39'), sizeNumber('40'),sizeNumber('41'), sizeNumber('42'),sizeNumber('43'), sizeNumber('44')],
              ),),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: Text(
                  "A derby leather shoe is a classic and versatile footwear option characterized by its open lacing system, where the shoelace eyelets are sewn on top of the vamp (the upper part of the shoe). This design feature provides a more relaxed and casual look compared to the closed lacing system of oxford shoes. Derby shoes are typically made of high-quality leather, known for its durability and elegance, making them suitable for both formal and casual occasions. With their timeless style and comfortable fit, derby leather shoes are a staple in any well-rounded wardrobe.", style: TextStyle(color: Color(0xFF666666)),),
            ),
            Padding(
              padding: const EdgeInsets.only(top:15.0, bottom: 3, left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  OutlinedButton(
                    style: ButtonStyle(
                     side: WidgetStateProperty.all<BorderSide>(
                     const BorderSide(
                        color: Colors.red,
                        width: 1,
                      )
                     ), 
              
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)
                    ))
              
                    ),
                    onPressed: () {Navigator.of(context).pop();}, child: const Text("DELETE",  style: TextStyle(color: Colors.red))),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[800],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)
                      )
                    ),
                    onPressed: () {Navigator.of(context).pop();},
                    child: const Text("UPDATE", style: TextStyle(color: Color.fromARGB(255, 210, 206, 206)),),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
