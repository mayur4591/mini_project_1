import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'summaryPage.dart';


class Info extends StatelessWidget {
  const Info({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CheckoutPage('', '', 'city', 'state', 'name', '0', "");
  }
}

class CheckoutPage extends StatefulWidget {
  String address = "", land_mark= "", city = "", state = "",name="",phon_num="";
  String pincode = "";


  CheckoutPage(this.address, this.land_mark, this.city, this.state, this.name,
      this.phon_num, this.pincode);

  @override
  State<CheckoutPage> createState() =>
      _CheckoutPageState(address, land_mark, city, state, name,phon_num,pincode);
}

class _CheckoutPageState extends State<CheckoutPage> {
  String address = "", land_mark= "", city = "", state = "",name="",phon_num="";
  String pincode = "";

  _CheckoutPageState(this.address, this.land_mark, this.city, this.state,
      this.name, this.phon_num, this.pincode);

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
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: ListView(
          children: [
            const Text(
              'Fill below details',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
            buildSizedBox(20),
            const Text(
              'Personal Details',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            buildSizedBox(10),
            const Text('Full name',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 15),),
            buildSizedBox(5),
            TextField(
              onChanged: (text) {
                setState(() {
                  name = text;
                });
              },
              decoration: const InputDecoration(
                filled: true,
                fillColor: Color.fromRGBO(252, 248, 248, 1.0),
                border: OutlineInputBorder(),
                hintText: 'Name'
                // hintText: "Address 1",
              ),
            ),
            buildSizedBox(15),
            const Text('Phone number',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 15)),
            buildSizedBox(5),
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (text) {
                setState(() {
                  phon_num = text;
                });
              },
              decoration: const InputDecoration(
                filled: true,
                fillColor: Color.fromRGBO(252, 248, 248, 1.0),
                border: OutlineInputBorder(),
                hintText: "Phone Number",
              ),
            ),
            const SizedBox(height: 20,),
            const Text(
              'Location Deatils',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            buildSizedBox(10),
            const Text('Address',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 15)),
            buildSizedBox(5),
            TextField(
              onChanged: (text) {
                setState(() {
                  address = text;
                });
              },
              decoration: const InputDecoration(
                filled: true,
                fillColor: Color.fromRGBO(252, 248, 248, 1.0),
                border: OutlineInputBorder(),
                hintText: "Address ",
              ),
            ),
            buildSizedBox(10),
            const Text('Land Mark',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 15)),
            buildSizedBox(5),
            TextField(
              onChanged: (text) {
                setState(() {
                  land_mark = text;
                });
              },
              decoration: const InputDecoration(
                filled: true,
                fillColor: Color.fromRGBO(252, 248, 248, 1.0),
                border: OutlineInputBorder(),
                hintText: "Land Mark",
              ),
            ),
            buildSizedBox(10),
            const Text('Pin code',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 15)),
            buildSizedBox(5),
            TextField(
              maxLength: 6,
              keyboardType:TextInputType.number ,
              onChanged: (text) {
                setState(() {
                  pincode = text;
                });
              },
              decoration: const InputDecoration(
                filled: true,
                fillColor: Color.fromRGBO(252, 248, 248, 1.0),
                border: OutlineInputBorder(),
                hintText: "Pin Code",
              ),
            ),
            buildSizedBox(10),
            const Text('City',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 15)),
            buildSizedBox(5),
            TextField(
              onChanged: (text) {
                setState(() {
                  city = text;
                });
              },
              decoration: const InputDecoration(
                filled: true,
                fillColor: Color.fromRGBO(252, 248, 248, 1.0),
                border: OutlineInputBorder(),
                hintText: "City",
              ),
            ),
            buildSizedBox(10),
            const Text('State',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 15)),
            buildSizedBox(5),
            TextField(
              onChanged: (text) {
                setState(() {
                  state = text;
                });
              },
              decoration: const InputDecoration(
                filled: true,
                fillColor: Color.fromRGBO(252, 248, 248, 1.0),
                border: OutlineInputBorder(),
                hintText: "State",
              ),
            ),
            buildSizedBox(20),
            ElevatedButton(
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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SummaryPage(
                            address, land_mark,city, state,name,phon_num,pincode)));
              },
              child:  Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Proceed to Checkout',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                      ),
                      SizedBox(width: 10,),
                      Icon(Icons.chevron_right_outlined,color: Colors.white,size: 25,)
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  SizedBox buildSizedBox(double h) => SizedBox(height: h);

}