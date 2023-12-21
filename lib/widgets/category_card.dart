import "package:flutter/material.dart";
import "package:un1q_developer_test/utility/constants.dart";
import "package:un1q_developer_test/providers/screen_context.dart";
import "package:provider/provider.dart";


class CategoryCard extends StatelessWidget {

  final String? icon;
  final String? category;
  const CategoryCard({ super.key,
                       required this.icon,
                       required this.category });

  @override
  Widget build(BuildContext context) {

    return GestureDetector(onTap: () => context.read<ScreenProvider>().updateScreen(3, arg: category), child: Container(padding: const EdgeInsets.symmetric(vertical: 15),
                                                                                                                        decoration: BoxDecoration(border: Border.all(color: grey), borderRadius: const BorderRadius.all(Radius.circular(20))),
                                                                                                                        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Container(margin: const EdgeInsets.only(top: 20), child: Image.asset("assets/icons/$icon.png", width: 80, height: 80)),
                                                                                                                                                                                             Container(margin: const EdgeInsets.only(top: 20), child: Text(category!, style: const TextStyle(fontSize: 18, fontFamily: "Inter")))])));

  }

}
