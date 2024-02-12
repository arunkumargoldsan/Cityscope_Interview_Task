import 'dart:convert';
import 'package:cityscape_interview_task/model/art_type.model.dart';
import 'package:cityscape_interview_task/viewmodel/art_type_list.viewmodel.dart';
import 'package:cityscape_interview_task/viewmodel/list.viewmodel.dart';
import 'package:cityscape_interview_task/widgets/category_list.widget.dart';
import 'package:cityscape_interview_task/widgets/shimmer_loading_category_list.widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/shimmer_loading_list.widget.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return ListPageState();
  }
}

class ListPageState extends State<ListPage> {
  final TextEditingController _searchCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ListViewModel(),
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            title: const Center(child: Text('Artworks', style: TextStyle(color: Colors.black))),
          ),
          body: ListView(children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: _searchCtrl,
                decoration: InputDecoration(
                  labelText: 'Search',
                  hintText: 'Search',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onChanged: (value) {},
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            SizedBox(
              height: 50,
              child: FutureBuilder<List<ArtType>>(
                  future: ArtTypeList().fetchArtTypeListItems(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return shimmerLoadingCategoryList();
                    } else if (snapshot.hasError) {
                      return const Center(child: Text("Error Occurred"),);
                    } else {
                      return ListView.builder(
                        padding: const EdgeInsets.only(left: 10.0),
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data?.length,
                        itemBuilder: (context, index) {
                          return categoryList(snapshot.data![index]);
                        },
                      );
                    }
                  }
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            FutureBuilder<List<dynamic>>(
                future: ListViewModel().fetchListItems(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return shimmerLoadingList();
                  } else if (snapshot.hasError) {
                    return const Center(child: Text("Error Occurred"),);
                  } else {
                    return GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 8.0,
                            mainAxisSpacing: 8.0),
                        itemCount: snapshot.data?.length,
                        itemBuilder: (context, index) {
                          final item = snapshot.data![index];
                          final bytes =
                          base64Decode(item.image.lqip.split(',').last);
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
                        });
                  }
                }),
          ]),
        ));
  }
}

