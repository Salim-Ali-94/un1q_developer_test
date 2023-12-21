import "package:flutter/material.dart";
import "package:un1q_developer_test/utility/constants.dart";
import "package:un1q_developer_test/providers/screen_context.dart";
import "package:provider/provider.dart";


class QuantitySelector extends StatelessWidget {

  final int count;
  final String id;
  const QuantitySelector({ super.key,
                           required this.count,
                           required this.id });

  @override
  Widget build(BuildContext context) {

    var cart = context.watch<ScreenProvider>().cart;

    return Container(width: 140, height: 50, decoration: const BoxDecoration(color: grey, borderRadius: BorderRadius.all(Radius.circular(20))),
                     child: Row(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.spaceAround,

                                children: [GestureDetector(onTap: () => context.read<ScreenProvider>().decrementCounter(id),
                                                           child: Image.asset("assets/icons/minus.png", width: 16)), Text(count.toString(), style: const TextStyle(fontSize: 20, fontFamily: "Inter")),

                                           GestureDetector(onTap: () => cart.where((item) => item["id"] == id).length == 0 ? context.read<ScreenProvider>().add2Cart(id) : context.read<ScreenProvider>().incrementCounter(id),
                                                           child: Image.asset("assets/icons/plus.png", width: 16))]));

  }

}
