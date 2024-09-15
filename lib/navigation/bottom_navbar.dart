import 'package:flutter/material.dart';
import 'package:football_master/navigation/bottom_controller.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ant_design.dart';
import 'package:iconsax/iconsax.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BottomController controller = Get.put(BottomController());

    return Scaffold(
      body: Obx(() {
        return controller.currentScreen;
      }),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          currentIndex: controller.selectedIndex.value,
          onTap: (index) {
            controller.changeIndex(index);
          },
          selectedFontSize: 11,
          unselectedItemColor: Colors.grey,
          unselectedLabelStyle: TextStyle(
            fontSize: 11,
            color: Colors.grey,
            fontFamily: GoogleFonts.poppins().fontFamily,
          ),
          selectedLabelStyle: TextStyle(
            color: Colors.black.withOpacity(0.7),
            fontFamily: GoogleFonts.poppins().fontFamily,
          ),
          showUnselectedLabels: false,
          showSelectedLabels: true,
          selectedItemColor: Colors.black.withOpacity(0.7),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Iconsax.home, size: 22),
              activeIcon: Container(
                padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Icon(Iconsax.home_15, size: 22, color: Colors.black),
              ),
              label: 'Beranda',
            ),
            BottomNavigationBarItem(
              icon: Iconify(AntDesign.trophy, size: 22, color: Colors.grey),
              activeIcon: Container(
                padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Iconify(AntDesign.trophy_fill, size: 22, color: Colors.black),
              ),
              label: 'Team',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.groups, size: 22, color: Colors.grey),
              activeIcon: Container(
                padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Icon(Icons.groups_rounded, size: 22, color: Colors.black),
              ),
              label: 'Player',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border, size: 22, color: Colors.grey),
              activeIcon: Container(
                padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Icon(Icons.favorite, size: 22, color: Colors.black),
              ),
              label: 'Favorite',
            ),
          ],
        );
      }),
    );
  }
}
