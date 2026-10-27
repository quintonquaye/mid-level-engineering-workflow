import '../data/course_api.dart';
import '../models/course.dart';

class CourseRepository {
  CourseRepository(this._api);

  final CourseApi _api;

  Future<List<Course>> getCourses({bool publishedOnly = false}) async {
    final courses = await _api.fetchCourses();
    if (!publishedOnly) {
      return courses;
    }
    return courses.where((course) => course.isPublished).toList();
  }

  Future<Course> createCourse(Course course) async {
    final id = course.id.trim();
    final title = course.title.trim();

    // Practice defect: whitespace-only IDs pass this check before trimming.
    if (course.id.isEmpty) {
      throw ArgumentError.value(course.id, 'id', 'Course ID cannot be blank');
    }
    if (title.isEmpty) {
      throw ArgumentError.value(
        course.title,
        'title',
        'Course title cannot be blank',
      );
    }
    if (course.priceInCents < 0) {
      throw ArgumentError.value(
        course.priceInCents,
        'priceInCents',
        'Price cannot be negative',
      );
    }

    final normalized = course.copyWith(id: id, title: title);
    return _api.createCourse(normalized);
  }
}
