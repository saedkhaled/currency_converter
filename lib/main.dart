import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'modules/currency_converter/converter_service.dart';
import 'my_app.dart';

GetIt getIt = GetIt.instance;

void main() async{
  await dotenv.load(fileName: ".env");
  getIt.registerLazySingleton<Client>(() => Client());
  getIt.registerLazySingleton<ConverterService>(() => ConverterService());
  runApp(const MyApp());
}
