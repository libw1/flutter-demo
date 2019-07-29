import 'package:flutter/material.dart';
import 'package:flutter_hello_world/widget/credit_card.dart';
import 'package:flutter_hello_world/widget/mock_data.dart';
import 'package:flutter_hello_world/widget/pet_card.dart';
import 'package:flutter_hello_world/widget/friend_circle.dart';


class NormalList extends StatelessWidget{

  const NormalList({Key key}) : super(key : key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
      children: <Widget>[
        CreditCard(data: creditCardData),
        PetCard(data: petCardData),
        FriendCircle(data: friendCircleData)
      ],
    );
  }

}