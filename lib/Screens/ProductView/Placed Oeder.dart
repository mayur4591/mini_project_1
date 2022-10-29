import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlacedOrder extends StatefulWidget {
  const PlacedOrder({Key? key}) : super(key: key);

  @override
  State<PlacedOrder> createState() => _PlacedOrderState();
}

class _PlacedOrderState extends State<PlacedOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            const Icon(Icons.rocket_launch_rounded,color: Colors.blueGrey,size: 50,),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text('Congratulations!',style: TextStyle(color: Colors.blueGrey,fontWeight: FontWeight.w500,fontSize: 25),),
              ],
            ),
            const SizedBox(height: 10,),
            const Text('Your order have successfully placed.',style: TextStyle(color: Colors.blueGrey,fontWeight: FontWeight.w500,fontSize: 18),),
            const SizedBox(height: 30,),

            Container(
              padding: const EdgeInsets.all(10),
              // margin: EdgeInsets.only(left: 40,right: 40),
              // height: 50,
              width: 150,
              decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(10)
              ),
              child: GestureDetector(
                onTap: (){
                  // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const ()));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text('My orders',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 18),),
                    SizedBox(width: 5,),
                    Icon(Icons.arrow_right_outlined,color: Colors.white,)
                  ],
                ),
              ),
            )

          ],
        ),
    );
  }
}
