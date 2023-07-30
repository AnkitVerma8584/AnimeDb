class Anime {
  final String id;
  final String title;
  final List<String> alternativeTitles;
  final int ranking;
  final List<String> genres;
  final int episodes;
  final bool hasEpisode;
  final bool hasRanking;
  final String image;
  final String link;
  final String status;
  final String synopsis;
  final String thumb;
  final String type;

  Anime(
      {required this.id,
      required this.title,
      required this.alternativeTitles,
      required this.ranking,
      required this.genres,
      required this.episodes,
      required this.hasEpisode,
      required this.hasRanking,
      required this.image,
      required this.link,
      required this.status,
      required this.synopsis,
      required this.thumb,
      required this.type});

  factory Anime.fromJson(Map<String, dynamic> json) {
    return Anime(
      id: json['_id'],
      title: json['title'],
      alternativeTitles:
          List.castFrom<dynamic, String>(json['alternativeTitles']),
      ranking: json['ranking'],
      genres: List.castFrom<dynamic, String>(json['genres']),
      episodes: json['episodes'],
      hasEpisode: json['hasEpisode'],
      hasRanking: json['hasRanking'],
      image: json['image'],
      link: json['link'],
      status: json['status'],
      synopsis: json['synopsis'],
      thumb: json['thumb'],
      type: json['type'],
    );
  }
}
