class ArtImage {
  final String lqip, alt_text;
  final int width, height;

  ArtImage({
    required this.lqip,
    required this.alt_text,
    required this.width,
    required this.height
  });

  factory ArtImage.fromJson(Map<String, dynamic> thumbnail) {
    return ArtImage(
        lqip: thumbnail['lqip'] ?? '',
        alt_text: thumbnail['alt_text'] ?? '',
        width: thumbnail['width'] ?? 0,
        height: thumbnail['height'] ?? 0
    );
  }
}


class ListItem {
  final int id, artwork_type_id, artist_id;
  final String api_model, api_link, title, description, artwork_type_title, artist_display, artist_title;
  final ArtImage image;

  ListItem({
    required this.id,
    required this.api_model,
    required this.api_link,
    required this.title,
    required this.description,
    required this.artwork_type_id,
    required this.artwork_type_title,
    required this.image,
    required this.artist_display,
    required this.artist_id,
    required this.artist_title
  });

  factory ListItem.fromJson(Map<String, dynamic> json) {
    return ListItem(
        id: json['id'] ?? 0,
        api_model: json['api_model'] ?? '',
        api_link: json['api_link'] ?? '',
        title: json['title'] ?? '',
        description: json['description'] ?? '',
        artwork_type_id: json['artwork_type_id'] ?? 0,
        artwork_type_title: json['artwork_type_title'] ?? '',
        image: ArtImage.fromJson(json['thumbnail']),
        artist_display: json['artist_display'] ?? '',
        artist_id: json['artist_id'] ?? 0,
        artist_title: json['artist_title'] ?? ''
    );
  }
}