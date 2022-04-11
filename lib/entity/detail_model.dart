class DetailModel {
  TvShow? tvShow;

  DetailModel({this.tvShow});

  DetailModel.fromJson(Map<String, dynamic> json) {
    tvShow = json['tvShow'] != null ? TvShow.fromJson(json['tvShow']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    return data;
  }
}

class TvShow {
  int? id;
  String? name;
  String? permalink;
  String? url;
  String? description;

  String? startDate;

  String? country;
  String? status;
  int? runtime;
  String? network;

  String? imagePath;
  String? imageThumbnailPath;
  String? rating;
  String? ratingCount;

  List<String>? genres;
  List<String>? pictures;
  List<Episodes>? episodes;

  TvShow(
      {this.id,
      this.name,
      this.permalink,
      this.url,
      this.description,
      this.startDate,
      this.country,
      this.status,
      this.runtime,
      this.network,
      this.imagePath,
      this.imageThumbnailPath,
      this.rating,
      this.ratingCount,
      this.genres,
      this.pictures,
      this.episodes});

  TvShow.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    permalink = json['permalink'];
    url = json['url'];
    description = json['description'];

    startDate = json['start_date'];

    country = json['country'];
    status = json['status'];
    runtime = json['runtime'];
    network = json['network'];

    imagePath = json['image_path'];
    imageThumbnailPath = json['image_thumbnail_path'];
    rating = json['rating'];
    ratingCount = json['rating_count'];

    genres = json['genres'].cast<String>();
    pictures = json['pictures'].cast<String>();
    if (json['episodes'] != null) {
      episodes = <Episodes>[];
      json['episodes'].forEach((v) {
        episodes!.add(Episodes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['permalink'] = permalink;
    data['url'] = url;
    data['description'] = description;

    data['start_date'] = startDate;

    data['country'] = country;
    data['status'] = status;
    data['runtime'] = runtime;
    data['network'] = network;

    data['image_path'] = imagePath;
    data['image_thumbnail_path'] = imageThumbnailPath;
    data['rating'] = rating;
    data['rating_count'] = ratingCount;

    data['genres'] = genres;
    data['pictures'] = pictures;

    return data;
  }
}

class Episodes {
  int? season;
  int? episode;
  String? name;
  String? airDate;

  Episodes({this.season, this.episode, this.name, this.airDate});

  Episodes.fromJson(Map<String, dynamic> json) {
    season = json['season'];
    episode = json['episode'];
    name = json['name'];
    airDate = json['air_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['season'] = season;
    data['episode'] = episode;
    data['name'] = name;
    data['air_date'] = airDate;
    return data;
  }
}
