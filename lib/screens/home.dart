import 'package:Diligent/screens/screens.dart';
import 'package:Diligent/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Widget> _screens = [
    Dashboard(),
    Scaffold(
      body: Container(
        color: Colors.purple,
      ),
    ),
    Scaffold(
      body: Container(
        color: Colors.blue,
      ),
    ),
    Scaffold(
      body: Container(
        color: Colors.green,
      ),
    ),
    Scaffold(
      body: Container(
        color: Colors.orange,
      ),
    ),
  ];

  final List<IconData> _icons = const [
    Icons.dashboard,
    Icons.account_balance_wallet,
    Icons.today,
    Icons.lightbulb,
    Icons.person,
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return DefaultTabController(
      length: _icons.length,
      child: Scaffold(
        body: IndexedStack(
          index: _selectedIndex,
          children: _screens,
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.only(bottom: 12.0),
          child: CustomTabBar(
              icons: _icons,
              selectedIndex: _selectedIndex,
              onTap: (index) => setState(() => _selectedIndex = index)),
        ),
      ),
    );
  }
}
