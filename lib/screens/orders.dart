import "package:flutter/material.dart";
import "package:un1q_developer_test/utility/constants.dart";
import "package:un1q_developer_test/providers/screen_context.dart";
import "package:provider/provider.dart";
import "package:dotted_line/dotted_line.dart";
import "package:un1q_developer_test/widgets/checkout_button.dart";
import "package:un1q_developer_test/widgets/order_details.dart";
import "package:un1q_developer_test/widgets/image_box.dart";
import "dart:math" as math;


class Orders extends StatelessWidget {

  Orders({ super.key });
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {

    final screenWidth = MediaQuery.of(context).size.width;
    var cart = context.watch<ScreenProvider>().cart;

    return Scaffold(body: SingleChildScrollView(controller: scrollController, 
                                 child: cart.isNotEmpty ? Container(padding: const EdgeInsets.only(bottom: 20), child: Column(children: [ListView.separated(scrollDirection: Axis.vertical, itemCount: cart.length,
                                                                                                                                                            physics: const NeverScrollableScrollPhysics(),
                                                                                                                                                            shrinkWrap: true, primary: false,
                                                                                                                                                            separatorBuilder: (context, index) => const SizedBox(width: 8),
                                                                                                                                                            itemBuilder: (context, index) => Column(children: [OrderDetails(id: cart[index]["id"],
                                                                                                                                                                                                                            price: cart[index]["price"],
                                                                                                                                                                                                                            count: cart[index]["count"],
                                                                                                                                                                                                                            meal: cart[index]["meal"],
                                                                                                                                                                                                                            image: cart[index]["image"]),
                                                                                                                                                                                                              
                                                                                                                                                                                                               Divider(color: grey, thickness: 1.0,
                                                                                                                                                                                                                      indent: screenWidth*0.05,
                                                                                                                                                                                                                      endIndent: screenWidth*0.05)])),

                                                                                                                                                                                                               Padding(padding: EdgeInsets.only(top: 20, bottom: 20, left: screenWidth*0.05, right: screenWidth*0.05),
                                                                                                                                                                                                                       child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Row(children: [Transform(alignment: Alignment.center, transform: Matrix4.rotationY(math.pi),
                                                                                                                                                                                                                                                                                                                         child: const ImageBox(network: false, colour: orange, image: "assets/icons/delivery.png", size: 0.15)),
                                                                                                                                                                                                                                                                                                               const SizedBox(width: 10), const Text("Delivery", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, fontFamily: "Inter"))]),

                                                                                                                                                                                                                                                                                                Text("\$${(cart.fold(0.0, (previousValue, map) => previousValue + map['count']!*map['price'])*0.05).toStringAsFixed(2)}", style: const TextStyle(fontSize: 16, fontFamily: "Inter"))])), 

                                                                                                                                        DottedLine(dashColor: dark_grey, lineLength: screenWidth*0.9),

                                                                                                                                        const SizedBox(height: 20), Padding(padding: EdgeInsets.only(top: 20, bottom: 20, left: screenWidth*0.05, right: screenWidth*0.05), child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [const Text("Total:", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500, fontFamily: "Inter")), Text("\$${(cart.fold(0.0, (previousValue, map) => previousValue + map['count']!*map['price'])*1.05).toStringAsFixed(2)}", style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w900, fontFamily: "Inter"))])), const SizedBox(height: 20)])) :
                                                                                                                                        const Center(child: Text("CART IS EMPTY", style: TextStyle(fontSize: 32, fontWeight: FontWeight.w900, fontFamily: "Inter")))), 
                                                                                                                                        
                                                                                                                                        bottomNavigationBar: cart.isNotEmpty ? Padding(padding: EdgeInsets.only(left: screenWidth*0.05, right: screenWidth*0.05, top: 10, bottom: 20),
                                                                                                                                                                                       child: CheckoutButton(total: (cart.fold(0.0, (previousValue, map) => previousValue + map["count"]!*map["price"])*1.05).toStringAsFixed(2))) : null);

  }

}
