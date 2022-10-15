import 'package:flutter/foundation.dart';

import 'package:deyd_kata_flutter/search_component.dart';

class FilterVehicleNotfier with ChangeNotifier {
  List<Ville> selectLocations = [];
  DateTime bookingStartDate = DateTime.now();
  DateTime bookingEndDate = DateTime.now().add(const Duration(days: 3));
  List<Ville> get selectedLocations => selectLocations;

  updateSelectedVille(List<Ville> selectedVille) {
    selectLocations = selectedVille;
    notifyListeners();
  }

  updateBookingDates(DateTime startDate, DateTime endDate) {
    bookingStartDate = startDate;
    bookingEndDate = endDate;
    notifyListeners();
  }
}
