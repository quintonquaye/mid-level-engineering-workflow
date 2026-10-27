import 'package:mid_level_github_practice/data/course_api.dart';
import 'package:mid_level_github_practice/models/course.dart';
import 'package:mid_level_github_practice/repositories/course_repository.dart';
import 'package:test/test.dart';

void main() {
  group('CourseRepository', () {
    test('returns all courses by default', () async {
      const published = Course(
        id: 'published',
        title: 'Published course',
        isPublished: true,
      );
      const draft = Course(
        id: 'draft',
        title: 'Draft course',
        isPublished: false,
      );
      final repository = CourseRepository(
        CourseApi(seedCourses: [published, draft]),
      );

      final result = await repository.getCourses();

      expect(result, [published, draft]);
    });

    test('publishedOnly returns only published courses', () async {
      const published = Course(
        id: 'published',
        title: 'Published course',
        isPublished: true,
      );
      const draft = Course(
        id: 'draft',
        title: 'Draft course',
        isPublished: false,
      );
      final repository = CourseRepository(
        CourseApi(seedCourses: [published, draft]),
      );

      final result = await repository.getCourses(publishedOnly: true);

      expect(result, [published]);
    });
  });
}
