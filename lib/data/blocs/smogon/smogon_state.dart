import 'package:flutter_dex/data/poke_api/poke_api.dart';
import 'package:flutter_dex/data/smogon/smogon.dart';
import 'package:meta/meta.dart';

@immutable
abstract class SmogonState {}
  
class InitialSmogonState extends SmogonState {}

class SmogonSearching extends SmogonState {}

class SmogonLoaded extends SmogonState {
  SmogonLoaded(this.smogData, this.apiData);
  final Smogon smogData;
  final PokeApi apiData;
}

class SmogonFailed extends SmogonState {
  SmogonFailed(this.data);
  final String data;
}
