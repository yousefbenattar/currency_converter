import 'package:flutter_application_1/models/allCurrencies.dart';
import 'package:http/http.dart' as http;
import '../models/rates.dart';

Future <RatesModle> fetchrates() async{
  final response = await http.get(Uri.parse('https://openexchangerates.org/api/latest.json?app_id=3b4d4e4c2f27464faded17f0893cce72'));
  // print(response.body);
  final result = ratesModelFromJson(response.body);
  return result ;
}


Future <Map> fetchcurrencies() async {
final response = await http.get(Uri.parse('https://openexchangerates.org/api/currencies.json?prettyprint=3b4d4e4c2f27464faded17f0893cce72'));
final allCurrencies = allCurrenciesFromJson(response.body);
return allCurrencies ;
}