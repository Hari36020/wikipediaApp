// To parse this JSON data, do
//
//     final listViewModel = listViewModelFromJson(jsonString);

import 'dart:convert';

ListViewModel listViewModelFromJson(String str) => ListViewModel.fromJson(json.decode(str));

String listViewModelToJson(ListViewModel data) => json.encode(data.toJson());

class ListViewModel {
  ListViewModel({
    this.pageid,
    this.ns,
    this.title,
    this.thumbnail,
    this.pageimage,
    this.terms,
  });

  int pageid;
  int ns;
  String title;
  Map thumbnail;
  String pageimage;
  Map terms;

  factory ListViewModel.fromJson(Map<String, dynamic> json) => ListViewModel(
    pageid: json["pageid"],
    ns: json["ns"],
    title: json["title"],
    thumbnail: json["thumbnail"],
    pageimage: json["pageimage"],
    terms: json["terms"],
  );

  Map<String, dynamic> toJson() => {
    "pageid": pageid,
    "ns": ns,
    "title": title,
    "thumbnail": thumbnail,
    "pageimage": pageimage,
    "terms": terms,
  };
}
//
// class Terms {
//   Terms({
//     this.alias,
//     this.label,
//     this.description,
//   });
//
//   List<String> alias;
//   List<String> label;
//   List<String> description;
//
//   factory Terms.fromJson(Map<String, dynamic> json) => Terms(
//     alias: List<String>.from(json["alias"].map((x) => x)),
//     label: List<String>.from(json["label"].map((x) => x)),
//     description: List<String>.from(json["description"].map((x) => x)),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "alias": List<dynamic>.from(alias.map((x) => x)),
//     "label": List<dynamic>.from(label.map((x) => x)),
//     "description": List<dynamic>.from(description.map((x) => x)),
//   };
// }

// class Thumbnail {
//   Thumbnail({
//     this.source,
//     this.width,
//     this.height,
//   });
//
//   String source;
//   int width;
//   int height;
//
//   factory Thumbnail.fromJson(Map<String, dynamic> json) => Thumbnail(
//     source: json["source"],
//     width: json["width"],
//     height: json["height"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "source": source,
//     "width": width,
//     "height": height,
//   };
// }
