class Results {
  final List<PostData> hits;

  const Results({required this.hits});

  factory Results.fromJson(Map<String, dynamic> json) {
    final List<dynamic> hits = json['hits'];
    final List<PostData> postDataList =
        hits.map((dynamic json) => PostData.fromJson(json)).toList();
    return Results(hits: postDataList);
  }
}

class PostData {
  final String id;
  final String title;
  final int points;
  final String? url;

  const PostData(
      {required this.id,
      required this.title,
      required this.points,
      required this.url});

  factory PostData.fromJson(Map<String, dynamic> json) {
    return PostData(
        id: json['objectID'],
        title: json['title'],
        points: json['points'],
        url: json['url']);
  }
}
