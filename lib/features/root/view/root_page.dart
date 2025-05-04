import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class RootPage extends StatelessWidget {
  const RootPage({
    super.key,
    required this.navigationShell,
  });

  static const String _charactersIcon = 'assets/icons/characters.svg';
  static const String _starIcon = 'assets/icons/star.svg';

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navigationShell.currentIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: theme.colorScheme.primary,
        unselectedItemColor: Colors.grey,
        items: _buildButtonNavBarItem(theme),
        onTap: (index) => navigationShell.goBranch(
          index,
          initialLocation: index == navigationShell.currentIndex,
        ),
      ),
    );
  }

  List<BottomNavigationBarItem> _buildButtonNavBarItem(ThemeData theme) => [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            RootPage._charactersIcon,
            height: 24,
            width: 24,
            colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
          ),
          activeIcon: SvgPicture.asset(
            RootPage._charactersIcon,
            height: 26,
            width: 26,
            colorFilter: ColorFilter.mode(
              theme.colorScheme.primary,
              BlendMode.srcIn,
            ),
          ),
          label: 'Characters',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            RootPage._starIcon,
            height: 24,
            width: 24,
            colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
          ),
          activeIcon: SvgPicture.asset(
            RootPage._starIcon,
            height: 26,
            width: 26,
            colorFilter: ColorFilter.mode(
              theme.colorScheme.primary,
              BlendMode.srcIn,
            ),
          ),
          label: 'Favorites',
        ),
      ];
}
