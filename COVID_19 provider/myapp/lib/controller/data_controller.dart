import 'package:flutter/foundation.dart';

class APIData extends ChangeNotifier {
  int asia = 0;
  int asiaRecovered = 0;
  int asiaActive = 0;
  int asiaConfirmed = 0;

  void setAsia(int value) {
    asia = asia + value;
    notifyListeners();
  }

  void setAsiaRecovered(int value) {
    asiaRecovered = asiaRecovered + value;
    notifyListeners();
  }

  void setasiaActive(int value) {
    asiaActive = asiaActive + value;
    notifyListeners();
  }

  void setAsiaConfirmed(int value) {
    asiaConfirmed = asiaConfirmed + value;
    notifyListeners();
  }

  int northAmerica = 0;
  int northAmericaRecovered = 0;
  int northAmericaActive = 0;
  int northAmericaConfirmed = 0;

  void setNorthAmerica(int value) {
    northAmerica = northAmerica + value;
    notifyListeners();
  }

  void setNorthAmericaRecovered(int value) {
    northAmericaRecovered = northAmericaRecovered + value;
    notifyListeners();
  }

  void setNorthAmericaActive(int value) {
    northAmericaActive = northAmericaActive + value;
    notifyListeners();
  }

  void setNorthAmericaConfirmed(int value) {
    northAmericaConfirmed = northAmericaConfirmed + value;
    notifyListeners();
  }

  int southAmerica = 0;
  int southAmericaRecovered = 0;
  int southAmericaActive = 0;
  int southAmericaConfirmed = 0;

  void setSouthAmerica(int value) {
    southAmerica = southAmerica + value;
    notifyListeners();
  }

  void setSouthAmericaRecovered(int value) {
    southAmericaRecovered = southAmericaRecovered + value;
    notifyListeners();
  }

  void setSouthAmericaActive(int value) {
    southAmericaActive = southAmericaActive + value;
    notifyListeners();
  }

  void setSouthAmericaConfirmed(int value) {
    southAmericaConfirmed = southAmericaConfirmed + value;
    notifyListeners();
  }

  int europe = 0;
  int europeRecovered = 0;
  int europeActive = 0;
  int europeConfirmed = 0;

  void setEurope(int value) {
    europe = europe + value;
    notifyListeners();
  }

  void setEuropeRecovered(int value) {
    europeRecovered = europeRecovered + value;
    notifyListeners();
  }

  void setEuropeActive(int value) {
    europeActive = europeActive + value;
    notifyListeners();
  }

  void setEuropeConfirmed(int value) {
    europeConfirmed = europeConfirmed + value;
    notifyListeners();
  }

  int africa = 0;
  int africaActive = 0;
  int africaRecovered = 0;
  int africaConfirmed = 0;

  void setAfrica(int value) {
    africa =africa+ value;
    notifyListeners();
  }

  void setAfricaRecovered(int value) {
    africaActive =africaActive+ value;
    notifyListeners();
  }

  void setAfricaActive(int value) {
    africaRecovered = africaRecovered+ value;
    notifyListeners();
  }

  void setAfricaConfirmed(int value) {
    africaConfirmed =africaConfirmed+ value;
    notifyListeners();
  }

  int australia = 0;
  int australiaRecovered = 0;
  int australiaActive = 0;
  int australiaConfirmed = 0;

  void setAustralia(int value) {
    australia =australia+ value;
    notifyListeners();
  }

  void setAustraliaRecovered(int value) {
    australiaRecovered =australiaRecovered+ value;
    notifyListeners();
  }

  void setAustraliaActive(int value) {
    australiaActive =australiaActive+ value;
    notifyListeners();
  }

  void setAustraliaConfirmed(int value) {
    australiaConfirmed =australiaConfirmed+ value;
    notifyListeners();
  }
}
