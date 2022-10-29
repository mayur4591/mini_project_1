import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/Screens/AuthenticationScreens/loginScreen.dart';
import 'package:untitled/Screens/CartScreen/cartScreen.dart';

import 'My Orders.dart';
import 'My_information.dart';
import 'navigation_drawer.dart';

class CustomerProfile extends StatefulWidget {
  const CustomerProfile({Key? key}) : super(key: key);

  @override
  State<CustomerProfile> createState() => _CustomerProfileState();
}

class _CustomerProfileState extends State<CustomerProfile> {

  String fname=" ";
  String lname=" ";
  String email=" ";
  Future<void> getInfo() async {
    FirebaseDatabase.instance.reference().child('Users/all_users/${FirebaseAuth.instance.currentUser!.uid}').once().then((value) => {
      if(value.snapshot.value!=null)
        {
          setState(() {
            Map<dynamic, dynamic> map = value.snapshot.value as Map;
            fname = map['first_name'];
            lname = map['last_name'];
            email = map['email'];
          }),
        }

    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: const Color.fromRGBO(44, 53, 57, 1),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 5,
              color: Colors.blueGrey, //const Color.fromRGBO(44, 53, 57, 1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context, false);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      )),
                   ListTile(
                    title: Text(
                      '$fname $lname',
                      style:  const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      email,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const MyInformation()));
                  },
                  child: Container(
                    margin: const EdgeInsets.only(left: 5),
                    height: 55,
                    width: MediaQuery.of(context).size.width / 2.3,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueGrey),
                        borderRadius: BorderRadius.circular(10)),
                    // margin: const EdgeInsets.only(left: 10.0,right: 18.0),
                    child: const ListTile(
                      horizontalTitleGap: 2,
                      leading: Icon(
                        Icons.info_outline,
                        color: Colors.pink,
                        size: 18,
                      ),
                      title:Text(
                        'My information',
                        style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                    ),

                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const OrderList()));

                  },
                  child: Container(
                    // margin: const EdgeInsets.only(left: 5),
                    height: 55,
                    width: MediaQuery.of(context).size.width / 2.3,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueGrey),
                        borderRadius: BorderRadius.circular(10)),
                    child: const ListTile(
                      horizontalTitleGap: 2,
                      leading:   Icon(
                        Icons.shopping_cart_outlined,
                        color: Colors.brown,
                        size: 18,
                      ),
                      title: Text(
                        'Orders',
                        style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),

                    ),
                  ),
                ),
                // GestureDetector(
                //     // onTap: () {
                //     //   Navigator.push(
                //     //       context,
                //     //       MaterialPageRoute(
                //     //           builder: (context) => const CartPage()));
                //     //},
                //     child: Container(
                //       margin: const EdgeInsets.only(right: 5),
                //       height: 55,
                //       width: MediaQuery.of(context).size.width / 2.3,
                //       decoration: BoxDecoration(
                //           border: Border.all(color: Colors.blueGrey),
                //           borderRadius: BorderRadius.circular(10)),
                //       // margin: const EdgeInsets.only(left: 10.0,right: 18.0),
                //       child: const ListTile(
                //         horizontalTitleGap: 2,
                //         leading: Icon(
                //           Icons.favorite,
                //           color: Colors.pink,
                //           size: 18,
                //         ),
                //         title:Text(
                //           'Wishlist',
                //           style: TextStyle(
                //               color: Colors.blueGrey,
                //               fontSize: 12,
                //               fontWeight: FontWeight.bold),
                //         ),
                //       ),
                //     ))
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: [
            //     GestureDetector(
            //       onTap: (){
            //         Navigator.push(context, MaterialPageRoute(builder: (context)=> const OrderList()));
            //
            //       },
            //       child: Container(
            //         // margin: const EdgeInsets.only(left: 5),
            //         height: 55,
            //         width: MediaQuery.of(context).size.width / 2.3,
            //         decoration: BoxDecoration(
            //             border: Border.all(color: Colors.blueGrey),
            //             borderRadius: BorderRadius.circular(10)),
            //         child: const ListTile(
            //           horizontalTitleGap: 2,
            //           leading:   Icon(
            //             Icons.shopping_cart_outlined,
            //             color: Colors.brown,
            //             size: 18,
            //           ),
            //           title: Text(
            //             'Orders',
            //             style: TextStyle(
            //                 color: Colors.blueGrey,
            //                 fontSize: 12,
            //                 fontWeight: FontWeight.bold),
            //           ),
            //
            //         ),
            //       ),
            //     ),
            //     // Container(
            //     //   // margin: const EdgeInsets.only(left: 5),
            //     //   height: 55,
            //     //   width: MediaQuery.of(context).size.width / 2.3,
            //     //   decoration: BoxDecoration(
            //     //       border: Border.all(color: Colors.blueGrey),
            //     //       borderRadius: BorderRadius.circular(10)),
            //     //   child: const ListTile(
            //     //     horizontalTitleGap: 2,
            //     //     leading: Icon(
            //     //       Icons.done_all_outlined,
            //     //       color: Colors.green,
            //     //       size: 18,
            //     //     ),
            //     //     title: Text(
            //     //       'Completed Orders',
            //     //       style: TextStyle(
            //     //           color: Colors.blueGrey,
            //     //           fontSize: 12,
            //     //           fontWeight: FontWeight.bold),
            //     //     ),
            //     //
            //     //   ),
            //     // ),
            //   ],
            // ),
            const SizedBox(
              height: 30,
            ),
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: (){
                      FirebaseAuth.instance.signOut().then((value) => {
                        Navigator.popUntil(context, (route) => false),
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> const LoginScreen()))
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.only(left: 25,bottom: 40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Icon(
                            Icons.logout,
                            color: Colors.blueGrey,
                            size: 20,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Log out',
                            style: TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),

                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
