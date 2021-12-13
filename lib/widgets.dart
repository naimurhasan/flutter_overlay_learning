import 'package:flutter/material.dart';

class CountryPicker extends StatelessWidget {
  const CountryPicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.teal.withOpacity(0.3),
        border: Border(bottom: BorderSide(color: Colors.black))
      ),
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Country'),
          Icon(Icons.arrow_drop_down),
        ],
      ),
    );
  }
}
