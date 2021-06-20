import 'package:flutter/material.dart';
import 'states_dropdown.dart';

import 'data.dart';
import 'districts_dropdown.dart';

// ignore: must_be_immutable
class DropDownWidget extends StatefulWidget {
  @override
  _DropDownWidgetState createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  List<Map> states = [];
  List<Map> districts = [];

  Map selectedState;
  Map selectedDistrict;

  @override
  void initState() {
    stateToDistrict.forEach((element) {
      states.add({
        'state_id': element['state_id'],
        'state_name': element['state_name'],
      });
    });

    selectedState = states[0];

    districts = stateToDistrict[0]['districts'];
    selectedDistrict = stateToDistrict[0]['districts'][0];
    super.initState();
  }

  void assignState(Map state) {
    selectedState = state;
    for (Map element in stateToDistrict) {
      if (state['state_id'] == element['state_id']) {
        setState(() {
          print(element['districts']);
          districts = element['districts'];
          selectedDistrict = element['districts'][0];
        });
        break;
      }
    }
  }

  void assignDistrict(Map district) {
    setState(() {
      selectedDistrict = district;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Select State : ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            StatesDropdown(
              states: states,
              assignState: assignState,
              selectedState: selectedState,
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              'Select District : ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            DistrictsDropdown(
              assignDistrict: assignDistrict,
              districts: districts,
              selectedDistrict: selectedDistrict,
            ),
            FlatButton(
                onPressed: () {
                  print(selectedDistrict['district_name']);
                  print(selectedDistrict['district_name']);
                },
                child: null)
          ],
        ),
      ),
    );
  }
}
