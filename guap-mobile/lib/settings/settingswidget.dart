import 'package:flutter/material.dart';
import 'package:guap_mobile/settings/settings.dart';

class SettingsWidget extends StatefulWidget { // StatefulWidget needed for setState()
  @override
  State<StatefulWidget> createState() => SettingsWidgetState();
}

class SettingsWidgetState extends State<SettingsWidget> {
  final rubCtrl = TextEditingController(text: Settings.getCurrencyRate("RUB").toString());
  final usdCtrl = TextEditingController(text: Settings.getCurrencyRate("USD").toString());
  final eurCtrl = TextEditingController(text: Settings.getCurrencyRate("EUR").toString());
  final gbpCtrl = TextEditingController(text: Settings.getCurrencyRate("GBP").toString());
  final kgsCtrl = TextEditingController(text: Settings.getCurrencyRate("KGS").toString());
  final amdCtrl = TextEditingController(text: Settings.getCurrencyRate("AMD").toString());
  final thbCtrl = TextEditingController(text: Settings.getCurrencyRate("THB").toString());
  final inrCtrl = TextEditingController(text: Settings.getCurrencyRate("INR").toString());

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        CheckboxListTile(
          title: const Text("Show persons"),
          subtitle: const Text("Enables or hides persons on each operation"),
          value: Settings.showPersons(),
          onChanged: (value) {
            setState(() {
              Settings.setShowPersons(value ?? true);
            });
          },
        ),
        ListTile(
          title: const Text("RUB rate"),
          subtitle: const Text("Currency rate RUB"),
          trailing: SizedBox(width: 110, child: TextField(controller: rubCtrl, onChanged: (s) => _setCurrency("RUB", s), decoration: const InputDecoration(border: OutlineInputBorder()))),
        ),
        ListTile(
          title: const Text("USD rate"),
          subtitle: const Text("Currency rate USD"),
          trailing: SizedBox(width: 110, child: TextField(controller: usdCtrl, onChanged: (s) => _setCurrency("USD", s), decoration: const InputDecoration(border: OutlineInputBorder()))),
        ),
        ListTile(
          title: const Text("EUR rate"),
          subtitle: const Text("Currency rate EUR"),
          trailing: SizedBox(width: 110, child: TextField(controller: eurCtrl, onChanged: (s) => _setCurrency("EUR", s), decoration: const InputDecoration(border: OutlineInputBorder()))),
        ),
        ListTile(
          title: const Text("GBP rate"),
          subtitle: const Text("Currency rate GBP"),
          trailing: SizedBox(width: 110, child: TextField(controller: gbpCtrl, onChanged: (s) => _setCurrency("GBP", s), decoration: const InputDecoration(border: OutlineInputBorder()))),
        ),
        ListTile(
          title: const Text("KGS rate"),
          subtitle: const Text("Currency rate KGS"),
          trailing: SizedBox(width: 110, child: TextField(controller: kgsCtrl, onChanged: (s) => _setCurrency("KGS", s), decoration: const InputDecoration(border: OutlineInputBorder()))),
        ),
        ListTile(
          title: const Text("AMD rate"),
          subtitle: const Text("Currency rate AMD"),
          trailing: SizedBox(width: 110, child: TextField(controller: amdCtrl, onChanged: (s) => _setCurrency("AMD", s), decoration: const InputDecoration(border: OutlineInputBorder()))),
        ),
        ListTile(
          title: const Text("THB rate"),
          subtitle: const Text("Currency rate THB"),
          trailing: SizedBox(width: 110, child: TextField(controller: thbCtrl, onChanged: (s) => _setCurrency("THB", s), decoration: const InputDecoration(border: OutlineInputBorder()))),
        ),
        ListTile(
          title: const Text("INR rate"),
          subtitle: const Text("Currency rate INR"),
          trailing: SizedBox(width: 110, child: TextField(controller: inrCtrl, onChanged: (s) => _setCurrency("INR", s), decoration: const InputDecoration(border: OutlineInputBorder()))),
        ),
      ]
    );
  }

  void _setCurrency(String currency, String value) {
    final d = double.tryParse(value);
    if (d != null) Settings.setCurrencyRate(currency, d);
  }
}
