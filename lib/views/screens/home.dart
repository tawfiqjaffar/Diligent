import 'package:Diligent/models/project.dart';
import 'package:Diligent/presenters/delegates/home_delegate.dart';
import 'package:Diligent/presenters/presenters/presenters.dart';
import 'package:Diligent/views/screens/activities.dart';
import 'package:Diligent/views/screens/profile.dart';
import 'package:Diligent/views/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'screens.dart';

class HomeScreen extends StatefulWidget {
  final HomePresenter presenter;

  const HomeScreen({Key key, @required this.presenter}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> implements HomeDelegate {
  final List<Project> _projectList = [];

  final List<IconData> _icons = const [
    Icons.dashboard,
    Icons.account_balance_wallet,
    Icons.today,
    Icons.person,
  ];

  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    this.widget.presenter.delegate = this;
    this.widget.presenter.getProjects();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _icons.length,
      child: Scaffold(
        body: SafeArea(
          child: IndexedStack(
            index: _selectedIndex,
            children: [
              Dashboard(),
              Projects(
                projectList: _projectList,
              ),
              Activities(),
              Profile(),
            ],
          ),
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

  @override
  void displayProjects(List<Project> projects) {
    setState(() {
      this._projectList.clear();
      this._projectList.addAll(projects);
    });
  }
}
