// lib/services/student_enrollment.dart
import 'package:flutter/foundation.dart';
import 'package:lms_fe/course_model.dart';

// lib/services/student_enrollment.dart
class StudentEnrollment with ChangeNotifier {
  final List<Course> _enrolledCourses = [];

  Future<List<Course>> getEnrolledCourses() async {
    // Simulate API call
    await Future.delayed(const Duration(milliseconds: 500));
    return _enrolledCourses;
  }

  Future<void> enrollStudent({
    required Course course,
    required String studentEmail,
  }) async {
    try {
      await Future.delayed(const Duration(seconds: 1)); // Simulate network call
      _enrolledCourses.add(course);
      notifyListeners();
    } catch (e) {
      throw Exception('Failed to enroll: $e');
    }
  }
}