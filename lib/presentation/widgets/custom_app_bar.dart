import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Center(child: Text(title)),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(30.0), // Adjust the radius as needed
        ),
      ),
      toolbarHeight: 80.0, // Increase the height as needed
    );
  }

  @override
  Size get preferredSize =>
      const Size.fromHeight(80.0); // Match the height here
}
