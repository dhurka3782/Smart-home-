import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/home_provider.dart';

class TemperatureControlWidget extends StatelessWidget {
  const TemperatureControlWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, homeProvider, child) {
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Temperature',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      '${homeProvider.temperature.toStringAsFixed(1)}°C',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
                Slider(
                  value: homeProvider.temperature,
                  min: 16,
                  max: 30,
                  divisions: 28,
                  label: '${homeProvider.temperature.toStringAsFixed(1)}°C',
                  onChanged: (value) => homeProvider.setTemperature(value),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}