import "package:flutter/material.dart";
import "package:un1q_developer_test/widgets/image_box.dart";
import "package:un1q_developer_test/utility/constants.dart";
import "package:un1q_developer_test/providers/screen_context.dart";
import "package:provider/provider.dart";


class OrderDetails extends StatelessWidget {

  final int count;
  final double price;
  final String id;
  final String image;
  final String meal;
  const OrderDetails({ super.key,
                       required this.count,
                       required this.price,
                       required this.id,
                       required this.image,
                       required this.meal });

  @override
  Widget build(BuildContext context) {

    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(padding: EdgeInsets.only(top: 20, bottom: 20, left: screenWidth*0.05, right: screenWidth*0.05),
                   child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,

                              children: [Row(children: [ImageBox(network: true, colour: grey, image: image, size: 0.15), const SizedBox(width: 15),
                                                        Text("$count", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, fontFamily: "Inter")),
                                                        const SizedBox(width: 8), const Text("x", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, fontFamily: "Inter")),
                                                        const SizedBox(width: 10), SizedBox(width: screenWidth*0.27, child: Text(meal, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, fontFamily: "Inter")))]),
                                         
                                         Row(children: [Text("\$$price", style: const TextStyle(fontSize: 16, fontFamily: "Inter")), const SizedBox(width: 5),
                                                        GestureDetector(onTap: () => context.read<ScreenProvider>().removeItem(id), child: Image.asset("assets/icons/close.png", width: 15))])]));

  }

}
