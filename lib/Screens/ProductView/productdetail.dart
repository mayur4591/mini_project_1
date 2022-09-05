import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:badges/badges.dart';
import 'package:like_button/like_button.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // backgroundColor: Color.fromRGBO(44, 53, 57, 1),
      appBar: buildAppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        elevation: 2,
        backgroundColor: Colors.white,
        child: const Icon(
          Icons.shopping_basket_rounded,
          color: Colors.blue,
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: size.height * 0.35,
              alignment: Alignment.center,
              // color: Colors.white,
              child: Image.asset('assets/images/sofa_3.jpg'),
            ),
            DraggableScrollableSheet(
              maxChildSize: .72,
              initialChildSize: .63,
              minChildSize: .63,
              builder: (context, scrollController) {
                return Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                    color: Color.fromRGBO(44, 53, 57, 1),
                  ),
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        buildSizedBox(10),
                        Container(
                          alignment: Alignment.center,
                          child: Container(
                            width: 50,
                            height: 5,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade50,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        buildSizedBox(18),
                        Container(
                          padding: const EdgeInsets.only(left: 18),
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            'GAMMALBYN',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        buildSizedBox(6),
                        Container(
                          padding: const EdgeInsets.only(left: 18.0),
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            '3-seat sofa, grey',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w100),
                          ),
                        ),
                        buildSizedBox(14),
                        const Padding(
                          padding: EdgeInsets.only(left: 18.0),
                          child: Text(
                            'Rs. 25,000',
                            style: TextStyle(
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
                                children: const <Widget>[
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                    size: 18,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                    size: 18,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                    size: 18,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                    size: 18,
                                  ),
                                  Icon(
                                    Icons.star_border,
                                    color: Colors.white,
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
                                    'Leg',
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
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
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
        onPressed: () {},
        icon: SvgPicture.asset(
          "assets/svg/back.svg",
          color: Colors.white,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(top: 9, right: 25.0),
          child: LikeButton(
            onTap: onLikeButtonTapped,
          ),
        ),
        // Padding(
        //   padding: EdgeInsets.only(top: 10, right: 30.0),
        //   child: Badge(
        //     badgeContent: Text('0'),
        //     // badgeColor: Colors.blueAccent,
        //     child: SvgPicture.asset(
        //       "assets/svg/heart.svg",
        //       width: 25.5,
        //     ),
        //   ),
        // ),
        Padding(
          padding: const EdgeInsets.only(top: 9, right: 20.0),
          child: Badge(
            badgeContent: const Text('0'),
            child: SvgPicture.asset("assets/svg/cart.svg"),
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