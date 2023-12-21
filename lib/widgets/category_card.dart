import "package:flutter/material.dart";
import "package:un1q_developer_test/utility/constants.dart";


class CategoryCard extends StatelessWidget {

  const CategoryCard({ super.key,
                       required this.icon,
                       required this.category });

  final String? icon;
  final String? category;

  @override
  Widget build(BuildContext context) {

    return GestureDetector(onTap: () => print(category), child: Container(padding: const EdgeInsets.symmetric(vertical: 15),
                                                                          decoration: BoxDecoration(border: Border.all(color: grey), borderRadius: const BorderRadius.all(Radius.circular(20))),
                                                                          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Container(margin: const EdgeInsets.only(top: 90 - 15 - 15 - 40), child: Image.asset("assets/icons/$icon.png", width: 80, height: 80)), Container(margin: const EdgeInsets.only(top: 20), child: Text(category!, style: const TextStyle(fontSize: 18)))])));

  }

}
