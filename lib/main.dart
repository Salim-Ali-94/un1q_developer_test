import "package:flutter/material.dart";
import "package:un1q_developer_test/screens/home.dart";
import "package:flutter/services.dart";


void main() {

  runApp(const App());

}


class App extends StatelessWidget {

  const App({ super.key });


  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    return MaterialApp(title: "Un1q Fitness", initialRoute: "/",
                       debugShowCheckedModeBanner: false,
                       theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                                        useMaterial3: true),

                       routes: { "/": (context) => Home() });

  }

}
