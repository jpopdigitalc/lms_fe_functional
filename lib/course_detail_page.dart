// course_detail_page.dart
import 'package:flutter/material.dart';
import 'package:lms_fe/course_model.dart';
import 'package:provider/provider.dart';
import 'package:lms_fe/student_enrollment.dart';

class CourseDetailPage extends StatelessWidget {
  final Course course;

  CourseDetailPage({required this.course});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(course.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              course.description,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            Consumer<StudentEnrollment>(
              builder: (context, enrollment, child) {
                return ElevatedButton(
                  onPressed: () {
                    enrollment.enrollStudent(
                      course: course,
                      studentEmail: 'student@example.com',
                    );
                    Navigator.pop(context);
                  },
                  child: Text('Enroll'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

