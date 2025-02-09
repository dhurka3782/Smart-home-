import 'package:flutter/material.dart';

class EnergyChartWidget extends StatelessWidget {
  const EnergyChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<EnergyData> data = [
      EnergyData('Mon', 3.2, Colors.blue[300]!),
      EnergyData('Tue', 4.5, Colors.blue[400]!),
      EnergyData('Wed', 2.8, Colors.blue[500]!),
      EnergyData('Thu', 5.0, Colors.blue[600]!),
      EnergyData('Fri', 3.7, Colors.blue[700]!),
      EnergyData('Sat', 2.5, Colors.blue[800]!),
      EnergyData('Sun', 3.0, Colors.blue[900]!),
    ];

    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Energy Usage',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Weekly Overview',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 200,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: data.map((item) {
                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            '${item.value}kWh',
                            style: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 500),
                            height: (item.value / 5.0) * 120,
                            decoration: BoxDecoration(
                              color: item.color,
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            item.day,
                            style: const TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildSummaryItem(
                  'Total Usage',
                  '24.7 kWh',
                  Icons.electric_bolt,
                ),
                _buildSummaryItem(
                  'Daily Average',
                  '3.5 kWh',
                  Icons.trending_up,
                ),
                _buildSummaryItem(
                  'Peak Day',
                  'Thu',
                  Icons.arrow_upward,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryItem(String label, String value, IconData icon) {
    return Column(
      children: [
        Icon(icon, color: Colors.blue, size: 20),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}

class EnergyData {
  final String day;
  final double value;
  final Color color;

  EnergyData(this.day, this.value, this.color);
}