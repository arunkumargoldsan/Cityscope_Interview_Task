import 'dart:convert';
import 'package:cityscape_interview_task/util/constants.dart';
import 'package:flutter/material.dart';
import '../model/art_type.model.dart';
import 'package:http/http.dart' as http;

class ArtTypeList extends ChangeNotifier {
  List<ArtType> _items = [];
  bool _isLoading = false;
  bool _hasError = false;

  List<ArtType> get items => _items;
  bool get isLoading => _isLoading;
  bool get hasError => _hasError;

  Future<List<ArtType>> fetchArtTypeListItems() async {
    _isLoading = true;
    _hasError = false;
    final response = await http.get(Uri.parse(Constants().artworkTypesList_URL));
    if(response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> artTypeData = data['data'];
      _items = artTypeData.map((e) => ArtType.fromJson(e)).toList();
      _isLoading = false;
    } else {
      _hasError = true;
      throw Exception("Failed to load Art Types List");
    }
    notifyListeners();
    return _items;
  }

}
