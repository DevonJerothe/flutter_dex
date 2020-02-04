import 'package:flutter_dex/data/poke_api/pokemon.dart';
import 'package:flutter_dex/data/smogon/smogon.dart';
import 'package:meta/meta.dart';

@immutable
abstract class SmogonState {}
  
class InitialSmogonState extends SmogonState {}

class SmogonSearching extends SmogonState {}

class SmogonLoaded extends SmogonState {
  SmogonLoaded(this.smogData, this.apiData);
  final Smogon smogData;
  final Pokemon apiData;
}

class SmogonFailed extends SmogonState {
  SmogonFailed(this.data);
  final String data;
}
