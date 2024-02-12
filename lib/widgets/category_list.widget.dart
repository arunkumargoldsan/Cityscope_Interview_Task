import 'package:cityscape_interview_task/model/art_type.model.dart';
import 'package:flutter/material.dart';

Widget categoryList(ArtType data) {
  return GestureDetector(
    onTap: () {

    },
    child: Container(
      width: 120,
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: Colors.black)
      ),
      child: Center(
        child: Text(data.title, style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 13.0,
        ),
        ),
      ),
    ),
  );
}