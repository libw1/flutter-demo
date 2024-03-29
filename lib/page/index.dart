import 'package:flutter/material.dart';
import 'package:flutter_hello_world/common/demo_tabs.dart';

import 'ListPage.dart';
import 'builder_usage.dart';


const List<DemoTabViewModel> demos = [
  DemoTabViewModel(title: '普通用法', widget: NormalList()),
  DemoTabViewModel(title: 'builder用法', widget: SubscribeAccountList()),
//  DemoTabViewModel(title: 'separated用法', widget: FriendList()),
//  DemoTabViewModel(title: '下拉刷新用法', widget: PullDownRefreshList()),
//  DemoTabViewModel(title: '上拉加载用法', widget: PullUpLoadMoreList()),
];

class ListViewDemo extends StatefulWidget {
  @override
  _ListViewDemoState createState() => _ListViewDemoState();
}

class _ListViewDemoState extends State<ListViewDemo>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();
    this.tabController = TabController(length: demos.length, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    this.tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DemoTabs(
      title: 'ListView组件',
      demos: demos,
      tabController: this.tabController,
    );
  }
}
