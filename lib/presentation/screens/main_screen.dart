import 'package:flutter/material.dart';
import 'package:stock_watchlist/presentation/bloc/bottom_navigation/bottom_navigation_bloc.dart';
import 'package:stock_watchlist/presentation/screens/home_screen.dart';
import 'package:stock_watchlist/presentation/screens/watch_list_screen.dart';
import 'package:stock_watchlist/presentation/widgets/bottom_nav_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final List<Widget> screens = [const HomeScreen(), const WatchListScreen()];
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<MainNavigationBloc, MainNavigationState>(
      listener: (context, state) {
        _pageController.animateToPage(
          state.selectedIndex,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
        );
      },
      child: Scaffold(
        body: PageView(
          controller: _pageController,
          children: screens,
          onPageChanged: (index) {
            context.read<MainNavigationBloc>().add(NavigateToIndex(index));
          },
        ),
        bottomNavigationBar:
            BlocBuilder<MainNavigationBloc, MainNavigationState>(
          builder: (context, state) {
            return BottomNavBar(
              selectedIndex: state.selectedIndex,
              onItemTapped: (index) {
                context.read<MainNavigationBloc>().add(NavigateToIndex(index));
              },
            );
          },
        ),
      ),
    );
  }
}
