// enrollment_page.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lms_fe/student_enrollment.dart';
import 'package:lms_fe/course_model.dart';
import 'package:lms_fe/my_courses_drawer.dart';
import 'package:lms_fe/main_scaffold.dart';


class EnrollmentPage extends StatefulWidget {
  final Course course;

  const EnrollmentPage({
    Key? key,
    required this.course,
  }) : super(key: key);

  @override
  _EnrollmentPageState createState() => _EnrollmentPageState();
}

class _EnrollmentPageState extends State<EnrollmentPage> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final enrollment = Provider.of<StudentEnrollment>(context);

    return MainScaffold(
      appBar: AppBar(
        title: Text(widget.course.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Course Details',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),
            Text(
              widget.course.description,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 32),
            Center(
              child: _isLoading
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: () async {
                        setState(() {
                          _isLoading = true;
                        });

                        try {
                          await enrollment.enrollStudent(
                            course: widget.course,
                            studentEmail: 'student@example.com',
                          );

                          if (!mounted) return;

                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Successfully enrolled in course'),
                              backgroundColor: Colors.green,
                            ),
                          );

                          Navigator.pop(context);
                        } catch (e) {
                          if (!mounted) return;

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Failed to enroll: $e'),
                              backgroundColor: Colors.red,
                            ),
                          );
                        } finally {
                          if (mounted) {
                            setState(() {
                              _isLoading = false;
                            });
                          }
                        }
                      },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 32.0,
                          vertical: 16.0,
                        ),
                        child: Text(
                          'Enroll in Course',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}