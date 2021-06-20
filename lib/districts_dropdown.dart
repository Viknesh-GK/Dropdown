import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DistrictsDropdown extends StatelessWidget {
  final List<Map> districts;
  final Function assignDistrict;
  final selectedDistrict;
  DistrictsDropdown({
    this.districts,
    this.assignDistrict,
    this.selectedDistrict,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DropdownButton<Map>(
        
        // autofocus: true,
        focusColor: Colors.grey,
        isExpanded: true,

        // dropdownColor: Colors.grey[200],
        value: selectedDistrict,
        icon: const Icon(Icons.arrow_drop_down),
        iconSize: 24,
        elevation: 16,
        // style: const TextStyle(color: Colors.deepPurple),
        onChanged: (Map newMap) {
          assignDistrict(newMap);
          // _providerUp.setCat(newValue);
        },
        selectedItemBuilder: (context) {
          return districts.map<Widget>((Map item) {
            return Text(item['district_name']);
          }).toList();
        },
        // isDense: true,
        items: districts.map<DropdownMenuItem<Map>>((Map value) {
          return DropdownMenuItem<Map>(
            value: value,
            child: Container(
              // color: Colors.yellow,
              margin: EdgeInsets.symmetric(
                vertical: 5,
              ),
              child: Text(value['district_name']),
            ),
          );
        }).toList(),
        // hint: Text('somthing'),
      ),
    );
  }
}
