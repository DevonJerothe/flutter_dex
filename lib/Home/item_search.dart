import 'package:flutter/material.dart';

class ItemSearch extends StatefulWidget {
  @override
  _ItemSearchState createState() => _ItemSearchState();
}

class _ItemSearchState extends State<ItemSearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Items'),
      ),
      body: Center(
        child: Container(
          child: Text('In Development'),
        ),
      ),
    );
  }
}
