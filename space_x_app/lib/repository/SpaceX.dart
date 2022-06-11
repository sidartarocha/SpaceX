// To parse this JSON data, do
//
//     final spaceXService = spaceXServiceFromJson(jsonString);
/*
import 'dart:convert';

import 'package:http/http.dart';

List<SpaceXServiceApi> spaceXServiceFromJson(String str) => List<SpaceXServiceApi>.from(json.decode(str).map((x) => SpaceXServiceApi.fromJson(x)));

String spaceXServiceToJson(List<SpaceXServiceApi> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SpaceXServiceApi {
  SpaceXServiceApi({
    required this.flightNumber,
    required this.missionName,
    required this.upcoming,
    required this.launchYear,
    required this.launch_success,
    required this.details,
    this.crew,
  });

  int flightNumber;
  String missionName;
  bool upcoming;
  String launchYear;
  bool launch_success;
  String details;
  dynamic crew;

  factory SpaceXServiceApi.fromJson(Map<String, dynamic> json) => SpaceXServiceApi(
    flightNumber: json["flight_number"],
    missionName: json["mission_name"],
    upcoming: json["upcoming"],
    launchYear: json["launch_year"],
    launch_success: json["launch_year"],
    details: json["details"],
    crew: json["crew"],
  );

  Map<String, dynamic> toJson() => {
    "flight_number": flightNumber,
    "mission_name": missionName,
    "upcoming": upcoming,
    "launch_year": launchYear,
    "launch_success": launch_success,
    "details":details,
    "crew": crew,
  };
}
*/
// To parse this JSON data, do
//
//     final spaceXService = spaceXServiceFromJson(jsonString);

import 'dart:convert';

import 'package:http/http.dart';

List<SpaceXServiceApi> spaceXServiceFromJson(String str) => List<SpaceXServiceApi>.from(json.decode(str).map((x) => SpaceXServiceApi.fromJson(x)));

String spaceXServiceToJson(List<SpaceXServiceApi> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SpaceXServiceApi {
  SpaceXServiceApi({
    required this.flightNumber,
    required this.missionName,
    required this.launchYear,
    required this.launchDateUnix,
    required this.launchDateUtc,
    required this.launchDateLocal,
    required this.staticFireDateUtc,
    required this.launchSuccess,
    required this.details,
    required this.links,
  });

  int flightNumber;
  String missionName;
  String launchYear;
  int launchDateUnix;
  DateTime launchDateUtc;
  DateTime launchDateLocal;
  DateTime staticFireDateUtc;
  bool launchSuccess;
  String details;
  Links links;

  factory SpaceXServiceApi.fromJson(Map<String, dynamic> json) => SpaceXServiceApi(
    flightNumber: json["flight_number"],
    missionName: json["mission_name"],
    launchYear: json["launch_year"],
    launchDateUnix: json["launch_date_unix"],
    launchDateUtc: DateTime.parse(json["launch_date_utc"]),
    launchDateLocal: DateTime.parse(json["launch_date_local"]),
    staticFireDateUtc: DateTime.parse(json["static_fire_date_utc"]),
    launchSuccess: json["launch_success"],
    details: json["details"],
    links: Links.fromJson(json["links"]),
  );

  Map<String, dynamic> toJson() => {
    "flight_number": flightNumber,
    "mission_name": missionName,
    "launch_year": launchYear,
    "launch_date_unix": launchDateUnix,
    "launch_date_utc": launchDateUtc.toIso8601String(),
    "launch_date_local": launchDateLocal.toIso8601String(),
    "static_fire_date_utc": staticFireDateUtc.toIso8601String(),
    "launch_success": launchSuccess,
    "details": details,
    "links": links.toJson(),
  };
}

class Links {
  Links({
    required this.missionPatch,
    required this.missionPatchSmall,
    this.redditCampaign,
    this.redditLaunch,
    this.redditRecovery,
    this.redditMedia,
    this.presskit,
    required this.articleLink,
    required this.wikipedia,
    required this.videoLink,
    required this.youtubeId,
    required this.flickrImages,
  });

  String missionPatch;
  String missionPatchSmall;
  dynamic redditCampaign;
  dynamic redditLaunch;
  dynamic redditRecovery;
  dynamic redditMedia;
  dynamic presskit;
  String articleLink;
  String wikipedia;
  String videoLink;
  String youtubeId;
  List<dynamic> flickrImages;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
    missionPatch: json["mission_patch"],
    missionPatchSmall: json["mission_patch_small"],
    redditCampaign: json["reddit_campaign"],
    redditLaunch: json["reddit_launch"],
    redditRecovery: json["reddit_recovery"],
    redditMedia: json["reddit_media"],
    presskit: json["presskit"],
    articleLink: json["article_link"],
    wikipedia: json["wikipedia"],
    videoLink: json["video_link"],
    youtubeId: json["youtube_id"],
    flickrImages: List<dynamic>.from(json["flickr_images"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "mission_patch": missionPatch,
    "mission_patch_small": missionPatchSmall,
    "reddit_campaign": redditCampaign,
    "reddit_launch": redditLaunch,
    "reddit_recovery": redditRecovery,
    "reddit_media": redditMedia,
    "presskit": presskit,
    "article_link": articleLink,
    "wikipedia": wikipedia,
    "video_link": videoLink,
    "youtube_id": youtubeId,
    "flickr_images": List<dynamic>.from(flickrImages.map((x) => x)),
  };
}


class SpaceXSeviceApi {
  /* Future<List<SpaceXService>> getListSpaceActivity() async {
    final response = await get(Uri.parse('https://api.spacexdata.com/v3/launches'));
    final activity = spaceXServiceFromJson(response.body);
    return activity;
  }*/
  Future<List<SpaceXServiceApi>> getFlySpaceActivity() async {
    final response = await get(
        Uri.parse('https://api.spacexdata.com/v3/launches?flight_number=1'));
    List<SpaceXServiceApi> listActivity;
    if (response.statusCode != 200) {
      return listActivity = List<SpaceXServiceApi>.empty();
    } else {
      listActivity = spaceXServiceFromJson(response.body);
      return listActivity;
    }
  }


  Future<List<SpaceXServiceApi>> getListFlySpaceActivity() async {
    final response = await get(
        Uri.parse('https://api.spacexdata.com/v3/launches?launch_year=2018'));
    List<SpaceXServiceApi> listActivity;
    if (response.statusCode != 200) {
      return listActivity = List<SpaceXServiceApi>.empty();
    } else {
      listActivity = spaceXServiceFromJson(response.body);
      return listActivity;
    }
  }
}
