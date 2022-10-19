import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/Customer/navigation_drawer.dart';
import 'package:untitled/Screens/CartScreen/cartScreen.dart';

class CustomerProfile extends StatefulWidget {
  const CustomerProfile({Key? key}) : super(key: key);

  @override
  State<CustomerProfile> createState() => _CustomerProfileState();
}

class _CustomerProfileState extends State<CustomerProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const USerDrawer(),
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: const Color.fromRGBO(44, 53, 57, 1),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        child: ListView(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 5,
              color: Colors.blueGrey, //const Color.fromRGBO(44, 53, 57, 1),
              // decoration: const BoxDecoration(
              //   image: DecorationImage(
              //     image: AssetImage('assets/images/mayur.jpg'),
              //     fit: BoxFit.fitWidth
              //   )
              // ),
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
                  const ListTile(
                    title: Text(
                      'Mayur Kamble',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      'mayurkamble847@gmail.com',
                      style: TextStyle(
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
                Container(
                  margin: const EdgeInsets.only(left: 5),
                  height: 55,
                  width: MediaQuery.of(context).size.width / 2.3,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.green),
                      borderRadius: BorderRadius.circular(10)),
                  // margin: const EdgeInsets.only(left: 10.0,right: 18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.shopping_cart_checkout_rounded,
                        color: Colors.blueGrey,
                        size: 18,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Orders',
                        style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CartPage()));
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 5),
                      height: 55,
                      width: MediaQuery.of(context).size.width / 2.3,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.pinkAccent),
                          borderRadius: BorderRadius.circular(10)),
                      // margin: const EdgeInsets.only(left: 10.0,right: 18.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.favorite,
                            color: Colors.pink,
                            size: 18,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Wishlist',
                            style: TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ))
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 5),
                  height: 55,
                  width: MediaQuery.of(context).size.width / 2.3,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(10)),
                  // margin: const EdgeInsets.only(left: 10.0,right: 18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.info_outline,
                        color: Colors.blueGrey,
                        size: 18,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'My info',
                        style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  // child: ListTile(
                  //   title: Text('Orders',style: TextStyle(color: Colors.blueGrey,fontSize: 16,fontWeight: FontWeight.bold),),
                  //   leading: Icon(Icons.shopping_cart_checkout_rounded,color: Colors.blueGrey,size: 18,),
                  //   trailing: Icon(Icons.arrow_forward_ios_outlined,color: Colors.blueGrey,size: 15,),
                  // ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 5),
                  height: 55,
                  width: MediaQuery.of(context).size.width / 2.3,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(10)),
                  // margin: const EdgeInsets.only(left: 10.0,right: 18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.logout,
                        color: Colors.blueGrey,
                        size: 15,
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
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
