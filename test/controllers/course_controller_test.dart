import 'package:mid_level_github_practice/controllers/course_controller.dart';
import 'package:mid_level_github_practice/data/course_api.dart';
import 'package:mid_level_github_practice/models/course.dart';
import 'package:mid_level_github_practice/repositories/course_repository.dart';
import 'package:test/test.dart';

void main() {
  //setup abstract variables for the courseController and courseAPI
  late CourseController courseController;
  late CourseRepository courseRepository;
  late CourseApi courseApi;

  //initialize abstrations
  setUp((){
    courseApi = CourseApi();
    courseRepository = CourseRepository(courseApi);
    courseController = CourseController(courseRepository);
  }); 

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

    //test for an empty ID and ID containing only spaces
    test("test for an empty ID and ID containing only spaces", () async {
      ///Arrange: initialize courseAPI + courseController + courseRepository
      
      ///Act: we will need to setup a course model with an empty id
      const course = Course(
        id: '',
        title: 'Close-Up Photography',
        isPublished: true,
      );

      /// call controller.addCourse()
      ///Assert: due to an empty id, the course_repository will throw an ArgumentError
      /// That will then be caught by the course_controller, which then will return a false value
      var futureCourse = await courseController.addCourse(course);
      expect(futureCourse, isFalse);
      

      ///Act we will need to setup a course model with an empty id of only spaces
      const courseWithSpaceOnly = Course(
        id: ' ',
        title: 'Close-Up Photography',
        isPublished: true,
      );

      /// call controller.addCourse()
      var futureCourse2 = await courseController.addCourse(courseWithSpaceOnly);
      //call getCourses
      await courseController.loadCourses();
      var futureCourseList = courseController.courses;
      

      ///Assert: I believe with the extra space the course_repository will not pick up the error, because a space is not considered empty.
      ///we will pull the courses list to verify there is a single course added.
  
      expect(futureCourseList.length, equals(1));
      expect(futureCourseList.first.id, equals('')); //<- is an empty value, but does not Throw in Repository

      //look for false response on courseController.addCourse
      expect(futureCourse2, isTrue);
    });
    test("Includes atleast one additional whitespace case, such as tab or newline", () async{
       ///Arrange: re-initialize the course controller, repo and api
      courseApi = CourseApi();
      courseRepository = CourseRepository(courseApi);
      courseController = CourseController(courseRepository);
      
      const courseWithTabbedSpace = Course(
        id: '\t',
        title: 'Close-Up Photography',
        isPublished: true,
      );

      ///Act: call `controller.addCourse()`
      await courseController.addCourse(courseWithTabbedSpace);

      ///Assert: I believe tab is also not empty space and will pass the validation
      ///set value of futureCourseList = controller.courses
      var futureCourseList = courseController.courses;
      expect(futureCourseList.length, equals(1));
      expect(futureCourseList.first.id, isEmpty);

      ///Arrange: re-initialize the course controller, repo and api
      courseApi = CourseApi();
      courseRepository = CourseRepository(courseApi);
      courseController = CourseController(courseRepository);

      ///create another course model with id as a new-line space
      const courseWithNewLineSpace = Course(
        id: '\n',
        title: 'Close-Up Photography',
        isPublished: true,
      );

      ///Act: call  `controller.addCourse()`
      await courseController.addCourse(courseWithNewLineSpace);

      //Assert: I believe a new-line also is not an empty input and will pass validation
      var futureCourseLisWithNewLine = courseController.courses;
      expect(futureCourseLisWithNewLine.length, equals(1)); 
      expect(futureCourseLisWithNewLine.first.id, isEmpty);
    });

    test("Verify that a valid ID can still be created", () async {
      ///Arrange: initialize course API, Controller, Repository
      ///Act: create a course model with valid course model data
      const normalCourse = Course(
        id: 'PHO_101',
        title: 'Close-Up Photography',
        isPublished: true,
        priceInCents: 500
      );
      ///call courseController.addCourse()
      await courseController.addCourse(normalCourse);

      ///Assert: my assertion is that the valid course can be created and stored in the courses list
      ///will check by getting the list of published courses and check the count is = to 1.
      await courseController.loadCourses();
      var publishedCourses = courseController.courses;
      expect(publishedCourses.length, equals(1));
      //Check the course ID, title
      expect(publishedCourses.first.id, equals("PHO_101"));
      expect(publishedCourses.first.title, equals("Close-Up Photography"));
    });
  });
}
