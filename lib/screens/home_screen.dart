import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:glassmorphism/glassmorphism.dart';

import '../widgets/device_grid.dart';
import '../widgets/energy_chart.dart';
import '../widgets/temperature_control.dart';
import '../widgets/voice_control.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Animated Background
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFFE3F2FD),
                  Color(0xFFBBDEFB),
                  Color(0xFF90CAF9),
                ],
              ),
            ),
          ).animate()
              .fade(duration: 1000.ms)
              .scale(begin: const Offset(0.8, 0.8)),

          // Animated Pattern
          CustomPaint(
            painter: BackgroundPatternPainter(),
            size: Size.infinite,
          ),

          // Main Content
          SafeArea(
            child: CustomScrollView(
              slivers: [
                // App Bar
                SliverToBoxAdapter(
                  child: GlassmorphicContainer(
                    width: double.infinity,
                    height: 80,
                    borderRadius: 0,
                    blur: 20,
                    alignment: Alignment.center,
                    border: 0,
                    linearGradient: LinearGradient(
                      colors: [
                        Colors.white.withOpacity(0.1),
                        Colors.white.withOpacity(0.05),
                      ],
                    ),
                    borderGradient: LinearGradient(colors: [
                      Colors.white.withOpacity(0.05),
                      Colors.white.withOpacity(0.05),
                    ]),
                    child: AppBar(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      title: const Text(
                        'Smart Home',
                        style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      actions: [
                        IconButton(
                          icon: const Icon(Icons.mic, color: Colors.black87),
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) => const VoiceControlWidget(),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),

                // Content
                SliverPadding(
                  padding: const EdgeInsets.all(16.0),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate([
                      Text(
                        'Welcome Home',
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ).animate().fadeIn().slideX(),
                      const SizedBox(height: 20),
                      const TemperatureControlWidget()
                          .animate()
                          .fadeIn(delay: 200.ms)
                          .slideX(),
                      const SizedBox(height: 20),
                      const DeviceGridWidget()
                          .animate()
                          .fadeIn(delay: 400.ms)
                          .slideX(),
                      const SizedBox(height: 20),
                      const EnergyChartWidget()
                          .animate()
                          .fadeIn(delay: 600.ms)
                          .slideX(),
                    ]),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Background Pattern Painter
class BackgroundPatternPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.1)
      ..strokeWidth = 1.0
      ..style = PaintingStyle.stroke;

    final spacing = 30.0;
    for (var i = 0; i < size.width; i += spacing as int) {
      for (var j = 0; j < size.height; j += spacing as int) {
        final path = Path()
          ..moveTo(i as double, j as double)
          ..lineTo(i + spacing / 2, j + spacing / 2)
          ..lineTo(i as double, j + spacing)
          ..lineTo(i - spacing / 2, j + spacing / 2)
          ..close();
        canvas.drawPath(path, paint);
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}