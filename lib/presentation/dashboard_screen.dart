import 'package:cad_it_mobile_technical_test/core/widgets/fill_button.dart';
import 'package:cad_it_mobile_technical_test/presentation/algorithm/algorithm_screen.dart';
import 'package:cad_it_mobile_technical_test/presentation/weather/weather_screen.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FillButton(
              title: "Algorithm App",
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AlgorithmScreen(),
                  ),
                  (route) => false,
                );
              },
            ),
            const SizedBox(
              height: 16.0,
            ),
            FillButton(
              title: "Weather App",
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WeatherScreen(),
                  ),
                  (route) => false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
