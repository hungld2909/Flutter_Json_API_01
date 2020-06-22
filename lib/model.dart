// To parse this JSON data, do
//
//     final nasa = nasaFromJson(jsonString);

import 'dart:convert';

Nasa nasaFromJson(String str) => Nasa.fromJson(json.decode(str));

String nasaToJson(Nasa data) => json.encode(data.toJson());

class Nasa {
    Nasa({
        this.apodSite,
        this.copyright,
        this.date,
        this.description,
        this.hdurl,
        this.imageThumbnail,
        this.mediaType,
        this.title,
        this.url,
    });

    String apodSite;
    String copyright;
    DateTime date;
    String description;
    String hdurl;
    String imageThumbnail;
    String mediaType;
    String title;
    String url;

    factory Nasa.fromJson(Map<String, dynamic> json) => Nasa(
        apodSite: json["apod_site"],
        copyright: json["copyright"],
        date: DateTime.parse(json["date"]),
        description: json["description"],
        hdurl: json["hdurl"],
        imageThumbnail: json["image_thumbnail"],
        mediaType: json["media_type"],
        title: json["title"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "apod_site": apodSite,
        "copyright": copyright,
        "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "description": description,
        "hdurl": hdurl,
        "image_thumbnail": imageThumbnail,
        "media_type": mediaType,
        "title": title,
        "url": url,
    };
}
