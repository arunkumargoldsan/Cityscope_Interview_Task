import 'dart:convert';

import 'package:cityscape_interview_task/util/constants.dart';
import 'package:flutter/material.dart';
import '../model/list_item.model.dart';
import 'package:http/http.dart' as http;

class ListViewModel extends ChangeNotifier {
  List<ListItem> _items = [];
  bool _isLoading = false;
  bool _hasError = false;

  List<ListItem> get items => _items;
  bool get isLoading => _isLoading;
  bool get hasError => _hasError;

  Future<List<ListItem>> fetchListItems() async {
    _isLoading = true;
    _hasError = false;
    final response = await http.get(Uri.parse(Constants().artworkList_URL));
    if(response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> artworkData = data['data'];
      _items = artworkData.map((e) => ListItem.fromJson(e)).toList();
      _isLoading = false;
    } else {
      _hasError = true;
      throw Exception('Failed to load artworks');
    }
    notifyListeners();
    return  _items;
  }
}