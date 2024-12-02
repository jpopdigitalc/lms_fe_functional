import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:lms_fe/course_model.dart';
import 'package:lms_fe/student_enrollment.dart';
import 'package:lms_fe/enrollment_page.dart';
import 'package:lms_fe/course_card.dart';
import 'package:lms_fe/course_list_page.dart';
import 'package:lms_fe/my_courses_drawer.dart';
import 'package:lms_fe/main_scaffold.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => StudentEnrollment(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Course Enrollment',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainScaffold(
        body: CourseListPage(),
      ),
    );
  }
}
