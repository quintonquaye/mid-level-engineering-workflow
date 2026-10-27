class Course {
  const Course({
    required this.id,
    required this.title,
    required this.isPublished,
    this.priceInCents = 0,
  });

  final String id;
  final String title;
  final bool isPublished;
  final int priceInCents;

  Course copyWith({
    String? id,
    String? title,
    bool? isPublished,
    int? priceInCents,
  }) {
    return Course(
      id: id ?? this.id,
      title: title ?? this.title,
      isPublished: isPublished ?? this.isPublished,
      priceInCents: priceInCents ?? this.priceInCents,
    );
  }

  @override
  String toString() =>
      'Course(id: $id, title: $title, isPublished: $isPublished, '
      'priceInCents: $priceInCents)';
}
