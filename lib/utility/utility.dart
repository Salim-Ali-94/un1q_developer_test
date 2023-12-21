import "dart:core";
import "dart:convert";
import "package:http/http.dart" as http;
import "package:un1q_developer_test/utility/constants.dart";
import "package:un1q_developer_test/models/meal_data.dart";


Future<List<MealData>> fetchMeals() async {

  List<MealData> meals = [];
  final response = await http.get(Uri.parse(meal_endpoint));

  if (response.statusCode == 200) {

    final jsonData = jsonDecode(response.body.toString());

    for (var entry in jsonData["data"]) {

      String title = entry["title"];
      int id = entry["id"];
      double price = entry["variants"][0]["price"]["amount"] / 100;
      String img = entry["media"][0]["url"];
 
      double cals = 510;
      double prot = 16.2;
      double carbs = 16.2;
      double fib = 16.2;

      if (entry["meta_fields"].length > 1) {

        cals = (entry["meta_fields"].firstWhere((item) => item["key"] == "calories")["value"] ?? 0).toDouble();
        prot = (entry["meta_fields"].firstWhere((item) => item["key"] == "protein")["value"] ?? 0).toDouble();
        carbs = (entry["meta_fields"].firstWhere((item) => item["key"] == "carbs")["value"] ?? 0).toDouble();
        fib = (entry["meta_fields"].firstWhere((item) => item["key"] == "fibre")["value"] ?? 0).toDouble();

      }

      meals.add(MealData(id: id.toString(),
                         meal: title,
                         price: price,
                         calories: cals,
                         protein: prot,
                         fibre: fib,
                         carbohydrate: carbs,
                         image: img));

    }

  }

  return meals;

}
