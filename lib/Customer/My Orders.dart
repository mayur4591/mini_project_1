import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/Screens/ProductView/productdetail.dart';

import '../../Customer/navigation_drawer.dart';
import '../../Models/category.dart';
import '../../Models/productmodel.dart';

class OrderList extends StatefulWidget {
  const OrderList({Key? key}) : super(key: key);

  @override
  State<OrderList> createState() => _OrderList();
}

List<Category> category = [];

class _OrderList extends State<OrderList> {
  late Query _ref;

  bool isListEmpty=false;
  Future check() async
  {
    _ref.once().then((value) => {
      if(value.snapshot.value==null)
        {
          setState((){
            isListEmpty=true;
          })
        }
    });
  }
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    _ref=FirebaseDatabase.instance.reference().child('Users/all_users/${FirebaseAuth.instance.currentUser!.uid}/orders');
    check();

  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print(size.width);
    print(size.height);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(44, 53, 57, 1),
          title: const Text(
            'My orders',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
          ),
        ),
        backgroundColor: const Color.fromRGBO(44, 53, 57, 1),
        body:isListEmpty==false? buildHome():Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Center(child: Text('You have not placed any order ',style: TextStyle(color: Colors.grey,fontSize: 15,fontWeight: FontWeight.w500),)),
            SizedBox(height: 10,),
            Center(child: Text('Your orders will appear here... ',style: TextStyle(color: Colors.grey,fontSize: 10,fontWeight: FontWeight.w500),)),
          ],
        )
    );
  }


  Widget _buildListView(Map product) {
    print(product.values);
    print(product.length);
    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: (context) => ProductDetails(
        //             product['image_url'],
        //             product['product_price'],
        //             product['product_name'],
        //             product['product_details'],
        //             product['product_materials'],
        //             product['owner_id']
        //         )));
      },
      child: Container(
          padding: const EdgeInsets.all(10),
          child: boxes(
            name: product['product_name'],
            price: product['total'].toString(),
            image: product['image_url'],
            qty: product['quantity'].toString(),
            order_id: product['order_id'],
            product_id: product['product_id'],

          )),
    );
  }

  Widget buildHome() {
    return FirebaseAnimatedList(
        query: _ref,
        itemBuilder: (BuildContext cotext, DataSnapshot snapshot,
            Animation<double> animation, int index) {
          Map<dynamic, dynamic>? owners = snapshot.value as Map?;
          return _buildListView(owners!);
        });
  }
}

class DivederWidget extends StatelessWidget {
  const DivederWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(left: 10.0, right: 20.0),
              child: const Divider(
                color: Colors.white,
              ),
            ),
          ),
          const Text(
            'Featured Products',
            style: TextStyle(color: Colors.white),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(left: 20.0, right: 10.0),
              child: const Divider(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// class Categories extends StatelessWidget {
//   const Categories({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(8),
//       height: (MediaQuery.of(context).size.height * (3.7)) / 27,
//       width: double.maxFinite,
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         itemCount: category.length,
//         itemBuilder: (BuildContext context, int index) {
//           return circulars(
//               decor: category[index].name, image: category[index].image);
//         },
//       ),
//     );
//   }
// }

class boxes extends StatefulWidget {
  boxes(
      {required this.name,
        required this.price,
        required this.image,
        required this.qty,
        required this.order_id,
        required this.product_id
      });

  final String name;
  final String price;
  final String image;
  final String qty;
  final String order_id;
  final String product_id;

  @override
  State<boxes> createState() => _boxesState();
}

class _boxesState extends State<boxes> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Row(
        children: <Widget>[
          const SizedBox(
            width: 15.0,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image(
              fit: BoxFit.cover,
              image: NetworkImage(
                widget.image,
              ),
              // height: 120.0,
              width: 120.0,
            ),
          ),
          const SizedBox(
            width: 20.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(
                  height: 20.0,
                ),
                Text(
                  widget.name,
                  overflow: TextOverflow.clip,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total Rs." + widget.price + "/-",
                      style: const TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.w500,
                          fontSize: 20),
                    ),
                    Text(
                      "Qty - " + widget.qty.toString(),
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 15),
                    ),

                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: (){
                    removeProduct();
                    setState(() {
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.orangeAccent,
                          borderRadius: BorderRadius.circular(5)
                        ),
                        child: const Text(
                         'I got this order',
                         style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w500),
                            ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            width: 30,
          ),
        ],
      ),
    );
  }

  Future removeProduct() async{
    String owner_id="";
      await FirebaseDatabase.instance.reference().child('posts/${widget.product_id}').once().then((value) => {
        if(value.snapshot.value!=null)
          {
            setState((){
              Map<dynamic, dynamic> map = value.snapshot.value as Map;
              owner_id=map['owner_id'];
              print(owner_id);

            })
          }
      }).then((value) async => {
       await FirebaseDatabase.instance.reference().child('Users/all_users/${FirebaseAuth.instance.currentUser!.uid}/orders/${widget.order_id}').remove().then((value) async => {
         await FirebaseDatabase.instance.reference().child('Users/all_users/$owner_id/order_request/${widget.order_id}').remove().then((value) async => {
           await FirebaseDatabase.instance.reference().child('Users/owners/$owner_id/order_request/${widget.order_id}').remove()
          })
        })
      });
  }
}

class circulars extends StatelessWidget {
  circulars({required this.decor, required this.image});

  final String decor;
  final String image;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: Column(
        children: <Widget>[
          CircleAvatar(
            backgroundImage: AssetImage(image),
            radius: 40,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            decor,
            style: const TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}
