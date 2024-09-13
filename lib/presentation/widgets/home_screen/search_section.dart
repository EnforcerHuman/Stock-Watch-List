import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SearchSection extends StatelessWidget {
  SearchSection({super.key});
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SearchBar(
        controller: controller,
        onChanged: (value) {
          print('VAlue is $value');
        },
      ),
    );
  }
}
