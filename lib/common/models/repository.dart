import 'package:json_annotation/json_annotation.dart';

part 'repository.g.dart';

@JsonSerializable()
class Repository {
  final String name;
  final String? description;
  final String htmlUrl;

  Repository({
    required this.name,
    this.description,
    required this.htmlUrl,
  });

  factory Repository.fromJson(Map<String, dynamic> json) => _$RepositoryFromJson(json);
  Map<String, dynamic> toJson() => _$RepositoryToJson(this);
}
