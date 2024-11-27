import 'package:json_annotation/json_annotation.dart';

part 'repository.g.dart';

@JsonSerializable()
class Repository {
  final String name; //レポジトリの名前
  final String? ownerName; //作者の名前
  final String htmlUrl; //レポジトリのリンク

  Repository({
    required this.name,
    this.ownerName,
    required this.htmlUrl,
  });

  factory Repository.fromJson(Map<String, dynamic> json) => _$RepositoryFromJson(json);
  Map<String, dynamic> toJson() => _$RepositoryToJson(this);
}
