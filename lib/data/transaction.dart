import 'dart:convert';

class Transaction {
  final String id;
  final int time;
  final String description;
  final int mcc;
  final int originalMcc;
  final bool hold;
  final int amount;
  final int operationAmount;
  final int currencyCode;
  final int commissionRate;
  final int cashbackAmount;
  final int balance;
  final String comment;
  final String receiptId;
  final String invoiceId;
  final String counterEdrpou;
  final String counterIban;
  final String counterName;
  Transaction({
    required this.id,
    required this.time,
    required this.description,
    required this.mcc,
    required this.originalMcc,
    required this.hold,
    required this.amount,
    required this.operationAmount,
    required this.currencyCode,
    required this.commissionRate,
    required this.cashbackAmount,
    required this.balance,
    required this.comment,
    required this.receiptId,
    required this.invoiceId,
    required this.counterEdrpou,
    required this.counterIban,
    required this.counterName,
  });

  Transaction copyWith({
    String? id,
    int? time,
    String? description,
    int? mcc,
    int? originalMcc,
    bool? hold,
    int? amount,
    int? operationAmount,
    int? currencyCode,
    int? commissionRate,
    int? cashbackAmount,
    int? balance,
    String? comment,
    String? receiptId,
    String? invoiceId,
    String? counterEdrpou,
    String? counterIban,
    String? counterName,
  }) {
    return Transaction(
      id: id ?? this.id,
      time: time ?? this.time,
      description: description ?? this.description,
      mcc: mcc ?? this.mcc,
      originalMcc: originalMcc ?? this.originalMcc,
      hold: hold ?? this.hold,
      amount: amount ?? this.amount,
      operationAmount: operationAmount ?? this.operationAmount,
      currencyCode: currencyCode ?? this.currencyCode,
      commissionRate: commissionRate ?? this.commissionRate,
      cashbackAmount: cashbackAmount ?? this.cashbackAmount,
      balance: balance ?? this.balance,
      comment: comment ?? this.comment,
      receiptId: receiptId ?? this.receiptId,
      invoiceId: invoiceId ?? this.invoiceId,
      counterEdrpou: counterEdrpou ?? this.counterEdrpou,
      counterIban: counterIban ?? this.counterIban,
      counterName: counterName ?? this.counterName,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'time': time,
      'description': description,
      'mcc': mcc,
      'originalMcc': originalMcc,
      'hold': hold,
      'amount': amount,
      'operationAmount': operationAmount,
      'currencyCode': currencyCode,
      'commissionRate': commissionRate,
      'cashbackAmount': cashbackAmount,
      'balance': balance,
      'comment': comment,
      'receiptId': receiptId,
      'invoiceId': invoiceId,
      'counterEdrpou': counterEdrpou,
      'counterIban': counterIban,
      'counterName': counterName,
    };
  }

  factory Transaction.fromMap(Map<String, dynamic> map) {
    return Transaction(
      id: map['id'] as String,
      time: map['time'].toInt() as int,
      description: map['description'] as String,
      mcc: map['mcc'].toInt() as int,
      originalMcc: map['originalMcc'].toInt() as int,
      hold: map['hold'] as bool,
      amount: map['amount'].toInt() as int,
      operationAmount: map['operationAmount'].toInt() as int,
      currencyCode: map['currencyCode'].toInt() as int,
      commissionRate: map['commissionRate'].toInt() as int,
      cashbackAmount: map['cashbackAmount'].toInt() as int,
      balance: map['balance'].toInt() as int,
      comment: map['comment'] as String,
      receiptId: map['receiptId'] as String,
      invoiceId: map['invoiceId'] as String,
      counterEdrpou: map['counterEdrpou'] as String,
      counterIban: map['counterIban'] as String,
      counterName: map['counterName'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Transaction.fromJson(String source) => Transaction.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Transaction(id: $id, time: $time, description: $description, mcc: $mcc, originalMcc: $originalMcc, hold: $hold, amount: $amount, operationAmount: $operationAmount, currencyCode: $currencyCode, commissionRate: $commissionRate, cashbackAmount: $cashbackAmount, balance: $balance, comment: $comment, receiptId: $receiptId, invoiceId: $invoiceId, counterEdrpou: $counterEdrpou, counterIban: $counterIban, counterName: $counterName)';
  }

  @override
  bool operator ==(covariant Transaction other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.time == time &&
      other.description == description &&
      other.mcc == mcc &&
      other.originalMcc == originalMcc &&
      other.hold == hold &&
      other.amount == amount &&
      other.operationAmount == operationAmount &&
      other.currencyCode == currencyCode &&
      other.commissionRate == commissionRate &&
      other.cashbackAmount == cashbackAmount &&
      other.balance == balance &&
      other.comment == comment &&
      other.receiptId == receiptId &&
      other.invoiceId == invoiceId &&
      other.counterEdrpou == counterEdrpou &&
      other.counterIban == counterIban &&
      other.counterName == counterName;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      time.hashCode ^
      description.hashCode ^
      mcc.hashCode ^
      originalMcc.hashCode ^
      hold.hashCode ^
      amount.hashCode ^
      operationAmount.hashCode ^
      currencyCode.hashCode ^
      commissionRate.hashCode ^
      cashbackAmount.hashCode ^
      balance.hashCode ^
      comment.hashCode ^
      receiptId.hashCode ^
      invoiceId.hashCode ^
      counterEdrpou.hashCode ^
      counterIban.hashCode ^
      counterName.hashCode;
  }
}