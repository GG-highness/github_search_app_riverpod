import 'package:freezed_annotation/freezed_annotation.dart';

part 'repository.freezed.dart';

@freezed
class Repository with _$Repository {
  const factory Repository({
    required String name, // レポジトリの名前
    required Owner owner, // 作者の情報
    required String htmlUrl, // レポジトリのリンク
  }) = _Repository;

  factory Repository.fromJson(Map<String, dynamic> json) => _$RepositoryFromJson(json);
}

@JsonSerializable()
@freezed
class Owner with _$Owner {
  const factory Owner({
    required String login, // 作者の名前
  }) = _Owner;

  factory Owner.fromJson(Map<String, dynamic> json) => _$OwnerFromJson(json);
}
