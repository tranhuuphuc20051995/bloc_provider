import 'dart:convert';

PackagesModel packagesModelFromJson(String str) =>
    PackagesModel.fromJson(json.decode(str));

String packagesModelToJson(PackagesModel data) => json.encode(data.toJson());

class PackagesModel {
  List<String> packages;
  int flag;

  PackagesModel({
    this.packages,
    this.flag,
  });

  factory PackagesModel.fromJson(Map<String, dynamic> json) => PackagesModel(
        packages: json["packages"] == null
            ? null
            : List<String>.from(json["packages"].map((x) => x)),
        flag: json["flag"] == null ? null : json["flag"],
      );

  Map<String, dynamic> toJson() => {
        "packages": packages == null
            ? null
            : List<dynamic>.from(packages.map((x) => x)),
        "flag": flag == null ? null : flag,
      };
}
