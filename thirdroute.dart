import 'package:flutter/material.dart';
import 'fourthroute.dart';

class IrrigationScreen extends StatefulWidget {
  @override
  _IrrigationScreenState createState() => _IrrigationScreenState();
}

class _IrrigationScreenState extends State<IrrigationScreen> {
  List<String> selectedAreas = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Irrigation')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/figure4.png',
              height: 350,
              width: 350,
            ),
            SizedBox(height: 20),
            Text(
              'Select the area(s) to irrigate',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            CheckboxListTile(
              title: Text('Front Lane'),
              value: selectedAreas.contains('Front Lane'),
              onChanged: (bool? value) {
                setState(() {
                  if (value == true) {
                    selectedAreas.add('Front Lane');
                  } else {
                    selectedAreas.remove('Front Lane');
                  }
                });
              },
            ),
            CheckboxListTile(
              title: Text('Middle Lane'),
              value: selectedAreas.contains('Middle Lane'),
              onChanged: (bool? value) {
                setState(() {
                  if (value == true) {
                    selectedAreas.add('Middle Lane');
                  } else {
                    selectedAreas.remove('Middle Lane');
                  }
                });
              },
            ),
            CheckboxListTile(
              title: Text('Back Lane'),
              value: selectedAreas.contains('Back Lane'),
              onChanged: (bool? value) {
                setState(() {
                  if (value == true) {
                    selectedAreas.add('Back Lane');
                  } else {
                    selectedAreas.remove('Back Lane');
                  }
                });
              },
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Back'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ConfirmationScreen(selectedAreas: selectedAreas),
                      ),
                    );
                  },
                  child: Text('Submit'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
