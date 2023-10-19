import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_laba_project/data/accountMonobank.dart';
import 'package:flutter_laba_project/data/bankaMonobank.dart';

class ClientMonobankInfo {
  final String clientId;
  final String name;
  final String webHookUrl;
  final String permissions;
  final List<Account> accounts;
  final List<Jar> jars;
  ClientMonobankInfo({
    required this.clientId,
    required this.name,
    required this.webHookUrl,
    required this.permissions,
    required this.accounts,
    required this.jars,
  });

  ClientMonobankInfo copyWith({
    String? clientId,
    String? name,
    String? webHookUrl,
    String? permissions,
    List<Account>? accounts,
    List<Jar>? jars,
  }) {
    return ClientMonobankInfo(
      clientId: clientId ?? this.clientId,
      name: name ?? this.name,
      webHookUrl: webHookUrl ?? this.webHookUrl,
      permissions: permissions ?? this.permissions,
      accounts: accounts ?? this.accounts,
      jars: jars ?? this.jars,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'clientId': clientId,
      'name': name,
      'webHookUrl': webHookUrl,
      'permissions': permissions,
      'accounts': accounts.map((x) => x.toMap()).toList(),
      'jars': jars.map((x) => x.toMap()).toList(),
    };
  }

  factory ClientMonobankInfo.fromMap(Map<String, dynamic> map) {
    return ClientMonobankInfo(
      clientId: map['clientId'] as String,
      name: map['name'] as String,
      webHookUrl: map['webHookUrl'] as String,
      permissions: map['permissions'] as String,
      accounts: List<Account>.from((map['accounts'] as List<int>).map<Account>((x) => Account.fromMap(x as Map<String,dynamic>),),),
      jars: List<Jar>.from((map['jars'] as List<int>).map<Jar>((x) => Jar.fromMap(x as Map<String,dynamic>),),),
    );
  }

  String toJson() => json.encode(toMap());

  factory ClientMonobankInfo.fromJson(String source) => ClientMonobankInfo.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ClientMonobankInfo(clientId: $clientId, name: $name, webHookUrl: $webHookUrl, permissions: $permissions, accounts: $accounts, jars: $jars)';
  }

  @override
  bool operator ==(covariant ClientMonobankInfo other) {
    if (identical(this, other)) return true;
  
    return 
      other.clientId == clientId &&
      other.name == name &&
      other.webHookUrl == webHookUrl &&
      other.permissions == permissions &&
      listEquals(other.accounts, accounts) &&
      listEquals(other.jars, jars);
  }

  @override
  int get hashCode {
    return clientId.hashCode ^
      name.hashCode ^
      webHookUrl.hashCode ^
      permissions.hashCode ^
      accounts.hashCode ^
      jars.hashCode;
  }
}
