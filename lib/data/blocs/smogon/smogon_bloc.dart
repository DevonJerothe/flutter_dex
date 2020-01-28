import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dex/data/poke_api/poke_api.dart';
import 'package:flutter_dex/data/smogon/smogon.dart';
import './bloc.dart';

class SmogonBloc extends Bloc<SmogonEvent, SmogonState> {
  @override
  SmogonState get initialState => InitialSmogonState();

  @override
  Stream<SmogonState> mapEventToState(
    SmogonEvent event,
  ) async* {
    if(event is SearchSmogon){
      yield* _mapSearchSmogon(event);
    }
    if(event is ResetSmogon){
      yield* _mapResetState();
    }
  }

  Stream<SmogonState> _mapSearchSmogon(SearchSmogon event) async* {
    yield SmogonSearching();

    final pokemon = event.alias;
    final gen = event.gen;
    final language = event.lang;

    final body = {"gen":gen,"alias":pokemon,"language":language};

    Response smogResponse = await Dio().post("https://www.smogon.com/dex/_rpc/dump-pokemon", data: body);
    Response apiResponse = await Dio().get('https://pokeapi.co/api/v2/pokemon/${pokemon}');

    if(smogResponse.data != null && apiResponse.data != null){
      final smogResult = Smogon.fromJson(smogResponse.data);
      final apiResult = PokeApi.fromJson(apiResponse.data);
      yield SmogonLoaded(smogResult, apiResult);
    }else{
      yield SmogonFailed('Pokemon lookup Failed');
    }
  }

  Stream<SmogonState> _mapResetState() async* {
    yield InitialSmogonState();
  }
}
