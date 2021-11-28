import 'dart:convert';

List<HomepageModel> homepageModelFromJson(String str) =>
    List<HomepageModel>.from(
        json.decode(str).map((x) => HomepageModel.fromJson(x)));

String homepageModelToJson(List<HomepageModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HomepageModel {
  HomepageModel({
    this.id,
    this.name,
    this.tag,
    this.color,
    this.criteria,
  });

  int id;
  String name;
  String tag;
  String color;
  List<Criterion> criteria;

  factory HomepageModel.fromJson(Map<String, dynamic> json) => HomepageModel(
        id: json["id"],
        name: json["name"],
        tag: json["tag"],
        color: json["color"],
        criteria: List<Criterion>.from(
            json["criteria"].map((x) => Criterion.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "tag": tag,
        "color": color,
        "criteria": List<dynamic>.from(criteria.map((x) => x.toJson())),
      };
}

class Criterion {
  Criterion({
    this.type,
    this.text,
    this.variable,
  });

  String type;
  String text;
  Map<String, dynamic> variable;

  factory Criterion.fromJson(Map<String, dynamic> json) => Criterion(
        type: json["type"],
        text: json["text"],
        variable: json["variable"] == null ? null : json["variable"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "text": text,
      };
}

class Variable {
  List<double> values;
  String type;
  String studyType;
  String parameterName;
  int minValue;
  int maxValue;
  int defaultValue;

  Variable({
    this.type,
    this.values,
    this.studyType,
    this.parameterName,
    this.minValue,
    this.maxValue,
    this.defaultValue,
  });
  factory Variable.fromJson(Map<String, dynamic> json) => Variable(
        type: json["type"],
        values: json["values"] == null
            ? null
            : List<double>.from(json["values"].map((x) => double.parse(x))),
        studyType: json["study_type"] == null ? null : json["study_type"],
        parameterName:
            json["parameter_name"] != null ? json["parameter_name"] : null,
        minValue: json["min_value"] != null ? json["min_value"] : null,
        maxValue: json["max_value"] != null ? json["max_value"] : null,
        defaultValue:
            json["default_value"] != null ? json["default_value"] : null,
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "values":
            values == null ? null : List<dynamic>.from(values.map((x) => x)),
        "study_type": studyType == null ? null : studyType,
        "parameter_name": parameterName == null ? null : parameterName,
        "min_value": minValue == null ? null : minValue,
        "max_value": maxValue == null ? null : maxValue,
        "default_value": defaultValue == null ? null : defaultValue,
      };
}

class TextHelper {
  String text;
  bool isLink;
  Map<String, dynamic> values;

  TextHelper({
    this.text,
    this.isLink = false,
    this.values,
  });
}
