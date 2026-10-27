import 'package:mid_level_github_practice/data/course_api.dart';
import 'package:mid_level_github_practice/models/course.dart';
import 'package:test/test.dart';

void main() {
  group('CourseApi', () {
    test('fetchCourses returns the seeded courses', () async {
      const course = Course(
        id: 'exposure-101',
        title: 'Understanding Exposure',
        isPublished: true,
      );
      final api = CourseApi(seedCourses: [course]);

      final result = await api.fetchCourses();

      expect(result, [course]);
    });

    test('createCourse adds a new course', () async {
      final api = CourseApi();
      const course = Course(
        id: 'close-up-101',
        title: 'Close-Up Photography',
        isPublished: false,
      );

      final result = await api.createCourse(course);

      expect(result, course);
      expect(await api.fetchCourses(), [course]);
    });
  });
}
