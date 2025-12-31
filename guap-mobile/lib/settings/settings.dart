import 'package:shared_preferences/shared_preferences.dart';

class Settings {
  static SharedPreferences? _storage;
  static const String _showPersonsKey = "showPersons";
  static const String _currencyRatesKey = "currencyRate";

  static void init() async {
    _storage ??= await SharedPreferences.getInstance();
  }

  static bool showPersons() {
    _check(); // TODO remove check, use singleton pattern
    return (_storage!.containsKey(_showPersonsKey) ? _storage!.getBool(_showPersonsKey) : true) ?? true; // TODO update for null-safety
  }

  static void setShowPersons(bool value) {
    _check(); // TODO remove check, use singleton pattern
    _storage!.setBool(_showPersonsKey, value);
  }

  static double getCurrencyRate(String currency) {
    _check(); // TODO remove check, use singleton pattern
    if (_storage!.containsKey("$_currencyRatesKey$currency"))
      return _storage!.getDouble("$_currencyRatesKey$currency") ?? 1;
    switch (currency) {          // data by cbr.ru 2026-01-01
      case "RUB": return 1;
      case "USD": return 78.2267;
      case "EUR": return 92.0938;
      case "GBP": return 105.6060;
      case "KGS": return 0.894861;
      case "AMD": return 0.205126;
      case "THB": return 2.48095;
      case "INR": return 0.869737;
      default:    return 1;      // default no-op multiplicator
    }
  }

  static void setCurrencyRate(String currency, double value) {
    _check(); // TODO remove check, use singleton pattern
    _storage!.setDouble("$_currencyRatesKey$currency", value);
  }

  static void _check() {
    // TODO remove check, use singleton pattern
    if (_storage == null)
      throw Exception("Call Settings.init() in main app widget");
  }
}
