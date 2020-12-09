import 'package:flutter/material.dart';
import 'package:programming_keyword/constants.dart';
import 'package:programming_keyword/models.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:programming_keyword/pages/keywords_page.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List gridColor = [
    Colors.black26,
    Colors.deepOrange,
    Colors.deepPurple,
    Colors.green,
    Colors.teal,
    Colors.pinkAccent,
    Colors.lightBlue,
    Colors.blueGrey,
  ];
  Model model = Model();

  Future<String> loadDataFromAssets() async {
    return await rootBundle.loadString('assets/keyword.json');
  }

  Future loadModel() async {
    String jsonString = await loadDataFromAssets();
    final jsonResponse = await json.decode(jsonString);
    model = Model.fromJson(jsonResponse);
    //return model;
    // print('${model.root[0].language}');
    //print('${model.root.length}');
  }

  // @override
  // void initState() {
  //   super.initState();
  //   loadModel();
  // }

  Widget pro() {
    return FutureBuilder(builder: (context, proSnap) {
      if (proSnap.connectionState == ConnectionState.none &&
          proSnap.hasData == null) {
        return Container();
      }
      return GridView.builder(
        itemCount: model.root.length, // > 0 ? model.root.length : 0,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          return GestureDetector(
            child: Card(
              color: gridColor[index],
              child: Center(
                child: Text(
                  model.root[index].language,
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            onTap: () {
              print('Item $index');
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => KeywordsPage(
                    model: model,
                    langIndex: index,
                    appBarTitle: model.root[index].language,
                    appBarColor: gridColor[index],
                  ),
                ),
              );
            },
          );
        },
      );
    },
    future: loadModel(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          'Programming Keyword',
          style: kAppBarTextStyle,
        ),
      ),
      body: pro(),
    );
  }
}
