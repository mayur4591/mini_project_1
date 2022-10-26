import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'checkoutPage.dart';

class SummaryPage extends StatefulWidget {
  String address = "", land_mark= "", city = "", state = "",name="",phon_num="";
  String pincode = "";

  SummaryPage(this.address, this.land_mark, this.city, this.state, this.name,
      this.phon_num, this.pincode);

  @override
  State<SummaryPage> createState() => _SummaryPageState();
}

class _SummaryPageState extends State<SummaryPage> {
  Color upi=Color.fromRGBO(60, 60, 73, 1.0);
  Color cod=Color.fromRGBO(60, 60, 73, 1.0);

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
                    fontSize: 18,
                    fontWeight: FontWeight.w500)),
            buildSizedBox(5),
            Padding(
              padding: const EdgeInsets.all(1),
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),//Colors.blueGrey.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(5)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Name',style: TextStyle(color: Colors.black,
                        fontSize: 15),),
                    SizedBox(height: 3,),
                    Text(
                      widget.name,
                      style: const TextStyle(color: Colors.black, fontSize: 12),
                    ),
                    SizedBox(height: 10,),
                    Text('Address',style: TextStyle(color: Colors.black,
                        fontSize: 15)),
                    SizedBox(height: 3,),
                    Text(
                      "${widget.address}",
                      style: const TextStyle(color: Colors.black, fontSize: 12),
                    ),
                    SizedBox(height: 10,),
                    Text('Land Mark',style: TextStyle(color: Colors.black,
                        fontSize: 15)),
                    SizedBox(height: 3,),
                    Text(
                      "${widget.land_mark}",
                      style: const TextStyle(color: Colors.black, fontSize: 12),
                    ),
                    SizedBox(height: 10,),
                    Text('Phone No',style: TextStyle(color: Colors.black,
                        fontSize: 15)),
                    SizedBox(height: 3,),
                    Text(
                      '+91 ${widget.phon_num}',
                      style: const TextStyle(color: Colors.black, fontSize: 12),
                    ),
                    SizedBox(height: 10,),
                    Text('City',style: TextStyle(color: Colors.black,
                        fontSize: 15)),
                    SizedBox(height: 3,),
                    Text(
                      "${widget.city} - ${widget.pincode}",
                      style: const TextStyle(color: Colors.black, fontSize: 12),
                    ),
                    SizedBox(height: 10,),
                    Text('State',style: TextStyle(color: Colors.black,

                      fontSize: 15
                    )),
                    SizedBox(height: 3,),
                    Text(
                      widget.state,
                      style: const TextStyle(color: Colors.black, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),

            buildSizedBox(15),
            const Text("Select Payment Method",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w500),),
            buildSizedBox(10),
             GestureDetector(
               onTap: (){
                 setState(() {
                   if(cod==Colors.green)
                   {
                     cod=Color.fromRGBO(60, 60, 73, 1.0);
                     upi=Colors.green;
                   }
                   else
                   {
                     if(upi==Color.fromRGBO(60, 60, 73, 1.0))
                     {
                       upi=Colors.green;
                     }
                     else
                     {
                       upi=Color.fromRGBO(60, 60, 73, 1.0);
                     }

                   }

                 });
               },
               child: Card(
                margin: EdgeInsets.fromLTRB(12,10,12,0),
                color: upi,
                child: ListTile(
                  title: Text('UPI',style: TextStyle(color: Colors.white),),
                ),
            ),
             ),
             GestureDetector(
               onTap: (){
                 setState(() {
                   if(upi==Colors.green)
                     {
                       upi=Color.fromRGBO(60, 60, 73, 1.0);
                       cod=Colors.green;
                     }
                   else
                     {
                       if(cod==Color.fromRGBO(60, 60, 73, 1.0))
                         {
                           cod=Colors.green;
                         }
                       else
                         {
                           cod=Color.fromRGBO(60, 60, 73, 1.0);
                         }

                     }

                 });
               },
               child: Card(
                margin: EdgeInsets.fromLTRB(12,10,12,0),
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

                    },
                    child: Container(
                      padding: const EdgeInsets.only(top: 15,bottom: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.green
                      ),
                      child:  Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text('Place order',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 17),),
                          Icon(Icons.keyboard_double_arrow_right_outlined,color: Colors.white,size: 25,)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )

          ],
        ),
      ),
    );
  }

  SizedBox buildSizedBox(double h) => SizedBox(height: h);
}