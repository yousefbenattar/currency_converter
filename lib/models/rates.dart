import 'dart:convert';

RatesModle ratesModelFromJson(String str) => RatesModle.fromJson(json.decode(str));

String ratesModelToJson(RatesModle data) => json.encode(data.toJson());

class RatesModle {
RatesModle({
  required this.disclaimer,
  required this.license,
  required this.timestamp,
  required this.base,
  required this.rates,

});
String disclaimer ;
String license ;
int timestamp ;
String base ;
Map<String,double> rates;

factory RatesModle.fromJson(Map<String,dynamic>json)=> RatesModle(
disclaimer : json["disclaimer"],
license : json["license"],
timestamp : json["timestamp"],
base : json["base"],
rates : Map.from(json["rates"]).map((k, v) => MapEntry<String ,double>(k,v.toDouble())),
);

Map<String,dynamic> toJson() =>
{
'disclaimer' : disclaimer,
'license' : license,
'timestamp' : timestamp,
'base' : base,
'rates' : Map.from(rates).map((k,v)=> MapEntry<String ,dynamic>(k,v)
),
};




}