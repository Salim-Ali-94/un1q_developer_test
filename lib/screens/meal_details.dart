import "package:flutter/material.dart";
import "package:un1q_developer_test/widgets/meal_info.dart";
import "package:un1q_developer_test/providers/screen_context.dart";
import "package:provider/provider.dart";
import "package:un1q_developer_test/utility/constants.dart";


class MealDetails extends StatelessWidget {

  MealDetails({ super.key });
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {

    final screenWidth = MediaQuery.of(context).size.width;
    var data = context.watch<ScreenProvider>().data;
    var cart = context.watch<ScreenProvider>().cart;
    var taxon = context.watch<ScreenProvider>().taxon;

    return Scaffold(body: SingleChildScrollView(controller: scrollController, 
                                                child: SizedBox(child: Column(children: [Container(width: screenWidth, height: 300, decoration: BoxDecoration(image: DecorationImage(image: AssetImage(categories.firstWhere((food) => food["category"]!.toLowerCase() == taxon.toLowerCase())["cover"]!),
                                                                                                                                                              fit: BoxFit.cover,colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.darken))),
                                                                                                   child: Container(padding: const EdgeInsets.only(left: 10), child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center, children: [Text(taxon, style: const TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.w700, fontFamily: "Inter"))]))),
      
                                                                                        ListView.separated(scrollDirection: Axis.vertical, itemCount: data.length,
                                                                                                           physics: const NeverScrollableScrollPhysics(),
                                                                                                           shrinkWrap: true, primary: false,
                                                                                                           separatorBuilder: (context, index) => const SizedBox(width: 8),
                                                                                                           itemBuilder: (context, index) => Column(children: [MealInfo(price: data[index].price,
                                                                                                                                                                       calories: (data[index].calories <= 1000) ? data[index].calories: 1000.0,
                                                                                                                                                                       id: data[index].id,
                                                                                                                                                                       image: data[index].image,
                                                                                                                                                                       meal: data[index].meal,
                                                                                                                                                                       protein: data[index].protein,
                                                                                                                                                                       carbohydrate: data[index].carbohydrate,
                                                                                                                                                                       fibre: data[index].fibre,
                                                                                                                                                                       count: cart.where((element) => element["id"] == data[index].id).isNotEmpty ? cart.firstWhere((element) => element["id"] == data[index].id)["count"] : 0),
                                                                                                                                                                       (index != data.length - 1) ? Divider(color: grey, thickness: 1.0,
                                                                                                                                                                                                            indent: screenWidth*0.05,
                                                                                                                                                                                                            endIndent: screenWidth*0.05) : const SizedBox.shrink()]))]))));

  }

}
