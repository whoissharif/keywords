import 'package:flutter/material.dart';
import 'package:programming_keyword/constants.dart';
import 'package:programming_keyword/models.dart';

class KeywordsPage extends StatelessWidget {
  final Model model;
  final Color appBarColor;
  final String appBarTitle;
  final int langIndex;

  KeywordsPage({
    this.model,
    this.langIndex,
    this.appBarColor,
    this.appBarTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          appBarTitle,
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 1,
            fontSize: 25,
          ),
        ),
        backgroundColor: appBarColor,
      ),
      body: ListView.separated(
        padding: EdgeInsets.all(10),
        separatorBuilder: (context, index) => Divider(
          height: 10,
          color: Colors.grey,
          thickness: 1,
        ),
        itemCount: model.root[langIndex].details.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              "${model.root[langIndex].details[index].keyword}",
              style: kKeywordTitleTextStyle,
            ),
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Container(
                      padding: EdgeInsets.all(20),
                      child: SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            Text(
                              "${model.root[langIndex].details[index].keyword}",
                              style: kKewordOnBottomSheetTextStyle,
                            ),
                            SizedBox(height: 25),
                            Center(
                              child: Text(
                                "${model.root[langIndex].details[index].description}",
                                style: kDescriptionOnBottomSheetTextStyle,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  });
            },
          );
        },
      ),
    );
  }
}
