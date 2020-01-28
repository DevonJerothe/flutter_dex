import 'package:meta/meta.dart';

@immutable
abstract class SmogonEvent {}

class SearchSmogon extends SmogonEvent {
  SearchSmogon({
    this.alias,
    this.gen,
    this.lang
  });

  final String alias;
  final String gen;
  final String lang;
}

class ResetSmogon extends SmogonEvent {}
