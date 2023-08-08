import 'package:flutter/material.dart';
import 'package:food_application/providers/cart_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../modals/productModal.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Cart",
          style: GoogleFonts.poppins(textStyle: const TextStyle()),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xff48bf53),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Column(
        children: [
          Expanded(
              flex: 14,
              child: ListView.builder(
                  itemCount: Provider.of<CartProvider>(context).allcart.length,
                  itemBuilder: (contecxt, i) {
                    Product product =
                        Provider.of<CartProvider>(context).allcart[i];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 5,
                        child: Container(
                          height: height * 0.2,
                          width: width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 5,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Image.asset(
                                        product.image,
                                        height: height * 0.10,
                                      ),
                                      Text(
                                        product.name.split(" ")[0],
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      )
                                    ],
                                  )),
                              Expanded(
                                flex: 4,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Row(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            Provider.of<CartProvider>(context,
                                                    listen: false)
                                                .Countpluse(product: product);
                                          },
                                          child: Container(
                                            height: 40,
                                            width: 40,
                                            decoration: BoxDecoration(
                                              color: const Color(0xff48bf53),
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            alignment: Alignment.center,
                                            child: const Text(
                                              "+",
                                              style: TextStyle(fontSize: 30,color: Colors.white),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: width * 0.02),
                                        Text(
                                          "${product.quantity}",
                                          style: const TextStyle(fontSize: 20),
                                        ),
                                        SizedBox(width: width * 0.02),
                                        InkWell(
                                          onTap: () {
                                            Provider.of<CartProvider>(context,
                                                    listen: false)
                                                .CountdecrementAndRemove(
                                                    product: product);
                                          },
                                          child: Container(
                                            height: 40,
                                            width: 40,
                                            decoration: BoxDecoration(
                                              color: const Color(0xff48bf53),
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            alignment: Alignment.center,
                                            child: const Text(
                                              "-",
                                              style: TextStyle(fontSize: 40,color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Price : ${product.price} xu",
                                          style: const TextStyle(fontSize: 16),
                                        ),
                                        IconButton(
                                            onPressed: () {
                                              Provider.of<CartProvider>(context,
                                                  listen: false)
                                                  .RemoveFromCart(
                                                  product: product);
                                            },
                                            icon: const Icon(
                                              Icons.delete,
                                              color: Colors.red,
                                            ))
                                      ],
                                    )
                                  ],
                                ),
                              ),


                            ],
                          ),
                        ),
                      ),
                    );
                  })),
          Expanded(
              flex: 3,
              child: Container(
                width: width,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      blurRadius: 7,
                      spreadRadius: 0,
                      color: Colors.green
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: height * 0.025),
                          Text(
                            "Total Price : ${Provider.of<CartProvider>(context).totalPrice} xu",
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600),
                            ),
                          ),
                          SizedBox(height: height * 0.015),
                          Text(
                            "Total Quantity : ${Provider.of<CartProvider>(context).allProduct}",
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                      const Spacer(
                        flex: 9,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: Text(
                            "Buy",
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                            )),
                          ),
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
