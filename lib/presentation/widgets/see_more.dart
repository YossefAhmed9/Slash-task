import 'package:flutter/material.dart';
import '../utils/styles.dart';

class SeeMore extends StatelessWidget {
  const SeeMore({super.key});

  @override
  Widget build(BuildContext context) {
    return    Row(
      children: [
        Text(
          'See all',
          style: Styles.font20,
        ),
        IconButton(
            onPressed: () {},
            icon: Icon(
                Icons.keyboard_arrow_right_outlined))
      ],
    );
  }
}
