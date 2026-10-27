import 'package:mid_level_github_practice/controllers/course_controller.dart';
import 'package:mid_level_github_practice/data/course_api.dart';
import 'package:mid_level_github_practice/models/course.dart';
import 'package:mid_level_github_practice/repositories/course_repository.dart';
import 'package:test/test.dart';

void main() {
  group('CourseController', () {
    test('loadCourses stores courses and clears loading state', () async {
      const course = Course(
        id: 'exposure-101',
        title: 'Understanding Exposure',
        isPublished: true,
      );
      final controller = CourseController(
        CourseRepository(CourseApi(seedCourses: [course])),
      );

      await controller.loadCourses();

      expect(controller.courses, [course]);
      expect(controller.isLoading, isFalse);
      expect(controller.errorMessage, isNull);
    });

    test('addCourse returns true and appends a successfully created course',
        () async {
      final controller = CourseController(
        CourseRepository(CourseApi()),
      );
      const course = Course(
        id: 'close-up-101',
        title: 'Close-Up Photography',
        isPublished: false,
      );

      final result = await controller.addCourse(course);

      expect(result, isTrue);
      expect(controller.courses, [course]);
      expect(controller.errorMessage, isNull);
    });
  });
}
