import 'package:badges/badges.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/Customer/customerProfilePage.dart';
import 'package:untitled/Screens/CartScreen/cartScreen.dart';

class USerDrawer extends StatefulWidget {
  const USerDrawer({Key? key}) : super(key: key);

  @override
  State<USerDrawer> createState() => _DrawerState();
}

class _DrawerState extends State<USerDrawer> {
  String fname=" ";
  String lname=" ";
  String email=" ";
  Future<void> getInfo() async {
    FirebaseDatabase.instance.reference().child('Users/all_users/${FirebaseAuth.instance.currentUser!.uid}').once().then((value) => {
      setState((){
        Map<dynamic,dynamic> map=value.snapshot.value as Map;
        fname=map['first_name'];
        lname=map['last_name'];
        email=map['email'];
      }),

      print(fname)
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
    return Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width / 1.5,
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 4,
            color: const Color.fromRGBO(44, 53, 57, 1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CustomerProfile()));
                  },
                  child:  ListTile(
                    title: Text(
                      '$fname $lname',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Colors.white,
                      size: 15,
                    ),
                    subtitle:  Text(
                      email,
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const ListTile(
            title: Text(
              'Orders',
              style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            leading: Icon(
              Icons.shopping_cart_checkout_rounded,
              color: Colors.blueGrey,
              size: 18,
            ),
            trailing: Icon(
              Icons.arrow_forward_ios_outlined,
              color: Colors.blueGrey,
              size: 15,
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const CartPage()));
            },
            child: ListTile(
                title: const Text(
                  'Wishlist',
                  style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                leading: const Icon(
                  Icons.favorite,
                  color: Colors.pink,
                  size: 18,
                ),
                trailing: Badge(
                  badgeContent: Text('${productList.length}'),
                  badgeColor: Colors.pinkAccent.withOpacity(0.3),
                )),
          )
        ],
      ),
    );
  }
}
