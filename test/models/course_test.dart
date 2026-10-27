import 'package:mid_level_github_practice/models/course.dart';
import 'package:test/test.dart';

void main() {
  group('Course', () {
    test('copyWith preserves fields that are not replaced', () {
      const original = Course(
        id: 'exposure-101',
        title: 'Understanding Exposure',
        isPublished: true,
        priceInCents: 2500,
      );

      final updated = original.copyWith(title: 'Exposure Basics');

      expect(updated.id, original.id);
      expect(updated.title, 'Exposure Basics');
      expect(updated.isPublished, original.isPublished);
      expect(updated.priceInCents, original.priceInCents);
    });
  });
}
