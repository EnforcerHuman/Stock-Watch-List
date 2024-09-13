import 'package:flutter/material.dart';

/// A responsive search bar widget with clear and concise search functionality.
/// This widget automatically adjusts its padding, icon size, and text size based

class SearchBar extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onChanged;

  const SearchBar({
    super.key,
    required this.controller,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    // Get the screen size to calculate responsive dimensions
    final size = MediaQuery.of(context).size;

    // Calculate horizontal padding as 4% of screen width
    final double horizontalPadding = size.width * 0.04;

    // Calculate vertical padding as 2% of screen height
    final double verticalPadding = size.height * 0.02;

    // Calculate the size of the search icon as 5% of screen width
    final double iconSize = size.width * 0.05;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: verticalPadding,
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SizedBox(
            // Set the width to the maximum available space
            width: constraints.maxWidth,

            // Set the height to 7% of the screen height
            height: size.height * 0.07,
            child: TextField(
              onChanged: onChanged,
              controller: controller,
              decoration: InputDecoration(
                hintText: 'Search...',
                // Prefix icon with the calculated icon size
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey,
                  size: iconSize,
                ),
                // Suffix icon with a slightly smaller size (80% of the search icon size)
                suffixIcon: IconButton(
                  onPressed: () {
                    controller.clear();
                    onChanged('');
                  },
                  icon: Icon(
                    Icons.clear,
                    color: Colors.grey,
                    size: iconSize * 0.8,
                  ),
                ),
                filled: true,
                fillColor: Colors.white,
                // Padding inside the text field
                contentPadding: EdgeInsets.symmetric(
                  vertical: size.height * 0.015, // 1.5% of screen height
                  horizontal: size.width * 0.03, // 3% of screen width
                ),
                // Rounded border with no outline
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide.none,
                ),
                // Hint text styling with responsive font size
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: size.width * 0.04, // 4% of screen width
                ),
              ),
              // Text style with responsive font size
              style: TextStyle(fontSize: size.width * 0.04),
            ),
          );
        },
      ),
    );
  }
}
