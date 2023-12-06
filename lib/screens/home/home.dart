import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:ordo_test/components/navbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            CustomScrollView(),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: HomeNavbar(
                currentIndex: 0,
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
  }
}
