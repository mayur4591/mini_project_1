import 'package:badges/badges.dart';
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
                  child: const ListTile(
                    title: Text(
                      'Mayur Kamble',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Colors.white,
                      size: 15,
                    ),
                    subtitle: Text(
                      'mayurkamble847@gmail.com',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
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
                title: Text(
                  'Wishlist',
                  style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                leading: Icon(
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
