// course_list_page.dart or home_page.dart
import 'package:flutter/material.dart';
import 'package:lms_fe/enrollment_page.dart';  // Adjust path based on your project structure
import 'package:lms_fe/course_model.dart';    // Adjust path based on your project structure

// lib/pages/course_list_page.dart
import 'package:flutter/material.dart';
import 'package:lms_fe/course_model.dart';
import 'package:lms_fe/enrollment_page.dart';
import 'package:lms_fe/main_scaffold.dart';

class CourseListPage extends StatelessWidget {
  const CourseListPage({Key? key}) : super(key: key);

  static const List<Course> courses = [
    Course(
      title: 'Introduction to Flutter',
      description: 'Learn Flutter basics and build your first app'
    ),
    Course(
      title: 'Advanced Flutter',
      description: 'Master state management and complex UI patterns'
    ),
    Course(
      title: 'Flutter Testing',
      description: 'Learn unit, widget, and integration testing'
    ),
    Course(
      title: 'Flutter Architecture',
      description: 'Best practices for large scale applications'
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      appBar: AppBar(
        title: const Text('Available Courses'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 1.2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemCount: courses.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 4,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EnrollmentPage(
                        course: courses[index],
                      ),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        courses[index].title,
                        style: Theme.of(context).textTheme.titleMedium,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        courses[index].description,
                        style: Theme.of(context).textTheme.bodyMedium,
                        textAlign: TextAlign.center,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}