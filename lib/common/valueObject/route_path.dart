import 'package:equatable/equatable.dart';

class RoutePath extends Equatable {
  final String path;

  const RoutePath(this.path);

  @override
  List<Object?> get props => [path];
}

const RoutePath homeRoute = RoutePath('/');
const RoutePath settingRoute = RoutePath('/setting');