import 'package:flutter/material.dart';
import 'package:stock_watchlist/presentation/widgets/home_screen/home_screen_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const HomeScreenView(),
    );
  }
}
