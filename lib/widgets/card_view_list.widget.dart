import 'dart:convert';

import 'package:cityscape_interview_task/model/list_item.model.dart';
import 'package:flutter/material.dart';

Widget cardViewList(ListItem item) {
  final bytes = base64Decode(item.image.lqip.split(',').last);

  return Card(
    elevation: 4.0,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.memory(
                bytes,
                fit: BoxFit.cover,
              ),
              Align(
                alignment: Alignment.topRight,
                child: Chip(
                  label: Text(
                    item.artwork_type_title,
                    style: const TextStyle(
                        color: Colors.white),
                  ),
                  backgroundColor: Colors.black26,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,
            children: [
              Text(
                item.title,
                style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 4.0,
              ),
              Text(
                item.artist_title,
                style: const TextStyle(
                    fontSize: 14.0, color: Colors.grey),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}