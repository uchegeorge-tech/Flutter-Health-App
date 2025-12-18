import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class CustomNavBar {
  static Widget navIcon({
    required BuildContext context,
    required String assetPath,
    required String label,
    required int index,
    required int currentIndex,
  }) {
    final bool isSelected = currentIndex == index;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 14),
      decoration: BoxDecoration(
        color: isSelected
            ? const Color(0xFF98E2F4).withOpacity(0.6)
            : Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            assetPath,
            width: 22,
            height: 22,
            colorFilter: ColorFilter.mode(
              isSelected ? Colors.black : Colors.black,
              BlendMode.srcIn,
            ),
          ),
          if (isSelected) ...[
            const SizedBox(height: 3),
            Text(
              label,
              style: TextStyle(
                fontSize: 11,
                color: Colors.black,
              ),
            ),
          ],
        ],
      ),
    );
  }

  static Widget bar({
    required BuildContext context,
    required int currentIndex,
    required Function(int) onTap,
  }) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      currentIndex: currentIndex,
      onTap: onTap,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: [
        BottomNavigationBarItem(
          icon: navIcon(
            context: context,
            assetPath: 'assets/svg/home.svg',
            label: 'Home',
            index: 0,
            currentIndex: currentIndex,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: navIcon(
            context: context,
            assetPath: 'assets/svg/chat.svg',
            label: 'Chat',
            index: 1,
            currentIndex: currentIndex,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: navIcon(
            context: context,
            assetPath: 'assets/svg/book_open.svg',
            label: 'Courses',
            index: 2,
            currentIndex: currentIndex,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: navIcon(
            context: context,
            assetPath: 'assets/svg/profile.svg',
            label: 'Profile',
            index: 3,
            currentIndex: currentIndex,
          ),
          label: '',
        ),
      ],
    );
  }
}
