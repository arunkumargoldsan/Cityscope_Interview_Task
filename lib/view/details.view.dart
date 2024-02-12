
import 'package:cityscape_interview_task/model/list_item.model.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  final ListItem item;

  const DetailsPage({super.key,  required this.item });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(item.title, style: const TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold
            ),),
            const SizedBox(height: 8.0,),
            Text(item.description, style: const TextStyle(fontSize: 16.0),)
          ],
        ),
      ),
    );
  }
}