import 'dart:convert';
import 'dart:core';
Map<String ,String> allCurrenciesFromJson(String str) => Map.from(json.decode(str)).map((k,v) => MapEntry<String, String>(k,v));