import 'package:flutter/material.dart';
import 'package:football_master/navigation/navigation.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'navigation/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('id_ID', null); // Initialize Indonesian locale
  var initialRoute = await Routes.initialRoute;
  runApp(MyApp(initialRoute));
}

class MyApp extends StatelessWidget {
  final String initialRoute;

  MyApp(this.initialRoute);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: initialRoute,
      getPages: Nav.routes,
    );
  }
}
