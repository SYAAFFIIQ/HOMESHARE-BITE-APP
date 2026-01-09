import 'package:flutter/material.dart';
import 'thirdroute.dart';

class FieldMonitoringScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Field Monitoring')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Plot 1 (Front Lane)', style: TextStyle(fontSize: 18)),
            Image.asset(
              'assets/images/figure2.png',
              height: 200,
              width: 200,
            ),
            SizedBox(height: 10),
            Text('Plot 2 (Middle Lane)', style: TextStyle(fontSize: 18)),
            Image.asset(
              'assets/images/figure3.png',
              height: 200,
              width: 200,
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
                          builder: (context) => IrrigationScreen()),
                    );
                  },
                  child: Text('Next - Automate Irrigation'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
