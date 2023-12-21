import "package:flutter/material.dart";
import "package:un1q_developer_test/utility/constants.dart";
import "package:un1q_developer_test/providers/screen_context.dart";
import "package:provider/provider.dart";


class BottomNavBar extends StatelessWidget {

  final int selectedIndex;
  final void Function(int)? tabChange;
  const BottomNavBar({ super.key,
                       required this.tabChange,
                       required this.selectedIndex });

  @override
  Widget build(BuildContext context) {

    var cart = context.watch<ScreenProvider>().cart;

    return SizedBox(width: 300, height: 100,
                    child: BottomNavigationBar(type: BottomNavigationBarType.fixed, currentIndex: selectedIndex, onTap: (value) => tabChange!(value),
                                               items: <BottomNavigationBarItem>[const BottomNavigationBarItem(icon: SizedBox.shrink(), label: ""),
                                                                                BottomNavigationBarItem(icon: Padding(padding: const EdgeInsets.only(top: 20, left: 0), child: Column(children: [ColorFiltered(colorFilter: ColorFilter.mode(((selectedIndex == 1) || (selectedIndex == 3)) ? orange : dark_grey, BlendMode.srcATop),
                                                                                                        child: Image.asset("assets/icons/home.png", width: 30)), Container(width: 5, height: 5, decoration: BoxDecoration(color: ((selectedIndex == 1) || (selectedIndex == 3)) ? orange : Colors.white, borderRadius: const BorderRadius.all(Radius.circular(50))),)])), label: ""),
                                                                                BottomNavigationBarItem(icon: Padding(padding: const EdgeInsets.only(top: 20, right: 0), child: Stack(children: <Widget>[Column(children: [ColorFiltered(colorFilter: ColorFilter.mode((selectedIndex == 2) ? orange : dark_grey, BlendMode.srcATop), child: Image.asset("assets/icons/shopping-bag.png", width: 30)),
                                                                                                                                                                                                                           Container(width: 5, height: 5, decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(50))))]),
                      
                                                                                                                                                                                                                          (cart.length > 0) ? Positioned(right: -7, bottom: -7, child: Container(padding: const EdgeInsets.only(bottom: 7, right: 7), 
                                                                                                                                                                                                                                                                                                child: Container(padding: const EdgeInsets.all(1), decoration: BoxDecoration(color: black, borderRadius: BorderRadius.circular(5)), constraints: const BoxConstraints(minWidth: 20, minHeight: 20),
                                                                                                                                                                                                                                                                                                                  child: Center(child: Text(cart.length.toString(), style: const TextStyle(color: Colors.white, fontSize: 10, fontFamily: "Inter"), textAlign: TextAlign.center))))) : const SizedBox.shrink()])), label: ""),
                                                                                const BottomNavigationBarItem(icon: SizedBox.shrink(), label: "")]));

  }

}
