import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'checkoutPage.dart';

class SummaryPage extends StatelessWidget {
  String address = "", land_mark= "", city = "", state = "",name="",phon_num="";
  int pincode = 0;


  SummaryPage(this.address, this.land_mark, this.city, this.state, this.name,
      this.phon_num, this.pincode);

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
      body: Padding(
        padding: const EdgeInsets.fromLTRB(12, 16, 12, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text("Delivery Summary",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w400)),
            buildSizedBox(15),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.blueGrey.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(color: Colors.white, fontSize: 17),
                    ),
                    SizedBox(height: 5,),
                    Text(
                      "$address, $land_mark",
                      style: const TextStyle(color: Colors.white, fontSize: 17),
                    ),
                    SizedBox(height: 5,),

                    Text(
                      phon_num,
                      style: const TextStyle(color: Colors.white, fontSize: 17),
                    ),
                    SizedBox(height: 5,),

                    Text(
                      "$city - $pincode",
                      style: const TextStyle(color: Colors.white, fontSize: 17),
                    ),
                    SizedBox(height: 5,),

                    Text(
                      state,
                      style: const TextStyle(color: Colors.white, fontSize: 17),
                    ),
                  ],
                ),
              ),
            ),

            Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                    onPressed: () {
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => CheckoutPage()));
                    },
                    child: Text(
                      'Change',
                      style: TextStyle(fontSize: 15, color: Colors.white,fontWeight: FontWeight.bold),
                    ))),
            buildSizedBox(15),
            const Text("Select Payment Method",style: TextStyle(color: Colors.white,fontSize: 22),),
            buildSizedBox(10),
            const Card(
              margin: EdgeInsets.fromLTRB(12,10,12,0),
              color: Color.fromRGBO(60, 60, 73, 1.0),
              child: ListTile(
                leading: FlutterLogo(),
                title: Text('UPI',style: TextStyle(color: Colors.white),),
              ),
            ),
            const Card(
              margin: EdgeInsets.fromLTRB(12,10,12,0),
              color: Color.fromRGBO(60, 60, 73, 1.0),
              child: ListTile(
                leading: FlutterLogo(),
                title: Text('Credit/Debit Card',style: TextStyle(color: Colors.white),),
              ),
            ),
            const Card(
              margin: EdgeInsets.fromLTRB(12,10,12,0),
              color: Color.fromRGBO(60, 60, 73, 1.0),
              child: ListTile(
                leading: FlutterLogo(),
                title: Text('Cash on Delivery',style: TextStyle(color: Colors.white),),
              ),
            ),
          ],
        ),
      ),
    );
  }

  SizedBox buildSizedBox(double h) => SizedBox(height: h);
}