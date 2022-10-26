import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class NavItem {
  const NavItem({
    required this.title,
    required this.icon,
    required this.route,
  });

  final String title;
  final IconData icon;
  final String route;
}

const navItems = [
  NavItem(
    title: 'Main',
    icon: FontAwesomeIcons.fileInvoiceDollar,
    route: '/main',
  ),
  NavItem(
    title: 'Statistics',
    icon: FontAwesomeIcons.chartPie,
    route: '/statistics',
  ),
  NavItem(
    title: 'Accounts',
    icon: FontAwesomeIcons.wallet,
    route: '/accounts',
  ),
  NavItem(
    title: 'More',
    icon: FontAwesomeIcons.ellipsis,
    route: '/more',
  ),
];

class MainPage extends StatefulWidget {
  const MainPage({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _locationToNavIndex(String location) {
    final index = navItems.indexWhere((t) => location.startsWith(t.route));
    // if index not found (-1), return 0
    return index < 0 ? 0 : index;
  }

  int get _currentIndex => _locationToNavIndex(GoRouter.of(context).location);

  void _onItemTapped(BuildContext context, int index) {
    // Only navigate if the tab index has changed
    if (index != _currentIndex) {
      context.go(navItems[index].route);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) => _onItemTapped(context, index),
        destinations: const [
          NavigationDestination(
            icon: FaIcon(FontAwesomeIcons.fileInvoiceDollar),
            label: 'Main',
          ),
          NavigationDestination(
            icon: FaIcon(FontAwesomeIcons.chartPie),
            label: 'Stats',
          ),
          NavigationDestination(
            icon: FaIcon(FontAwesomeIcons.creditCard),
            label: 'Accounts',
          ),
          NavigationDestination(
            icon: FaIcon(FontAwesomeIcons.ellipsis),
            label: 'More',
          ),
        ],
      ),
    );
  }
}
