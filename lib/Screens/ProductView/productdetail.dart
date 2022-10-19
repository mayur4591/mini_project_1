import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:badges/badges.dart';
import 'package:like_button/like_button.dart';
import 'package:untitled/Models/productmodel.dart';
import 'package:untitled/Screens/CartScreen/cartScreen.dart';

class ProductDetails extends StatefulWidget {
  // const ProductDetails({Key? key}) : super(key: key);


  String image;
  String price;
  int rating;
  String name;
  @override
  // ignore: no_logic_in_create_state
  State<ProductDetails> createState() => _ProductDetailsState(image,price,rating,name);

  ProductDetails(this.image, this.price, this.rating, this.name);
}

class _ProductDetailsState extends State<ProductDetails> {

  String image;
  String price;
  int rating;
  String name;


  _ProductDetailsState(this.image, this.price, this.rating, this.name);
  @override
  void initState() {
    // TODO: implement initState
    wishListCount=productList.length;
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
                background: Image.asset(image,fit: BoxFit.contain,)
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
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),),
                        subtitle: const Text('3-set sofa,grey',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w100),
                        ),
                        trailing: IconButton(
                          onPressed: () {
                            Product product= Product(image, name, price, rating);
                                  productList.add(product);
                                  wishListCount=productList.length;
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      child: const Text('Element added to cart...',style: TextStyle(color: Colors.black),),
                                    ),
                                    backgroundColor: Colors.white,
                                  behavior: SnackBarBehavior.floating,
                                  duration: const Duration(seconds: 2),
                                    margin: EdgeInsets.only(bottom: 40,left: 20,right: 20),
                                  )
                                  );
                                setState((){
                                });
                          },
                          icon: const Icon(
                            Icons.add_shopping_cart_sharp,
                            color: Colors.white,
                          ),
                        ),
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
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 18, vertical: 24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Reviews',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15.5,
                              ),
                            ),
                            Row(
                              children:  <Widget>[
                                Icon(
                                  Icons.star,
                                  color: rating>=1?Colors.yellow:Colors.white,
                                  size: 18,
                                ),
                                Icon(
                                  Icons.star,
                                  color: rating>=2?Colors.yellow:Colors.white,
                                  size: 18,
                                ),
                                Icon(
                                  Icons.star,
                                  color: rating>=3?Colors.yellow:Colors.white,
                                  size: 18,
                                ),
                                Icon(
                                  Icons.star,
                                  color: rating>=4?Colors.yellow:Colors.white,
                                  size: 18,
                                ),
                                Icon(
                                  Icons.star,
                                  color: rating>=5?Colors.yellow:Colors.white,
                                  size: 18,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
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
                            child: const Text(
                              'MRP Rs.36,733 (incl. tax)\n\nSeat cushions filled with high resilience foam and polyester fibre wadding give comfortable support for your body, and easily regain their shape when you get up.\n\nBack cushions filled with polyester fibres for soft comfort.\n\nCountry of Origin - India',
                              style: TextStyle(
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
                              children: const [
                                 Text(
                                  'MRP Rs.36,733 (incl. tax)\n\nSeat cushions filled with high resilience foam and polyester fibre wadding give comfortable support for your body, and easily regain their shape when you get up.\n\nBack cushions filled with polyester fibres for soft comfort.\n\nCountry of Origin - India',
                                  style: TextStyle(
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
                      Container(
                        color: Colors.green,
                        margin: const EdgeInsets.all(20),
                        padding: const EdgeInsets.all(15),
                        child: const Center(
                          child: Text('Buy',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25),),
                        ),
                      ),
                      //const SizedBox(height: 137)
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
      elevation: 2,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: SvgPicture.asset(
          "assets/svg/back.svg",
          color: Colors.white,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(top: 9),
          child: MaterialButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> const CartPage()));
            },
            child: Badge(
              badgeContent:  Text('${productList.length}'),
              child: SvgPicture.asset("assets/svg/cart.svg"),
            ),
          ),
        ),
      ],
    );
  }

  Future<bool> onLikeButtonTapped(bool isLiked) async {
    /// send your request here
    // final bool success= await sendRequest();
    /// if failed, you can do nothing
    // return success? !isLiked:isLiked;
    return !isLiked;
  }
}


