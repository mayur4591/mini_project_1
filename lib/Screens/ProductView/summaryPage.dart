import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:untitled/Models/customerInfo.dart';
import 'package:untitled/Screens/HomeScreens/homeScreen.dart';
import 'package:untitled/Screens/ProductView/Placed%20Oeder.dart';
import '../../Models/productmodel.dart';

class SummaryPage extends StatefulWidget {
  String address = "------", land_mark= "----", city = "----", state = "----",name="----",phon_num="----";
  String pincode = "----";

  Product product;

  SummaryPage(this.address, this.land_mark, this.city, this.state, this.name,
      this.phon_num, this.pincode,this.product, {super.key});

  @override
  // ignore: no_logic_in_create_state
  State<SummaryPage> createState() => _SummaryPageState();
}

class _SummaryPageState extends State<SummaryPage> {
  Color upi=const Color.fromRGBO(60, 60, 73, 1.0);
  Color cod=const Color.fromRGBO(60, 60, 73, 1.0);
  bool isorderPlaced=false;
  int numberOfItems=1;

  _SummaryPageState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(44, 53, 57, 1),
      appBar: AppBar(
        title: const Text('Checkout'),
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
      body: isorderPlaced==false?Padding(
        padding: const EdgeInsets.fromLTRB(12, 16, 12, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text("Delivery Summary",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500)),
            buildSizedBox(5),
            Padding(
              padding: const EdgeInsets.all(1),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),//Colors.blueGrey.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(5)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Name',style: TextStyle(color: Colors.black,
                        fontSize: 15),),
                    const SizedBox(height: 3,),
                    Text(
                      widget.name,
                      style: const TextStyle(color: Colors.black, fontSize: 12),
                    ),
                    const SizedBox(height: 10,),
                    // ignore: prefer_const_constructors
                    Text('Address',style: TextStyle(color: Colors.black,
                        fontSize: 15)),
                    const SizedBox(height: 3,),
                    Text(
                      widget.address,
                      style: const TextStyle(color: Colors.black, fontSize: 12),
                    ),
                    const SizedBox(height: 10,),
                    const Text('Land Mark',style: TextStyle(color: Colors.black,
                        fontSize: 15)),
                    const SizedBox(height: 3,),
                    Text(
                      widget.land_mark,
                      style: const TextStyle(color: Colors.black, fontSize: 12),
                    ),
                    const SizedBox(height: 10,),
                    const Text('Phone No',style: TextStyle(color: Colors.black,
                        fontSize: 15)),
                    const SizedBox(height: 3,),
                    Text(
                      '+91 ${widget.phon_num}',
                      style: const TextStyle(color: Colors.black, fontSize: 12),
                    ),
                    const SizedBox(height: 10,),
                    const Text('City',style: TextStyle(color: Colors.black,
                        fontSize: 15)),
                    const SizedBox(height: 3,),
                    Text(
                      "${widget.city} - ${widget.pincode}",
                      style: const TextStyle(color: Colors.black, fontSize: 12),
                    ),
                    // ignore: prefer_const_constructors
                    SizedBox(height: 10,),
                    const Text('State',style: TextStyle(color: Colors.black,

                      fontSize: 15
                    )),
                    const SizedBox(height: 3,),
                    Text(
                      widget.state,
                      style: const TextStyle(color: Colors.black, fontSize: 12),
                    ),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                         Text('Total : Rs.${int.parse(widget.product.price)*numberOfItems}',style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15),),

                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10,),
            const Text('Quantity',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 20),),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                _decrementButton(),
                SizedBox(width: 5,),
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5)
                  ),
                  width: 50,
                  child: Center(
                    child: Text(
                      '$numberOfItems',
                      style: TextStyle(fontSize: 18.0,color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(width: 5,),
                _incrementButton(),
              ],
            ),
            buildSizedBox(15),
            const Text("Select Payment Method",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w500),),
            buildSizedBox(10),
             GestureDetector(
               onTap: (){
                 setState(() {
                   if(cod==Colors.green)
                   {
                     cod=const Color.fromRGBO(60, 60, 73, 1.0);
                     upi=Colors.green;
                   }
                   else
                   {
                     // ignore: prefer_const_constructors
                     if(upi==Color.fromRGBO(60, 60, 73, 1.0))
                     {
                       upi=Colors.green;
                     }
                     else
                     {
                       upi=const Color.fromRGBO(60, 60, 73, 1.0);
                     }

                   }

                 });
               },
               child: Card(
                margin: const EdgeInsets.fromLTRB(12,10,12,0),
                color: upi,
                child: const ListTile(
                  title: Text('UPI',style: TextStyle(color: Colors.white),),
                ),
            ),
             ),
             GestureDetector(
               onTap: (){
                 setState(() {
                   if(upi==Colors.green)
                     {
                       upi=const Color.fromRGBO(60, 60, 73, 1.0);
                       cod=Colors.green;
                     }
                   else
                     {
                       if(cod==const Color.fromRGBO(60, 60, 73, 1.0))
                         {
                           cod=Colors.green;
                         }
                       else
                         {
                           cod=const Color.fromRGBO(60, 60, 73, 1.0);
                         }

                     }

                 });
               },
               child: Card(
                margin: const EdgeInsets.fromLTRB(12,10,12,0),
                color: cod,
                child: const ListTile(
                  title: Text('Cash on Delivery',style: TextStyle(color: Colors.white),),
                ),
            ),
             ),
            const SizedBox(height: 20,),
            if(upi==Colors.green || cod==Colors.green)Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: (){
                      setState((){
                        isorderPlaced=true;
                      });
                      CustomerInfo customer=CustomerInfo(widget.name, widget.address, widget.land_mark, widget.state, widget.phon_num, widget.pincode, widget.city,FirebaseAuth.instance.currentUser!.uid);
                            placeOrder(widget.product,customer).then((value) => {
                              Navigator.popUntil(context, (route) => route!=MaterialPageRoute(builder: (context)=>const HomeScren())),
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> const PlacedOrder()))
                            }).then((value) => {
                            setState((){
                            isorderPlaced=false;
                            })
                            });
                      },
                    child: Container(
                      padding: const EdgeInsets.only(top: 15,bottom: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.green
                      ),
                      child:  Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:  [
                          Text('Place order of Rs.${int.parse(widget.product.price)*numberOfItems}',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 17),),
                          // Icon(Icons.keyboard_double_arrow_right_outlined,color: Colors.white,size: 25,)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )

          ],
        ),
      ):Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const  [
          SpinKitThreeBounce(
            color: Colors.white,
            size: 20,
          ),
          SizedBox(height: 20,),
          Text('We are placing your order...',style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w500),),
          SizedBox(height: 10,),
          Text('It will take some time please wait.',style: TextStyle(color: Colors.white,fontSize: 10,fontWeight: FontWeight.w500),)

        ],
      ),
    );
  }
  Widget _incrementButton() {
    return GestureDetector(
      onTap: (){
        setState(() {

        });
        numberOfItems++;
      },
      child: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.blueGrey,
          borderRadius: BorderRadius.circular(30)
        ),
          child: Icon(Icons.add, color: Colors.white)),
    );
  }
  Widget _decrementButton() {
    return  GestureDetector(
      onTap: (){
        setState(() {

        });
        if(numberOfItems>1)numberOfItems--;
      },
      child: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.blueGrey,
          borderRadius: BorderRadius.circular(30)
        ),
          child: Icon(Icons.remove, color: Colors.white)),
    );
  }
  SizedBox buildSizedBox(double h) => SizedBox(height: h);
