import 'package:flutter/material.dart';
import 'package:ordo_test/const/colors.dart';
import 'package:ordo_test/const/text_style.dart';

enum NavbarItemType {
  home(
    title: 'Home',
    icon: Icon(
      Icons.home_filled,
      color: OrdoColors.whiteColor,
      size: 24,
    ),
  ),
  lead(
    title: 'Lead',
    icon: Icon(
      Icons.paste_outlined,
      color: OrdoColors.whiteColor,
      size: 24,
    ),
  ),
  commission(
    title: 'Commission',
    icon: Icon(
      Icons.access_time_outlined,
      color: OrdoColors.whiteColor,
      size: 24,
    ),
  ),
  profile(
    title: 'Profile',
    icon: Icon(
      Icons.person,
      color: OrdoColors.whiteColor,
      size: 24,
    ),
  ),
  ;

  final String title;
  final Widget icon;

  const NavbarItemType({
    required this.title,
    required this.icon,
  });
}

class HomeNavbar extends StatelessWidget {
  final int currentIndex;
  const HomeNavbar({
    required this.currentIndex,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed, // Fixed
          currentIndex: currentIndex,
          backgroundColor: OrdoColors.darkPurpleColor,
          iconSize: 24,
          selectedFontSize: 11,
          selectedLabelStyle: textSmallMedium,
          selectedItemColor: OrdoColors.whiteColor,
          unselectedFontSize: 11,
          unselectedLabelStyle: textSmallRegular.copyWith(
            fontWeight: FontWeight.w400,
          ),
          unselectedItemColor: OrdoColors.whiteColor.withOpacity(0.81),
          showSelectedLabels: true,
          showUnselectedLabels: true,

          items: [
            BottomNavigationBarItem(
              label: NavbarItemType.home.title,
              icon: NavbarItemType.home.icon,
            ),
            BottomNavigationBarItem(
              label: NavbarItemType.lead.title,
              icon: NavbarItemType.lead.icon,
            ),
            BottomNavigationBarItem(
              label: NavbarItemType.commission.title,
              icon: NavbarItemType.commission.icon,
            ),
            BottomNavigationBarItem(
              label: NavbarItemType.profile.title,
              icon: NavbarItemType.profile.icon,
            ),
          ],
        ),
      ),
    );
  }
}
