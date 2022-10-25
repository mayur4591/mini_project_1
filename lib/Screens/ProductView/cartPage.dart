import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'checkoutPage.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(44, 53, 57, 1),
      appBar: AppBar(
        title: const Text('My Bag'),
        elevation: 2,
        backgroundColor: const Color.fromRGBO(44, 53, 57, 1),
        leading: IconButton(
          icon: SvgPicture.asset(
            "assets/svg/back.svg",
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Stack(
        children: <Widget>[
          ListView.builder(
            itemBuilder: (
                BuildContext context,
                int index,
                ) {
              return Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  //color: Colors.white,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  height: 150,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      //const SizedBox(width: 20,),
                      Image.asset('assets/images/sofa_3.jpg'),
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: SizedBox(
                          // width: 180,
                          child: Column(
                            // mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            // textBaseline: TextBaseline.alphabetic,
                            children: [
                              buildSizedBox(25),
                              const Text('GAMMALBYN',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400)),
                              buildSizedBox(2),
                              const Text('2-seat sofa, grey',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w200)),
                              buildSizedBox(5),
                              const Text(
                                'Rs 17,990',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              buildSizedBox(2),
                              // Row(
                              //   children: [
                              //     RoundIconButton(Icons.add, () {
                              //       setState(() {
                              //         quantity++;
                              //       });
                              //     }),
                              //     Text('$quantity'),
                              //     RoundIconButton(CupertinoIcons.minus, () {
                              //       setState(() {
                              //         if (quantity > 1) {
                              //           quantity--;
                              //         }
                              //       });
                              //     }),
                              //   ],
                              // )
                            ],
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: .0),
                        child: Icon(Icons.delete),
                      )
                    ],
                  ),
                ),
              );
            },
            itemCount: 7,
          ),
          Container(
            margin: const EdgeInsets.all(12),
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  const Color.fromRGBO(67, 138, 245, 1.0),
                ),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> CheckoutPage('','','','','','',0)));
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                child: Text(
                  'Proceed to Checkout',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  SizedBox buildSizedBox(double h) => SizedBox(height: h);
}