String order_id="";

  Future placeOrder(Product product, CustomerInfo customer) async{
    // ignore: deprecated_member_use
   await FirebaseDatabase.instance.reference().child('Users/all_users/${FirebaseAuth.instance.currentUser!.uid}/orders').push().once().then((value) => {

          setState((){
            order_id=value.snapshot.key!;
            print("Hi"+order_id);
          })

    }).then((value) async => {
     await FirebaseDatabase.instance.reference().child('Users/all_users/${FirebaseAuth.instance.currentUser!.uid}/orders/$order_id').set({
    'product_name':product.product_name,
    'product_price':product.price,
    'product_details':product.details,
    'product_materials':product.materials,
    'image_url':product.image,
    'product_id':product.product_id,
    'total':int.parse(widget.product.price)*numberOfItems,
    'quantity':numberOfItems,
    'order_id':order_id,
    'payment_method':upi==Colors.green?'upi':'cash on delivery'
    }).then((value) async => {
    // ignore: deprecated_member_use
    await FirebaseDatabase.instance.reference().child('Users/all_users/${product.owner_id}/order_request').child(order_id).set({
    'customer_name':customer.name,
    'address':customer.address,
    'land_mark':customer.land_mark,
    'customer_id':customer.customer_id,
    'mob_num':customer.phon_num,
    'pin_code': customer.pincode,
    'city':customer.city,
    'state':customer.state,
    'product_id':product.product_id,
    'total':int.parse(widget.product.price)*numberOfItems,
    'quantity':numberOfItems,
    'payment_method':upi==Colors.green?'upi':'cash on delivery',
      'order_id':order_id,


    }).then((value) => {
    // ignore: deprecated_member_use
    FirebaseDatabase.instance.reference().child('Users/owners/${product.owner_id}/order_request').child(order_id).set({
    'customer_name':customer.name,
    'address':customer.address,
    'land_mark':customer.land_mark,
    'customer_id':customer.customer_id,
    'mob_num':customer.phon_num,
    'pin_code': customer.pincode,
    'city':customer.city,
    'state':customer.state,
    'product_id':product.product_id,
    'total':int.parse(widget.product.price)*numberOfItems,
    'quantity':numberOfItems,
    'payment_method':upi==Colors.green?'upi':'cash on delivery',
      'order_id':order_id,


    })
    })
    })
    });




  }
}