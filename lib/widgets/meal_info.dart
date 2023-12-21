import "package:flutter/material.dart";
import "package:percent_indicator/percent_indicator.dart";
import "package:un1q_developer_test/widgets/quantity_selector.dart";
import "package:un1q_developer_test/widgets/image_box.dart";
import "package:un1q_developer_test/utility/constants.dart";


class MealInfo extends StatelessWidget {

  final String meal;
  final double protein;
  final double carbohydrate;
  final double fibre;
  final String image;
  final int count;
  final double calories;
  final double price;
  final String id;
  const MealInfo({ super.key,
                   required this.meal,
                   required this.protein,
                   required this.carbohydrate,
                   required this.count,
                   required this.image,
                   required this.calories,
                   required this.id,
                   required this.price,
                   required this.fibre });

  @override
  Widget build(BuildContext context) {

    return Padding(padding: const EdgeInsets.only(top: 20, bottom: 20),
                   child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [Column(crossAxisAlignment: CrossAxisAlignment.start,
                                                 children: [Text(meal, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600, fontFamily: "Inter")), 
                                                            const SizedBox(height: 5), Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                           children: [Column(crossAxisAlignment: CrossAxisAlignment.start, children: [const Text("Protein", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12, fontFamily: "Inter")), Text("${protein.toString()} gr", style: const TextStyle(fontSize: 12, fontFamily: "Inter"))]), const SizedBox(width: 10),
                                                                                                      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [const Text("Carbohydrate", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12, fontFamily: "Inter")), Text("${carbohydrate.toString()} gr", style: const TextStyle(fontSize: 12, fontFamily: "Inter"))]), const SizedBox(width: 10),
                                                                                                      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [const Text("Fibre", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12, fontFamily: "Inter")), Text("${fibre.toString()} gr", style: const TextStyle(fontSize: 12, fontFamily: "Inter"))]), const SizedBox(width: 10),
                                                                                                      SizedBox(child: CircularPercentIndicator(radius: 20, lineWidth: 3, percent: calories / 1000, progressColor: (calories <= 500) ? green : (calories <= 800) ? orange : red, backgroundColor: grey, circularStrokeCap: CircularStrokeCap.round,
                                                                                                                                               center: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Text(calories.toStringAsFixed(0), style: const TextStyle(fontSize: 12, height: 0, fontFamily: "Inter")), const Text("cal", style: TextStyle(fontSize: 10, height: 0, fontFamily: "Inter"))])))]),

                                                            const SizedBox(height: 10),
                                                            
                                                            Row(children: [QuantitySelector(id: id, count: count), const SizedBox(width: 20), Text("\$${price.toStringAsFixed(2)}", style: const TextStyle(fontSize: 16, fontFamily: "Inter"))])]),

                                          ImageBox(network: true, colour: grey, image: image, size: 0.3)]));

  }

}
