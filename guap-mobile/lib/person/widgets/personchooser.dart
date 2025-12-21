import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:guap_mobile/person/redux.dart';
import 'package:guap_mobile/redux/appstate.dart';

class PersonChooser extends StatelessWidget {
  final TextEditingController ctrl;

  const PersonChooser(this.ctrl, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("Rebiulding person chooser");
    return StoreConnector<AppState, PersonsState>(
      distinct: true,
      converter: (store) => store.state.personsState,
      builder: (context, state) {
        if (state.persons.isEmpty)
          StoreProvider.of<AppState>(context).dispatch(PersonsThunk.fetchPersons());
        final decor = InputDecoration(border: OutlineInputBorder(), labelText: "Choose person (optional)");
        return TypeAheadField<String>(
            controller: ctrl,
          builder: (context, ctrl, focusNode) => TextField(controller: ctrl, focusNode: focusNode, decoration: decor),
          suggestionsCallback: (prefix) {
            final list = new List<String>.from(state.persons);
            list.retainWhere((s) => s.toLowerCase().contains(prefix.toLowerCase()));
            return list;
          },
          itemBuilder: (context, suggestion) => ListTile(title: Text(suggestion)),
          onSelected: (newValue) {
            ctrl.text = newValue;
          },
          hideOnEmpty: true,
        );
      }
    );
  }
}
