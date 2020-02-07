import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html_view/flutter_html_view.dart';
import 'package:flutter_rounded_progress_bar/flutter_rounded_progress_bar.dart';
import 'package:flutter_rounded_progress_bar/rounded_progress_bar_style.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import '../data/blocs/smogon/bloc.dart';
import '../data/db/pokemon_list.dart';
import '../data/poke_api/pokemon.dart';
import '../data/smogon/smogon.dart';

class MainSearchScreen extends StatefulWidget {
  @override
  _MainSearchScreenState createState() => _MainSearchScreenState();
}

class _MainSearchScreenState extends State<MainSearchScreen> {
  final _textController = TextEditingController();
  Smogon smogonResult;
  Pokemon apiResult;

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Dex'),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(6),
              decoration: BoxDecoration(
                  border: Border.all(color: Theme.of(context).primaryColor)),
              child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: TypeAheadField(
                    hideOnEmpty: true,
                    hideOnError: true,
                    hideSuggestionsOnKeyboardHide: true,
                    textFieldConfiguration: TextFieldConfiguration(
                      onEditingComplete: () async {
                        FocusScope.of(context).requestFocus(FocusNode());
                        if (_textController.text.isNotEmpty) {
                          BlocProvider.of<SmogonBloc>(context).add(SearchSmogon(
                              alias: _textController.text.toLowerCase(),
                              lang: 'en',
                              gen: 'xy'));
                        }
                      },
                      controller: _textController,
                      autocorrect: false,
                      autofocus: false,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        suffixIcon: GestureDetector(
                          child: Icon(Icons.clear),
                          onTap: () {
                            BlocProvider.of<SmogonBloc>(context)
                                .add(ResetSmogon());
                            _textController.clear();
                          },
                        ),
                        hintText: 'Search Pokemon',
                      ),
                    ),
                    suggestionsCallback: (pattern) {
                      return PokeDB.getMons(pattern);
                    },
                    itemBuilder: (context, suggestion) {
                      if (_textController.text.isNotEmpty) {
                        return ListTile(
                          leading: Image.asset(
                              'lib/assets/img/sprites/${suggestion['ID']}.png'),
                          title: Text(suggestion['name']),
                        );
                      }
                      //return null;
                    },
                    onSuggestionSelected:
                        (Map<String, String> suggestion) async {
                      _textController.text = suggestion['name'];
                      BlocProvider.of<SmogonBloc>(context).add(SearchSmogon(
                          alias: _textController.text.toLowerCase(),
                          lang: 'en',
                          gen: 'xy'));
                    },
                  )),
            ),
            Expanded(
              child: Container(
                child: BlocBuilder<SmogonBloc, SmogonState>(
                  builder: (context, state) {
                    if (state is SmogonFailed) {
                      final error = state.data;
                      return Center(child: Text(error));
                    }
                    if (state is SmogonSearching) {
                      return Container(
                        child: Center(child: CircularProgressIndicator()),
                      );
                    } else if (state is SmogonLoaded) {
                      final smogonResult = state.smogData;
                      final apiResult = state.apiData;
                      return SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.all(6),
                              height: 230,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  border: Border.all(
                                    color: Colors.red,
                                  ),
                                  borderRadius: BorderRadius.circular(15)),
                              child: Padding(
                                padding: const EdgeInsets.all(24.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    //Expanded(child: Container()),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          //Container(),
                                          Expanded(
                                            child: Image.network(
                                                'https://www.smogon.com/dex/media/sprites/xy/${_textController.text.toLowerCase()}.gif'),
                                          ),
                                          Text(apiResult.name,
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ))
                                        ],
                                      ),
                                    ),
                                    //Expanded(child: Container()),
                                    Container(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: <Widget>[
                                          buildBar(apiResult, 5, 'HP'),
                                          buildBar(apiResult, 4, 'ATK'),
                                          buildBar(apiResult, 3, 'DEF'),
                                          buildBar(apiResult, 2, 'SPA'),
                                          buildBar(apiResult, 1, 'SPD'),
                                          buildBar(apiResult, 0, 'SPE'),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    Text('Type',
                                        style: TextStyle(
                                            decoration:
                                                TextDecoration.underline)),
                                    Container(
                                      padding: EdgeInsets.all(6),
                                      child: Row(
                                          children: buildType(apiResult.types)),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Text('Tier',
                                        style: TextStyle(
                                            decoration:
                                                TextDecoration.underline)),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                          smogonResult.strategies[0].format ??
                                              'N/A',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600)),
                                    )
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Text('Abilities',
                                        style: TextStyle(
                                            decoration:
                                                TextDecoration.underline)),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Builder(builder: (_) {
                                        //String abilities = '';
                                        var abilities = [];
                                        for (var i in apiResult.abilities) {
                                          abilities.add(i.ability.name);
                                          //abilities += '${i.ability.name}';
                                        }
                                        return Text(
                                            abilities.toString().substring(
                                                1,
                                                abilities.toString().length -
                                                    1),
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600));
                                      }),
                                    )
                                  ],
                                )
                              ],
                            ),
                            Text('Strategies',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20)),
                            Container(
                              padding: EdgeInsets.all(6),
                              margin: EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                border: Border.all(
                                  color: Colors.red,
                                ),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Column(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Text(
                                      'Move Set',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          decoration: TextDecoration.underline),
                                    ),
                                  ),
                                  Builder(
                                    builder: (_) {
                                      final moves = smogonResult
                                          .strategies[0].movesets[0].moveslots;
                                      List<Widget> movesList = [];
                                      for (var move in moves) {
                                        movesList.add(Text(move[0]));
                                      }
                                      return Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: movesList,
                                      );
                                    },
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Divider(),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Text(
                                      'EV config',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          decoration: TextDecoration.underline),
                                    ),
                                  ),
                                  Container(
                                    // padding: EdgeInsets.only(top: 10),
                                    child: Builder(builder: (_) {
                                      final evs = smogonResult.strategies[0]
                                          .movesets[0].evconfigs[0];
                                      List<Widget> evList = [];
                                      if (evs.atk > 0) {
                                        evList.add(Text('atk: ${evs.atk}'));
                                      }
                                      if (evs.def > 0) {
                                        evList.add(Text('def: ${evs.def}'));
                                      }
                                      if (evs.hp > 0) {
                                        evList.add(Text('hp: ${evs.hp}'));
                                      }
                                      if (evs.spa > 0) {
                                        evList.add(Text('spa: ${evs.spa}'));
                                      }
                                      if (evs.spd > 0) {
                                        evList.add(Text('spd: ${evs.spd}'));
                                      }
                                      if (evs.spe > 0) {
                                        evList.add(Text('spe: ${evs.spe}'));
                                      }
                                      return Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: evList,
                                      );
                                    }),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Divider(),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Text(
                                      'Items / Ability / Nature',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          decoration: TextDecoration.underline),
                                    ),
                                  ),
                                  Builder(
                                    builder: (_) {
                                      final items = smogonResult
                                          .strategies[0].movesets[0].items;
                                      final abilities = smogonResult
                                          .strategies[0].movesets[0].abilities;
                                      final natures = smogonResult
                                          .strategies[0].movesets[0].natures;
                                      List<Widget> itemList = [];
                                      String itemString = '';
                                      String abilityList = '';
                                      String natureList = '';
                                      for (var item in items) {
                                        if (itemString.isEmpty) {
                                          itemString = item;
                                        } else {
                                          itemString += '/$item';
                                        }
                                      }
                                      for (var ability in abilities) {
                                        if (abilityList.isEmpty) {
                                          abilityList = ability;
                                        } else {
                                          abilityList += '/$ability';
                                        }
                                      }
                                      for (var nature in natures) {
                                        if (natureList.isEmpty) {
                                          natureList = nature;
                                        } else {
                                          natureList += '/$nature';
                                        }
                                      }
                                      itemList.add(Text(itemString));
                                      itemList.add(Text(abilityList));
                                      itemList.add(Text(natureList));
                                      return Container(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: itemList,
                                        ),
                                      );
                                    },
                                  )
                                ],
                              ),
                            ),
                            ExpansionTile(
                              title: Text('strategy overview'),
                              subtitle: Text('author: ${smogonResult.strategies[0].credits.writtenBy[0].username}'),
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(10),
                                  child: HtmlView(
                                      data: smogonResult.strategies[0].comments,
                                      scrollable: false),
                                ),
                              ],
                            ),
                            ExpansionTile(
                              title: Text('${apiResult.name} overview'),
                              subtitle: Text('author: ${smogonResult.strategies[0].credits.writtenBy[0].username}'),
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(10),
                                  child: HtmlView(
                                      data: smogonResult.strategies[0].overview,
                                      scrollable: false),
                                )
                              ],
                            ),
                            // Padding(
                            //   padding: const EdgeInsets.all(8.0),
                            //   child: Text(
                            //     'Overview',
                            //     style: TextStyle(
                            //         decoration: TextDecoration.underline),
                            //   ),
                            // ),
                            // Container(
                            //     //height: 100,
                            //     margin: EdgeInsets.all(10),
                            //     child: HtmlView(
                            //         data: smogonResult.strategies[0].overview,
                            //         scrollable: false))
                          ],
                        ),
                      );
                    }
                    return Container();
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  List<Widget> buildType(List<Type> types) {
    List<Widget> typeList = [];
    for (var item in types) {
      final type = item.type.name;
      typeList.add(Container(
        width: 60,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: _getColor(type), borderRadius: BorderRadius.circular(16)),
        child: Center(
            child: Text(type,
                style: TextStyle(color: Colors.white, fontSize: 12))),
      ));
    }
    return typeList;
  }

  Color _getColor(String type) {
    switch (type) {
      case 'bug':
        return Color(0xffa8b820);
      case 'dark':
        return Color(0xff705848);
      case 'dragon':
        return Color(0xff7038f8);
      case 'electric':
        return Color(0xfff8d030);
      case 'fairy':
        return Color(0xfff98cff);
      case 'fighting':
        return Color(0xffc03028);
      case 'fire':
        return Color(0xfff08030);
      case 'flying':
        return Color(0xffa890f0);
      case 'ghost':
        return Color(0xff705898);
      case 'grass':
        return Color(0xff78c850);
      case 'ground':
        return Color(0xffe0c068);
      case 'ice':
        return Color(0xff98d8d8);
      case 'normal':
        return Color(0xffa8a878);
      case 'poison':
        return Color(0xffa040a0);
      case 'psychic':
        return Color(0xfff85888);
      case 'rock':
        return Color(0xffb8a038);
      case 'steel':
        return Color(0xffb8b8d0);
      case 'water':
        return Color(0xff6890f0);
    }
  }

  Expanded buildBar(Pokemon apiResult, int i, String stat) {
    return Expanded(
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              '${stat}: ',
              textAlign: TextAlign.left,
            ),
            Text(apiResult.stats[i].baseStat.toString()),
            Container(
              padding: EdgeInsets.all(10),
              width: 130,
              child: RoundedProgressBar(
                  style: RoundedProgressBarStyle(
                    colorProgressDark: Color(Colors.grey[300].value),
                    colorProgress: apiResult.stats[i].baseStat > 115
                        ? Color(0xFF26eb5a)
                        : (apiResult.stats[i].baseStat > 100)
                            ? Color(0xFFbdeb26)
                            : (apiResult.stats[i].baseStat > 75)
                                ? Color(0xFFebc026)
                                : (apiResult.stats[i].baseStat > 50)
                                    ? Color(0xFFf06a1d)
                                    : Color(0xFFf22f1d),
                    borderWidth: 0,
                    widthShadow: 0,
                  ),
                  height: 10,
                  percent: (apiResult.stats[i].baseStat / 200) * 100),
            )
          ],
        ),
      ),
    );
  }
}
