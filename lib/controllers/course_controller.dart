import '../models/course.dart';
import '../repositories/course_repository.dart';

class CourseController {
  CourseController(this._repository);

  final CourseRepository _repository;

  List<Course> courses = [];
  bool isLoading = false;
  String? errorMessage;

  Future<void> loadCourses({bool publishedOnly = false}) async {
    isLoading = true;

    try {
      // Practice defect: a previous error is not cleared after a later success.
      courses = await _repository.getCourses(publishedOnly: publishedOnly);
    } catch (error) {
      errorMessage = error.toString();
    } finally {
      isLoading = false;
    }
  }

  Future<bool> addCourse(Course course) async {
    errorMessage = null;
    try {
      final created = await _repository.createCourse(course);
      courses = [...courses, created];
      return true;
    } catch (error) {
      errorMessage = error.toString();
      return false;
    }
  }
}
