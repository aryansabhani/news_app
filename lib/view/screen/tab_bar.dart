import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:news_app/view/screen/home_screen.dart';

import 'topic_wiseNews.dart';

class TabBarScreen extends StatefulWidget {
  const TabBarScreen({super.key});

  @override
  State<TabBarScreen> createState() => _TabBarScreenState();
}

/// [AnimationController]s can be created with `vsync: this` because of
/// [TickerProviderStateMixin].
class _TabBarScreenState extends State<TabBarScreen>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2  , vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    log('${Colors.deepPurple.shade500}');
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Gusto News',style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.deepPurple.shade500,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          indicatorWeight: 3,

          labelColor: Colors.white,
          unselectedLabelColor: Colors.white60,
          tabs:  <Widget>[
            Tab(

              child: Text('Country Wise News',),
            ),
            Tab(
              child: Text('Topic Wise News'),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const <Widget>[
          HomePage(),
          TopicNews(),
        ],
      ),
    );
  }
}
