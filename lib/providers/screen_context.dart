import "package:flutter/material.dart";
import "package:un1q_developer_test/models/meal_data.dart";
import "package:un1q_developer_test/screens/home.dart";
import "package:un1q_developer_test/screens/orders.dart";
import "package:un1q_developer_test/screens/meal_details.dart";
import "package:un1q_developer_test/utility/utility.dart";
import "package:hive/hive.dart";


class ScreenProvider with ChangeNotifier {

  final _box = Hive.box("data");
  int _screen = 1;
  int get screen => _screen;
  String _taxon = "";
  String get taxon => _taxon;
  List<MealData> _data = [];
  List<MealData> get data => _data;
  Map<String, dynamic> _display = { "screen": Home(), "title": "Category"};
  Map<String, dynamic> get display => _display;
  List<Map<String, dynamic>> _cart = [];
  List<Map<String, dynamic>> get cart => _cart;
  final List<Map<String, dynamic>> _screens = [{ "screen": () => {}, "title": ""},
                                               { "screen": Home(), "title": "Category"},
                                               { "screen": Orders(), "title": "Orders" },
                                               { "screen": MealDetails(), "title": "Details" }];
  List<Map<String, dynamic>> get screens => _screens;
  ScreenProvider._();

  static Future<ScreenProvider> create() async {

    final provider = ScreenProvider._();

    if (provider._box.get("meals") != null) {

      provider._data = List<MealData>.from(provider._box.get("meals"));

    } else {

      provider._data = await fetchMeals();
      provider._box.put("meals", provider._data);

    }

    if (provider._box.get("cart") != null) {
      
      provider._cart = (provider._box.get("cart") as List<dynamic>).map((item) => Map<String, dynamic>.from(item)).toList();

    }

    provider.notifyListeners();
    return provider;

  }

  void updateScreen(int screen, { arg = null }) {

    _screen = screen;
    _display = screens[screen];

    if (arg != null) {

      _taxon = arg;

    }

    notifyListeners();

  }

  void incrementCounter(String id) {

    _cart.firstWhere((element) => element["id"] == id)["count"] += 1; 
    _box.put("cart", _cart);
    notifyListeners();

  }

  void decrementCounter(String id) {

    if (_cart.where((element) => element["id"] == id).isNotEmpty) {

      if (_cart.firstWhere((element) => element["id"] == id)["count"] - 1 == 0) {

        _cart.removeWhere((element) => element["id"] == id);

      } else {

        _cart.firstWhere((element) => element["id"] == id)["count"] -= 1; 

      }

    }

    _box.put("cart", _cart);
    notifyListeners();

  }

  void removeItem(id) {

    _cart.removeWhere((element) => element["id"] == id);
    _box.put("cart", _cart);
    notifyListeners();

  }

  void add2Cart(id) {

    var item = _data.firstWhere((element) => element.id == id);

    _cart.add({ "id": id,
                "image": item.image,
                "meal": item.meal,
                "count": 1,
                "price": item.price });

    _box.put("cart", _cart);
    notifyListeners();

  }

  void clearCart() {

    _cart = [];
    _box.put("cart", []);
    notifyListeners();

  }

}
