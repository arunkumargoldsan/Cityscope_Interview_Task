class ArtType {
  final int id;
  final String title, api_link;

  ArtType({
    required this.id,
    required this.title,
    required this.api_link
  });

  factory ArtType.fromJson(Map<String, dynamic> data) {
    return ArtType(
        id: data['id'] ?? 0,
        title: data['title'] ?? '',
        api_link: data['api_link'] ?? ''
    );
  }
}
