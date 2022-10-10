import 'package:flutter/material.dart';

import 'package:deyd_kata_flutter/search_component.dart';
import 'package:deyd_kata_flutter/vehicle_list.dart';

class ParentProvider extends InheritedWidget {
  final List<Ville> selectedLocations;
  final Widget child;

  const ParentProvider(this.selectedLocations, this.child, {super.key})
      : super(child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }

  static ParentProvider of(BuildContext context) {
    final ParentProvider? result =
        context.dependOnInheritedWidgetOfExactType<ParentProvider>();
    assert(result != null, 'No FrogColor found in context');
    return result!;
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController textController = TextEditingController();
  List<Ville> selectedLocations = [];

  final List<int> colorCodes = <int>[600, 500, 100];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: const [
          SeachComponent(),
          VehicleList(),
        ],
      ),
    );
  }
}
