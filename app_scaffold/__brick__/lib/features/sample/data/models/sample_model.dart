import 'package:{{project_name.snakeCase()}}/features/sample/domain/entities/sample_entity.dart';

class SampleModel extends SampleEntity {
  const SampleModel({
    required super.id,
    required super.title,
    required super.description,
  });

  factory SampleModel.fromJson(Map<String, dynamic> json) {
    return SampleModel(
      id: json['id'] as int? ?? 0,
      title: json['title']?.toString() ?? '',
      description: json['description']?.toString() ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
    };
  }
}
