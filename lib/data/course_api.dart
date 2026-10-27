import '../models/course.dart';

/// An in-memory stand-in for a remote API.
///
/// This class intentionally has a small surface area so tickets can focus on
/// behavior, tests, and repository boundaries without requiring network access.
class CourseApi {
  CourseApi({
    List<Course> seedCourses = const [],
    this.shouldFailFetch = false,
    this.shouldFailCreate = false,
  }) : _courses = List<Course>.of(seedCourses);

  final List<Course> _courses;
  bool shouldFailFetch;
  bool shouldFailCreate;

  Future<List<Course>> fetchCourses() async {
    if (shouldFailFetch) {
      throw Exception('Course API fetch failed');
    }
    return List<Course>.unmodifiable(_courses);
  }

  Future<Course> createCourse(Course course) async {
    if (shouldFailCreate) {
      throw Exception('Course API create failed');
    }
    if (_courses.any((existing) => existing.id == course.id)) {
      throw StateError('Course ID already exists: ${course.id}');
    }
    _courses.add(course);
    return course;
  }
}
