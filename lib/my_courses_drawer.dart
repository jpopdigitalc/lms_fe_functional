// lib/widgets/my_courses_drawer.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lms_fe/student_enrollment.dart';
import 'package:lms_fe/course_model.dart';

class MyCoursesDrawer extends StatelessWidget {
  const MyCoursesDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final enrollment = Provider.of<StudentEnrollment>(context);

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('My Courses'),
          ),
          FutureBuilder<List<Course>>(
            future: enrollment.getEnrolledCourses(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              }
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }
              if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const ListTile(
                  title: Text('No courses enrolled yet'),
                );
              }
              return Column(
                children: snapshot.data!.map((course) {
                  return ListTile(
                    title: Text(course.title),
                    subtitle: Text(course.description),
                  );
                }).toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}