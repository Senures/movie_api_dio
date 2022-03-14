class Model {
  String? total;
  int? page;
  int? pages;
  List<dynamic>? tvShows;

  Model({this.total, this.page, this.pages, this.tvShows});

  Model.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    page = json['page'];
    pages = json['pages'];
    tvShows = json["tv_shows"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total'] = total;
    data['page'] = page;
    data['pages'] = pages;
    data["tv_shows"] = tvShows;

    return data;
  }
}

class TvShows {
  int? id;
  String? name;
  String? permalink;
  String? startDate;

  String? country;
  String? network;
  String? status;
  String? imageThumbnailPath;

  TvShows(
      {this.id,
      this.name,
      this.permalink,
      this.startDate,
      this.country,
      this.network,
      this.status,
      this.imageThumbnailPath});

  TvShows.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    permalink = json['permalink'];
    startDate = json['start_date'];

    country = json['country'];
    network = json['network'];
    status = json['status'];
    imageThumbnailPath = json['image_thumbnail_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['permalink'] = permalink;
    data['start_date'] = startDate;

    data['country'] = country;
    data['network'] = network;
    data['status'] = status;
    data['image_thumbnail_path'] = imageThumbnailPath;
    return data;
  }
}
