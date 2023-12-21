import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:un1q_developer_test/utility/screen_manager.dart";
import "package:un1q_developer_test/providers/screen_context.dart";
import "package:provider/provider.dart";
import "package:hive_flutter/hive_flutter.dart";
import "package:un1q_developer_test/models/meal_data_adapter.dart";


void main() async {

  await Hive.initFlutter();
  Hive.registerAdapter(MealDataAdapter());
  await Hive.openBox("data");
  final screenProvider = await ScreenProvider.create();

  runApp(ChangeNotifierProvider<ScreenProvider>(create: (_) => screenProvider,
                                                child: const App()));

}


class App extends StatelessWidget {

  const App({ super.key });


  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    return MaterialApp(title: "Un1q Fitness", initialRoute: "/",
                       debugShowCheckedModeBanner: false,
                       theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                                        useMaterial3: true, highlightColor: Colors.transparent, splashColor: Colors.transparent),
                       routes: { "/": (context) => const ScreenManager() });

  }

}
