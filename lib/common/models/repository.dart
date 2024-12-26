import 'package:freezed_annotation/freezed_annotation.dart';

part 'repository.freezed.dart';
part 'repository.g.dart';

@freezed
class Repository with _$Repository {
  const factory Repository({
    required String name, // レポジトリの名前
    required Owner owner, // 作者の情報
    @JsonKey(name: 'html_url') required String htmlUrl, // レポジトリのリンク
  }) = _Repository;

  factory Repository.fromJson(Map<String, dynamic> json) =>
      _$RepositoryFromJson(json);
}

@freezed
class Owner with _$Owner {
  const factory Owner({
    required String login, // 作者の名前
  }) = _Owner;

  factory Owner.fromJson(Map<String, dynamic> json) => _$OwnerFromJson(json);
}
