import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled/Models/productmodel.dart';
import 'package:untitled/Screens/ProductView/arScreen.dart';
import 'package:untitled/Screens/ProductView/checkoutpage.dart';

class ProductDetails extends StatefulWidget {


  String image;
  String price;
  String name;
  String details;
  String materials;
  String owner_id;
  String product_id;
  String model;

  @override
  // ignore: no_logic_in_create_state
  State<ProductDetails> createState() => _ProductDetailsState(image,price,name,this.details,materials,this.owner_id,this.product_id,this.model);

  ProductDetails(this.image, this.price,this.name,this.details,this.materials,this.owner_id,this.product_id,this.model);
}

class _ProductDetailsState extends State<ProductDetails> {

  String image;
  String price;
  String name;
  String materials;
  String details;
  String owner_id;
  String product_id;
  String model;


  _ProductDetailsState(this.image, this.price, this.name, this.details,this.materials,this.owner_id,this.product_id,this.model);

  bool isGlbPresent=false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print(size.width);
    print(size.height);
    return Scaffold(
      // backgroundColor: Color.fromRGBO(44, 53, 57, 1),
      appBar: buildAppBar(),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
              automaticallyImplyLeading: false,
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(20),
                child: Container(
                  // margin: const EdgeInsets.only(left: 4, right: 4),
                  decoration: const BoxDecoration(
                    color:  Color.fromRGBO(44, 53, 57, 1),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                  ),
                  //color: Colors.white,
                  width: double.maxFinite,
                ),
              ),
              pinned: true,
              backgroundColor: Colors.transparent,//const Color.fromRGBO(44, 53, 57, 1),
              expandedHeight: 320,//(450*size.height)/897.2549187389994,
              flexibleSpace: FlexibleSpaceBar(
                  background:
                      // ignore: prefer_const_constructors
                      Center(child: Image.network(image,fit: BoxFit.contain,)),



              )
          ),
          SliverToBoxAdapter(
            child: Container(
              color: const Color.fromRGBO(44, 53, 57, 1),
              child:Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                  color: Color.fromRGBO(44, 53, 57, 1),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      buildSizedBox(10),
                      Container(
                        alignment: Alignment.center,
                        child: Container(
                          width: (50*size.width)/423.5294196844927,
                          height: (5*size.height)/897.2549187389994,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade50,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      buildSizedBox(18),
                      ListTile(
                        title: Text(name,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),),

                        ),
                      buildSizedBox(14),
                       Padding(
                        padding: const EdgeInsets.only(left: 18.0),
                        child: Text(
                          'Rs. '+price+"/-",
                          style: const TextStyle(
                            fontSize: 38,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      buildSizedBox(28),
                      const Padding(
                        padding: EdgeInsets.only(left: 18.0),
                        child: Text(
                          'Product Information',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      buildSizedBox(14),
                      buildDivider(),
                      buildDivider(),
                      ExpansionTile(
                        title: const Text(
                          'Product details',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.5,
                          ),
                        ),
                        children: [
                          Container(
                            padding: const EdgeInsets.only(
                                left: 17, right: 17, bottom: 10),
                            width: 400,
                            child:  Text(
                              details,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w200,
                              ),
                            ),
                          ),
                        ],
                      ),
                      buildDivider(),
                      ExpansionTile(
                        title: const Text(
                          'Materials',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.5,
                          ),
                        ),
                        children: [
                          Container(
                            padding: const EdgeInsets.only(
                                left: 17, right: 17, bottom: 10),
                            width: 400,
                            child: Column(
                              children:  [
                                 Text(
                                   materials,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w200,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      buildDivider(),
                      GestureDetector(
                        onTap: (){
                          Product product=Product(image,name,price,details,materials,owner_id,product_id,model);
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>  Info(product)));
                        },
                        child: Container(
                          color: Colors.green,
                          margin: const EdgeInsets.all(20),
                          padding: const EdgeInsets.all(15),
                          child: const Center(
                            child: Text('Buy',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25),),
                          ),
                        ),
                      ),
                      const SizedBox(height: 137)
                    ],
                  ),
                ),
              )
            ),
          )
        ],
      ),

    );
  }

  SizedBox buildSizedBox(double h) => SizedBox(height: h);

  Container buildDivider() {
    return Container(
      alignment: Alignment.center,
      child: Container(
        width: 400,
        height: 1,
        decoration: BoxDecoration(
          color: Colors.grey.shade50,
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      // toolbarHeight: 75,
      backgroundColor: const Color.fromRGBO(44, 53, 57, 1),
      actions:  [
        GestureDetector(
          onTap: ()
          {
            print(model);
            if(model.isNotEmpty) {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> ModelViewerScreen(model)));
            } else
              {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Model is not available for this product.',style: TextStyle(color: Colors.black)),backgroundColor: Colors.white,));
              }
          },
          child: Container(margin:EdgeInsets.only(right: 10),child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.fullscreen_rounded,color: Colors.white,size: 25,),
            SizedBox(height: 1,),
            Text('View in 3D',style: TextStyle(color: Colors.white,fontSize: 13),)
          ],
      )),
        )],
      elevation: 2,
      title: Text('Details'),
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: SvgPicture.asset(
          "assets/svg/back.svg",
          color: Colors.white,
        ),
      ),
    );
  }

}


