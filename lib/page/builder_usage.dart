import 'package:flutter/material.dart';
import 'package:flutter_hello_world/widget/subscribe_account_card.dart';

import 'mock_data.dart';


class SubscribeAccountList extends StatelessWidget {
  const SubscribeAccountList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFEFEFEF),
      child: ListView.builder(
        itemCount: subscribeAccountList.length,
        itemBuilder: (context, index) {
          return SubscribeAccountCard(data: subscribeAccountList[index]);
        },
      ),
    );
  }
}
