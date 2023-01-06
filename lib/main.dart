import 'package:deyd_kata_flutter/filter_vehicle_notifier.dart';
import 'package:deyd_kata_flutter/vehicule_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future main() async {
  await dotenv.load(fileName: ".env");

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => FilterVehicleNotfier())
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: true ? const VehiculeData() : const RootPage(),
    );
  }
}

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomePage(),
    );
  }
}
