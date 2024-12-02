// course_card.dart
import 'package:flutter/material.dart';
import 'package:lms_fe/course_model.dart';
import 'package:lms_fe/course_detail_page.dart'; // Add this line

class CourseCard extends StatelessWidget {
  final Course course;
  final VoidCallback onTap;

  CourseCard({required this.course, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              course.title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              course.description,
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CourseDetailPage(course: course)),
                );
              },
              child: Text('Course Details'),
            ),
          ],
        ),
      ),
    );
  }
}