import 'package:flutter/material.dart';

// ignore: must_be_immutable
class StatesDropdown extends StatelessWidget {
  final List<Map> states;
  final Function assignState;
  final selectedState;
  StatesDropdown({
    this.states,
    this.assignState,
    this.selectedState,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DropdownButton<Map>(
        // autofocus: true,
        focusColor: Colors.grey,
        isExpanded: true,

        // dropdownColor: Colors.grey[200],
        value: selectedState,
        icon: const Icon(Icons.arrow_drop_down),
        iconSize: 24,
        elevation: 16,
        // style: const TextStyle(color: Colors.deepPurple),
        onChanged: (Map newMap) {
          assignState(newMap);
          // _providerUp.setCat(newValue);
        },
        selectedItemBuilder: (context) {
          return states.map<Widget>((Map item) {
            return Text(item['state_name']);
          }).toList();
        },
        // isDense: true,
        items: states.map<DropdownMenuItem<Map>>((Map value) {
          return DropdownMenuItem<Map>(
            value: value,
            child: Container(
              // color: Colors.yellow,
              margin: EdgeInsets.symmetric(
                vertical: 5,
              ),
              child: Text(value['state_name']),
            ),
          );
        }).toList(),
        // hint: Text('somthing'),
      ),
    );
  }
}
