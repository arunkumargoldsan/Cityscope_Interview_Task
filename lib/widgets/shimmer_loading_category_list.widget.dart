import 'package:cityscape_interview_task/widgets/shimmer_list_tile.widget.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Widget shimmerLoadingCategoryList() {
  return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: ListView(
        padding: const EdgeInsets.all(8.0),
        children: List.generate(10, (index) => shimmerListTile()),
      ));
}