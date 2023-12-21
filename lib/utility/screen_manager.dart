import "package:flutter/material.dart";
import "package:un1q_developer_test/widgets/bottom_nav_bar.dart";
import "package:un1q_developer_test/providers/screen_context.dart";
import "package:provider/provider.dart";


class ScreenManager extends StatefulWidget {

  const ScreenManager({ super.key });

  @override
  State<ScreenManager> createState() => _ScreenManagerState();

}

class _ScreenManagerState extends State<ScreenManager> {

  @override
  Widget build(BuildContext context) {

    var current_screen = context.watch<ScreenProvider>().screen;
    var display = context.watch<ScreenProvider>().display;

    return Scaffold(backgroundColor: Colors.white, extendBody: true,

                    appBar: (display["title"] != "Details") ? AppBar(title: Text(display["title"]!, style: const TextStyle(fontWeight: FontWeight.w700, fontFamily: "Inter")),
                                                                                     centerTitle: true, leading: IconButton(icon: const Icon(Icons.chevron_left, size: 30), onPressed: () => (current_screen != 1) ? context.read<ScreenProvider>().updateScreen(1) : null), scrolledUnderElevation: 0) : null,

                    bottomNavigationBar: (display["title"] != "Orders") ? BottomNavBar(tabChange: (screen) => ((screen != 0) && (screen != 3)) ? context.read<ScreenProvider>().updateScreen(screen) : null, selectedIndex: current_screen) : null,
                    body: (display["title"] != "Details") ? SafeArea(child: display["screen"]!) : display["screen"]!);

  }

}
