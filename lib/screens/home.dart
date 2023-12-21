import "package:flutter/material.dart";
import "package:un1q_developer_test/widgets/category_card.dart";
import "package:un1q_developer_test/utility/constants.dart";


class Home extends StatelessWidget {

  const Home({ super.key });

  @override
  Widget build(BuildContext context) {

    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(appBar: AppBar(title: const Text("Categories", style: TextStyle(fontWeight: FontWeight.w700)),
                                   centerTitle: true, leading: const Icon(Icons.chevron_left, size: 30)),

                    body: Container(margin: const EdgeInsets.only(top: 30), child: Column(children: [GridView.builder(itemCount: categories.length, shrinkWrap: true, physics: NeverScrollableScrollPhysics(), padding: EdgeInsets.only(left: screenWidth*0.03, right: screenWidth*0.03), primary: false,
                                                                                                                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(childAspectRatio: screenWidth*0.45 / 180, crossAxisSpacing: 20, mainAxisSpacing: 20, crossAxisCount: 2),
                                                                                                                      itemBuilder: (_, index) => CategoryCard(icon: categories[index]["icon"], category: categories[index]["category"]))])));

  }

}
