import 'package:cityscape_interview_task/util/constants.dart';
import 'package:http/http.dart' as http;

class APIService {
  Future<void> fetchListOfArtworksData() async {
    final response = await http.get(Uri.parse(Constants().artworkList_URL));

  }
}