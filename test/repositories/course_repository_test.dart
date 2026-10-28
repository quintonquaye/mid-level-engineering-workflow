import 'package:mid_level_github_practice/controllers/course_controller.dart';
import 'package:mid_level_github_practice/data/course_api.dart';
import 'package:mid_level_github_practice/models/course.dart';
import 'package:mid_level_github_practice/repositories/course_repository.dart';
import 'package:test/test.dart';

void main() {
   //setup abstract variables for the courseController and courseAPI
  
  late CourseRepository courseRepository;
  late CourseApi courseApi;
  late CourseController courseController;

  //initialize abstrations
  setUp((){
    courseApi = CourseApi();
    courseRepository = CourseRepository(courseApi);
    courseController = CourseController(courseRepository);
  }); 

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
     test("Verify that invalid input is rejected with the documented error type", () async {
      ///Arrange: Initialize courseAPI and courseRepository
      ///Act: Create Course object with invalid id(Empty id)
      const course = Course(
        id: '',
        title: 'Close-Up Photography',
        isPublished: true,
      );

      ///Assert: my assumption is that when i call the future `repository.createCourse()` with a empty `course.id` the validation will catch the error and return a ArgumentError
      ///So I will create a future variable of `courseRepository.createCourse()` and wrap the call in a `await expectLater()`. 
      var future = courseRepository.createCourse(course);
      await expectLater(future, throwsA(isArgumentError));

      ///My second assumption is that if creating the course with an empty invalid course.id, that it will fail to create a course.
      ///Arrange: initialize new variables:
      courseApi = CourseApi();
      courseRepository = CourseRepository(courseApi);
      courseController = CourseController(courseRepository);
      
      const secondCourse = Course(
        id: '',
        title: 'Close-Up Photography',
        isPublished: true,
      );

      await courseController.addCourse(course); //<- returns false, no class is added to controller courses list
      //get course list
      await courseController.loadCourses();
      var courseList = courseController.courses;
      expect(courseList.length, equals(0));
    });
}
