import 'package:flutter/foundation.dart';

import 'package:deyd_kata_flutter/search_component.dart';

class FilterVehicleNotfier with ChangeNotifier {
  List<Ville> _select_locations = [];

  List<Ville> get selectedLocations => _select_locations;

  updateSelectedVille(List<Ville> selectedVille) {
    _select_locations = selectedVille;
    notifyListeners();
  }
}
