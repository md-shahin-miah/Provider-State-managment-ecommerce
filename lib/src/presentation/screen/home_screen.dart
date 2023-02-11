import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider_example/src/presentation/screen/profile_screen.dart';

import '../../../core/app_color.dart';
import '../../../core/app_data.dart';
import 'cart_screen.dart';
import 'favorite_screen.dart';
import 'office_bag_list_screen.dart';

class HomeScreen extends HookWidget {
  final List<Widget> screens = const [
    OfficeBagListScreen(),
    CartScreen(),
    FavoriteScreen(),
    ProfileScreen()
  ];

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selectedIndex = useState(0);

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey,
        currentIndex: selectedIndex.value,
        showUnselectedLabels: true,
        onTap: (int index) {
          selectedIndex.value = index;
        },
        fixedColor: AppColor.lightBlack,
        items: AppData.bottomNavigationItems
            .map(
              (element) => BottomNavigationBarItem(
                icon: element.icon,
                label: element.label,
              ),
            )
            .toList(),
      ),
      body: screens[selectedIndex.value],
    );
  }
}
