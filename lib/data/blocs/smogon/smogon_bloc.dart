import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dex/data/poke_api/apiwrapper/poke_api.dart';
import 'package:flutter_dex/data/poke_api/pokemon.dart';
import 'package:flutter_dex/data/smogon/smogon.dart';
import './bloc.dart';

class SmogonBloc extends Bloc<SmogonEvent, SmogonState> {
  @override
  SmogonState get initialState => InitialSmogonState();

  @override
  Stream<SmogonState> mapEventToState(
    SmogonEvent event,
  ) async* {
    if (event is SearchSmogon) {
      yield* _mapSearchSmogon(event);
    }
    if (event is ResetSmogon) {
      yield* _mapResetState();
    }
  }

  Stream<SmogonState> _mapSearchSmogon(SearchSmogon event) async* {
    yield SmogonSearching();

    final pokemon = event.alias;
    final gen = event.gen;
    final language = event.lang;

    final body = {"gen": gen, "alias": pokemon, "language": language};

    Response smogResponse = await Dio()
        .post("https://www.smogon.com/dex/_rpc/dump-pokemon", data: body);
    Pokemon apiResponse = await PokeAPI().getPokemon(pokemon: pokemon.toLowerCase());
    // Response apiResponse =
    //     await Dio().get('https://pokeapi.co/api/v2/pokemon/${pokemon}');

    if (smogResponse.data != null && apiResponse != null) {
      final smogResult = Smogon.fromJson(smogResponse.data);
      yield SmogonLoaded(smogResult, apiResponse);
    } else {
      yield SmogonFailed('Pokemon lookup Failed');
    }
  }

  Stream<SmogonState> _mapResetState() async* {
    yield InitialSmogonState();
  }
}
