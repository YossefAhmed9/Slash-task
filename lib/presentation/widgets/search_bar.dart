import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DefaultSearchBar extends StatelessWidget {
  const DefaultSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 47, // Adjust the width as needed
      height: 45, // Adjust the height as needed
      child: TextFormField(
        decoration: InputDecoration(
          fillColor: Color(0XFFE4E4E4), // Set the background color of the TextFormField
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none, // Remove border if needed
          ),
          labelText: 'Search here',
          labelStyle: TextStyle(color: Colors.grey[500]),
          prefixIcon: Icon(FontAwesomeIcons.magnifyingGlass),
        ),
      ),
    );

  }
}
