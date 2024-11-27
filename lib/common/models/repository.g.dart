// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repository.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Repository _$RepositoryFromJson(Map<String, dynamic> json) => Repository(
      name: json['name'] as String,
      ownerName: json['owner']['login'] as String,
      htmlUrl: json['html_url'] as String,
    );

Map<String, dynamic> _$RepositoryToJson(Repository instance) =>
    <String, dynamic>{
      'name': instance.name,
      'ownerName': instance.ownerName,
      'htmlUrl': instance.htmlUrl,
    };
