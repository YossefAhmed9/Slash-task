import 'package:flutter/material.dart';

class AdjustSearch extends StatelessWidget {
  const AdjustSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        width: 47,
        height: 45,
        decoration: BoxDecoration(
            color: Color(0XFFE4E4E4),
            borderRadius: BorderRadius.circular(10)),
        child: IconButton(
            onPressed: () {}, icon: Icon(Icons.tune)));
  }
}
