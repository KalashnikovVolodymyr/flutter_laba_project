import 'dart:convert';

class Jar {
  final String id;
  final String sendId;
  final String title;
  final String description;
  final int currencyCode;
  final int balance;
  final int goal;
  Jar({
    required this.id,
    required this.sendId,
    required this.title,
    required this.description,
    required this.currencyCode,
    required this.balance,
    required this.goal,
  });

  Jar copyWith({
    String? id,
    String? sendId,
    String? title,
    String? description,
    int? currencyCode,
    int? balance,
    int? goal,
  }) {
    return Jar(
      id: id ?? this.id,
      sendId: sendId ?? this.sendId,
      title: title ?? this.title,
      description: description ?? this.description,
      currencyCode: currencyCode ?? this.currencyCode,
      balance: balance ?? this.balance,
      goal: goal ?? this.goal,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'sendId': sendId,
      'title': title,
      'description': description,
      'currencyCode': currencyCode,
      'balance': balance,
      'goal': goal,
    };
  }

  factory Jar.fromMap(Map<String, dynamic> map) {
    return Jar(
      id: map['id'] as String,
      sendId: map['sendId'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
      currencyCode: map['currencyCode'].toInt() as int,
      balance: map['balance'].toInt() as int,
      goal: map['goal'].toInt() as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Jar.fromJson(String source) => Jar.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Jar(id: $id, sendId: $sendId, title: $title, description: $description, currencyCode: $currencyCode, balance: $balance, goal: $goal)';
  }

  @override
  bool operator ==(covariant Jar other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.sendId == sendId &&
      other.title == title &&
      other.description == description &&
      other.currencyCode == currencyCode &&
      other.balance == balance &&
      other.goal == goal;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      sendId.hashCode ^
      title.hashCode ^
      description.hashCode ^
      currencyCode.hashCode ^
      balance.hashCode ^
      goal.hashCode;
  }
}