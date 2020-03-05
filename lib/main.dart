import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dex/Home/item_search.dart';
import 'package:flutter_dex/Home/pokemon_search.dart';
import 'package:flutter_dex/data/blocs/smogon/smogon_bloc.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider<SmogonBloc>(create: (_) => SmogonBloc())],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.red, primaryColor: Colors.red),
        home: MyHomePage(title: 'Flutter Dex'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>{
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {

    final screens = [MainSearchScreen(), ItemSearch()];
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        onTap: (val){
          setState(() {
            currentPage = val;
          });
        },
        items: [
          BottomNavigationBarItem(
            title: Text('Pokemon'),
            icon: Icon(Icons.search),
          ),
          BottomNavigationBarItem(
            title: Text('Items'),
            icon: Icon(Icons.shopping_cart)
          )
        ],
      ),
      body: screens[currentPage],
    );
  }
}
