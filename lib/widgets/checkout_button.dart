import "package:flutter/material.dart";
import "package:un1q_developer_test/utility/constants.dart";
import "package:un1q_developer_test/providers/screen_context.dart";
import "package:provider/provider.dart";


class CheckoutButton extends StatelessWidget {

  final String total;
  const CheckoutButton({ super.key, required this.total });

  @override
  Widget build(BuildContext context) {

    final screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(onTap: () => showDialog(context: context,
                                                   builder: (_) => AlertDialog(title: const Text("Confirm order"), content: SizedBox(height: 80, child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text("Total: \$$total", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700, fontFamily: "Inter")), const SizedBox(height: 10),
                                                                                                                                                                                                                        GestureDetector(onTap: () => { context.read<ScreenProvider>().clearCart(), context.read<ScreenProvider>().updateScreen(1), Navigator.of(context, rootNavigator: true).pop("dialog") }, child: Container(width: 200, height: 40, decoration: const BoxDecoration(color: green, borderRadius: BorderRadius.all(Radius.circular(5))),
                                                                                                                                                                                                                                                                                                                                                                                                                                child: const Center(child: Text("Continue to pay", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w900, fontFamily: "Inter")))))])))),
                                                                                                                                                                                                                                                                                                                                                                                                                                child: Container(width: screenWidth*0.92, height: 50, decoration: const BoxDecoration(color: orange, borderRadius: BorderRadius.all(Radius.circular(16))), padding: const EdgeInsets.symmetric(horizontal: 20),
                                                                                                                                                                                                                                                                                                                                                                                                                                                 child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [const Text("CHECKOUT", style: TextStyle(fontWeight: FontWeight.w500, fontFamily: "Inter")), Text("\$$total", style: const TextStyle(fontWeight: FontWeight.w500, fontFamily: "Inter"))])));

  }

}
