// lib/widgets/main_scaffold.dart
import 'package:flutter/material.dart';
import 'package:lms_fe/my_courses_drawer.dart';

class MainScaffold extends StatelessWidget {
  final Widget body;
  final PreferredSizeWidget? appBar;  // Add this
  
  const MainScaffold({
    Key? key,
    required this.body,
    this.appBar,  // Add this
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,  // Add this
      drawer: const MyCoursesDrawer(),
      body: body,
    );
  }
}