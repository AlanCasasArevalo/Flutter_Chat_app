// To parse this JSON data, do
//
//     final historyChatResponse = historyChatResponseFromJson(jsonString);

import 'dart:convert';

HistoryChatResponse historyChatResponseFromJson(String str) => HistoryChatResponse.fromJson(json.decode(str));

String historyChatResponseToJson(HistoryChatResponse data) => json.encode(data.toJson());

class HistoryChatResponse {
  HistoryChatResponse({
    this.result,
    this.messages,
  });

  bool result;
  List<Message> messages;

  factory HistoryChatResponse.fromJson(Map<String, dynamic> json) => HistoryChatResponse(
    result: json["result"],
    messages: List<Message>.from(json["messages"].map((x) => Message.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "result": result,
    "messages": List<dynamic>.from(messages.map((x) => x.toJson())),
  };
}

class Message {
  Message({
    this.from,
    this.to,
    this.message,
    this.createdAt,
    this.updatedAt,
  });

  String from;
  String to;
  String message;
  DateTime createdAt;
  DateTime updatedAt;

  factory Message.fromJson(Map<String, dynamic> json) => Message(
    from: json["from"],
    to: json["to"],
    message: json["message"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "from": from,
    "to": to,
    "message": message,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
  };
}