// body: SafeArea(
//   child: Stack(
//     children: [
//       Container(
//         height: size.height * 0.35,
//         alignment: Alignment.center,
//         // color: Colors.white,
//         child: Image.asset('assets/images/sofa_3.jpg'),
//       ),
//       DraggableScrollableSheet(
//         maxChildSize: .72,
//         initialChildSize: .63,
//         minChildSize: .63,
//         builder: (context, scrollController) {
//           return Padding(
//             padding: const EdgeInsets.all(2.0),
//             child: Container(
//               decoration: const BoxDecoration(
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(20),
//                   topRight: Radius.circular(20),
//                 ),
//                 color: Color.fromRGBO(44, 53, 57, 1),
//               ),
//               child: SingleChildScrollView(
//                 controller: scrollController,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisSize: MainAxisSize.max,
//                   children: [
//                     buildSizedBox(10),
//                     Container(
//                       alignment: Alignment.center,
//                       child: Container(
//                         width: 50,
//                         height: 5,
//                         decoration: BoxDecoration(
//                           color: Colors.grey.shade50,
//                           borderRadius: const BorderRadius.all(
//                             Radius.circular(10),
//                           ),
//                         ),
//                       ),
//                     ),
//                     buildSizedBox(18),
//                     Container(
//                       padding: const EdgeInsets.only(left: 18),
//                       alignment: Alignment.centerLeft,
//                       child: const Text(
//                         'GAMMALBYN',
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 18,
//                             fontWeight: FontWeight.w400),
//                       ),
//                     ),
//                     buildSizedBox(6),
//                     Container(
//                       padding: const EdgeInsets.only(left: 18.0),
//                       alignment: Alignment.centerLeft,
//                       child: const Text(
//                         '3-seat sofa, grey',
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 14,
//                             fontWeight: FontWeight.w100),
//                       ),
//                     ),
//                     buildSizedBox(14),
//                     const Padding(
//                       padding: EdgeInsets.only(left: 18.0),
//                       child: Text(
//                         'Rs. 25,000',
//                         style: TextStyle(
//                           fontSize: 38,
//                           color: Colors.white,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                     ),
//                     buildSizedBox(28),
//                     const Padding(
//                       padding: EdgeInsets.only(left: 18.0),
//                       child: Text(
//                         'Product Information',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                     buildSizedBox(14),
//                     buildDivider(),
//                     Container(
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 18, vertical: 24),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           const Text(
//                             'Reviews',
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 15.5,
//                             ),
//                           ),
//                           Row(
//                             children: const <Widget>[
//                               Icon(
//                                 Icons.star,
//                                 color: Colors.yellow,
//                                 size: 18,
//                               ),
//                               Icon(
//                                 Icons.star,
//                                 color: Colors.yellow,
//                                 size: 18,
//                               ),
//                               Icon(
//                                 Icons.star,
//                                 color: Colors.yellow,
//                                 size: 18,
//                               ),
//                               Icon(
//                                 Icons.star,
//                                 color: Colors.yellow,
//                                 size: 18,
//                               ),
//                               Icon(
//                                 Icons.star_border,
//                                 color: Colors.white,
//                                 size: 18,
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                     buildDivider(),
//                     ExpansionTile(
//                       title: const Text(
//                         'Product details',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 15.5,
//                         ),
//                       ),
//                       children: [
//                         Container(
//                           padding: const EdgeInsets.only(
//                               left: 17, right: 17, bottom: 10),
//                           width: 400,
//                           child: const Text(
//                             'MRP Rs.36,733 (incl. tax)\n\nSeat cushions filled with high resilience foam and polyester fibre wadding give comfortable support for your body, and easily regain their shape when you get up.\n\nBack cushions filled with polyester fibres for soft comfort.\n\nCountry of Origin - India',
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 14,
//                               fontWeight: FontWeight.w200,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     buildDivider(),
//                     ExpansionTile(
//                       title: const Text(
//                         'Materials',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 15.5,
//                         ),
//                       ),
//                       children: [
//                         Container(
//                           padding: const EdgeInsets.only(
//                               left: 17, right: 17, bottom: 10),
//                           width: 400,
//                           child: Column(
//                             children: const [
//                               Text(
//                                 'Leg',
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.w200,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                     buildDivider(),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     ],
//   ),
// ),
