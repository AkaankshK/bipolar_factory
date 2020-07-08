import 'package:flutter/material.dart';

class CardModel extends StatelessWidget {
  final String url;
  final String title;
  CardModel({this.url, this.title});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Expanded(
            flex: 9,
            child: Material(
              elevation: 15,
              borderRadius: BorderRadius.circular(10),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: NetworkImage(url), fit: BoxFit.cover)),
              ),
            ),
          ),
          Expanded(
              flex: 1,
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    title ?? "Title Not Available in API",
                    style: TextStyle(
                      color: Colors.grey[700],
                    ),
                  )))
        ],
      ),
    );
  }
}
