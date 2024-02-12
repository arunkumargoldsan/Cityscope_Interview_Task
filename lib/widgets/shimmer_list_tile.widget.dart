import 'package:flutter/material.dart';

Widget shimmerListTile() {
  return Container(
    color: Colors.white,
    child: Card(
      elevation: 0,
      margin: const EdgeInsets.all(0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: Container(
            color: Colors.grey,
          )),
          Padding(padding: const EdgeInsets.symmetric(
            horizontal: 8.0,
            vertical: 4.0
          ),
          child: Container(
            height: 16.0,
            color: Colors.grey,
          ),),
        ],
      ),
    ),
  );
}
