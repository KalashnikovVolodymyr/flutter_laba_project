import 'dart:convert';
import 'package:flutter/foundation.dart';

class Account {
  final String id;
  final String sendId;
  final int balance;
  final int creditLimit;
  final String type;
  final int currencyCode;
  final String cashbackType;
  final List<String> maskedPan;
  final String iban;
  Account({
    required this.id,
    required this.sendId,
    required this.balance,
    required this.creditLimit,
    required this.type,
    required this.currencyCode,
    required this.cashbackType,
    required this.maskedPan,
    required this.iban,
  });

  Account copyWith({
    String? id,
    String? sendId,
    int? balance,
    int? creditLimit,
    String? type,
    int? currencyCode,
    String? cashbackType,
    List<String>? maskedPan,
    String? iban,
  }) {
    return Account(
      id: id ?? this.id,
      sendId: sendId ?? this.sendId,
      balance: balance ?? this.balance,
      creditLimit: creditLimit ?? this.creditLimit,
      type: type ?? this.type,
      currencyCode: currencyCode ?? this.currencyCode,
      cashbackType: cashbackType ?? this.cashbackType,
      maskedPan: maskedPan ?? this.maskedPan,
      iban: iban ?? this.iban,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'sendId': sendId,
      'balance': balance,
      'creditLimit': creditLimit,
      'type': type,
      'currencyCode': currencyCode,
      'cashbackType': cashbackType,
      'maskedPan': maskedPan,
      'iban': iban,
    };
  }

  factory Account.fromMap(Map<String, dynamic> map) {
    return Account(
      id: map['id'] as String,
      sendId: map['sendId'] as String,
      balance: map['balance'].toInt() as int,
      creditLimit: map['creditLimit'].toInt() as int,
      type: map['type'] as String,
      currencyCode: map['currencyCode'].toInt() as int,
      cashbackType: map['cashbackType'] as String,
      maskedPan: List<String>.from((map['maskedPan'] as List<String>)),
      iban: map['iban'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Account.fromJson(String source) => Account.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Account(id: $id, sendId: $sendId, balance: $balance, creditLimit: $creditLimit, type: $type, currencyCode: $currencyCode, cashbackType: $cashbackType, maskedPan: $maskedPan, iban: $iban)';
  }

  @override
  bool operator ==(covariant Account other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.sendId == sendId &&
      other.balance == balance &&
      other.creditLimit == creditLimit &&
      other.type == type &&
      other.currencyCode == currencyCode &&
      other.cashbackType == cashbackType &&
      listEquals(other.maskedPan, maskedPan) &&
      other.iban == iban;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      sendId.hashCode ^
      balance.hashCode ^
      creditLimit.hashCode ^
      type.hashCode ^
      currencyCode.hashCode ^
      cashbackType.hashCode ^
      maskedPan.hashCode ^
      iban.hashCode;
  }
}
