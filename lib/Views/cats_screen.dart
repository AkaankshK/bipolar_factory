import '../Models/card_model.dart';
import '../Services/retrieve_cats.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paginator/flutter_paginator.dart';

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Paginator.gridView(
        pageLoadFuture: CatCollection.getData,
        pageItemsGetter: getItems,
        listItemBuilder: buildItem,
        loadingWidgetBuilder: loadingWidgetMaker,
        errorWidgetBuilder: errorWidgetMaker,
        emptyListWidgetBuilder: emptyListMaker,
        totalItemsGetter: getTotalItems,
        pageErrorChecker: pageErrorCheck,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: .5));
  }

  List<dynamic> getItems(var data) {
    return data;
  }

  Widget buildItem(itemData, int index) {
    //print(index);
    return CardModel(
      url: itemData.url,
      title: itemData.title,
    );
  }

  Widget loadingWidgetMaker() {
    return Container(
      alignment: Alignment.center,
      child: LinearProgressIndicator(),
    );
  }

  Widget errorWidgetMaker(pageData, retryListener) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            "All Caught Up! :)\nDemo Request Quota for the hour is Finished. Please Check Back Later.",
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  Widget emptyListMaker(pageData) {
    return Center(
      child: Text('No Data'),
    );
  }

  int getTotalItems(pageData) {
    return 1000;
  }

  bool pageErrorCheck(pageData) {
    if (pageData == "Error") {
      return true;
    }
    return false;
  }
}
