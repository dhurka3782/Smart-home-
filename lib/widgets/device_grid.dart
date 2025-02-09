import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/home_provider.dart';

class DeviceGridWidget extends StatelessWidget {
  const DeviceGridWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, homeProvider, child) {
        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: homeProvider.devices.length,
          itemBuilder: (context, index) {
            String deviceName = homeProvider.devices.keys.elementAt(index);
            bool isActive = homeProvider.devices[deviceName]!;

            return Card(
              elevation: isActive ? 2 : 1,
              child: InkWell(
                onTap: () => homeProvider.toggleDevice(deviceName),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),  // Reduced padding
                  child: Column(
                    mainAxisSize: MainAxisSize.min,  // Added to prevent expansion
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        _getDeviceIcon(deviceName),
                        size: 28,  // Slightly reduced size
                        color: isActive ? Colors.blue : Colors.grey,
                      ),
                      const SizedBox(height: 4),  // Reduced spacing
                      Text(
                        deviceName,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: isActive ? Colors.blue : Colors.black87,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,  // Adjusted font size
                        ),
                        maxLines: 1,  // Prevent text wrapping
                        overflow: TextOverflow.ellipsis,  // Handle long text
                      ),
                      const SizedBox(height: 4),  // Reduced spacing
                      Switch(
                        value: isActive,
                        onChanged: (value) => homeProvider.toggleDevice(deviceName),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  IconData _getDeviceIcon(String deviceName) {
    switch (deviceName.toLowerCase()) {
      case 'living room lights':
        return Icons.lightbulb;
      case 'bedroom lights':
        return Icons.bed;
      case 'ac':
        return Icons.ac_unit;
      case 'tv':
        return Icons.tv;
      case 'security system':
        return Icons.security;
      default:
        return Icons.devices;
    }
  }
}