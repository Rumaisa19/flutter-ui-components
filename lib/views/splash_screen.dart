import 'package:flutter/material.dart';
import '../core/theme/app_theme.dart';
import 'home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _bgController;
  late AnimationController _iconController;
  late AnimationController _textController;
  late AnimationController _subtitleController;
  late AnimationController _barController;

  late Animation<double> _bgScale;
  late Animation<double> _iconScale;
  late Animation<double> _iconOpacity;
  late Animation<double> _textOpacity;
  late Animation<Offset> _textSlide;
  late Animation<double> _subtitleOpacity;
  late Animation<Offset> _subtitleSlide;
  late Animation<double> _barWidth;

  @override
  void initState() {
    super.initState();

    _bgController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    );
    _iconController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );
    _textController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _subtitleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _barController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _bgScale = Tween<double>(begin: 1.4, end: 1.0).animate(
      CurvedAnimation(parent: _bgController, curve: Curves.easeOutCubic),
    );

    _iconScale = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _iconController, curve: Curves.elasticOut),
    );
    _iconOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _iconController, curve: const Interval(0.0, 0.4)),
    );

    _textOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _textController, curve: Curves.easeOut),
    );
    _textSlide = Tween<Offset>(
      begin: const Offset(0, 0.4),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _textController, curve: Curves.easeOutCubic),
    );

    _subtitleOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _subtitleController, curve: Curves.easeOut),
    );
    _subtitleSlide = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _subtitleController, curve: Curves.easeOutCubic),
    );

    _barWidth = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _barController, curve: Curves.easeInOut),
    );

    _runSequence();
  }

  Future<void> _runSequence() async {
    _bgController.forward();
    await Future.delayed(const Duration(milliseconds: 200));
    await _iconController.forward();
    await Future.delayed(const Duration(milliseconds: 100));
    await _textController.forward();
    await Future.delayed(const Duration(milliseconds: 80));
    await _subtitleController.forward();
    await Future.delayed(const Duration(milliseconds: 100));
    await _barController.forward();
    await Future.delayed(const Duration(milliseconds: 900));

    if (mounted) {
      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 600),
          pageBuilder: (_, __, ___) => const HomeScreen(),
          transitionsBuilder: (_, animation, __, child) {
            return FadeTransition(
              opacity: CurvedAnimation(
                parent: animation,
                curve: Curves.easeOut,
              ),
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0, 0.06),
                  end: Offset.zero,
                ).animate(CurvedAnimation(
                  parent: animation,
                  curve: Curves.easeOutCubic,
                )),
                child: child,
              ),
            );
          },
        ),
      );
    }
  }

  @override
  void dispose() {
    _bgController.dispose();
    _iconController.dispose();
    _textController.dispose();
    _subtitleController.dispose();
    _barController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.primary,
      body: AnimatedBuilder(
        animation: Listenable.merge([
          _bgController,
          _iconController,
          _textController,
          _subtitleController,
          _barController,
        ]),
        builder: (context, _) {
          return Stack(
            children: [
              // Animated background blobs
              Positioned.fill(
                child: Transform.scale(
                  scale: _bgScale.value,
                  child: CustomPaint(
                    painter: _BlobPainter(),
                  ),
                ),
              ),

              // Main content
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Icon
                    Opacity(
                      opacity: _iconOpacity.value,
                      child: Transform.scale(
                        scale: _iconScale.value,
                        child: Container(
                          width: 96,
                          height: 96,
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.15),
                            borderRadius: BorderRadius.circular(28),
                            border: Border.all(
                              color: Colors.white.withValues(alpha: 0.3),
                              width: 1.5,
                            ),
                          ),
                          child: const Icon(
                            Icons.inventory_2_rounded,
                            size: 48,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 28),

                    // App name
                    SlideTransition(
                      position: _textSlide,
                      child: FadeTransition(
                        opacity: _textOpacity,
                        child: const Text(
                          'Product Catalog',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                            letterSpacing: -1.0,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 8),

                    // Subtitle
                    SlideTransition(
                      position: _subtitleSlide,
                      child: FadeTransition(
                        opacity: _subtitleOpacity,
                        child: Text(
                          'Manage your inventory with ease',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.white.withValues(alpha: 0.75),
                            letterSpacing: 0.2,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 48),

                    // Animated progress bar
                    FadeTransition(
                      opacity: _subtitleOpacity,
                      child: SizedBox(
                        width: 160,
                        height: 3,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(2),
                          child: Stack(
                            children: [
                              Container(
                                color: Colors.white.withValues(alpha: 0.2),
                              ),
                              FractionallySizedBox(
                                widthFactor: _barWidth.value,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Bottom version tag
              Positioned(
                bottom: 40,
                left: 0,
                right: 0,
                child: FadeTransition(
                  opacity: _subtitleOpacity,
                  child: Text(
                    'v1.0.0',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white.withValues(alpha: 0.4),
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _BlobPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;

    // Top-right blob
    paint.color = const Color(0xFF8B85FF).withValues(alpha: 0.5);
    canvas.drawCircle(
      Offset(size.width * 1.1, size.height * -0.05),
      size.width * 0.65,
      paint,
    );

    // Bottom-left blob
    paint.color = const Color(0xFF4B44CC).withValues(alpha: 0.6);
    canvas.drawCircle(
      Offset(size.width * -0.15, size.height * 1.05),
      size.width * 0.7,
      paint,
    );

    // Center accent
    paint.color = const Color(0xFF9D97FF).withValues(alpha: 0.15);
    canvas.drawCircle(
      Offset(size.width * 0.5, size.height * 0.5),
      size.width * 0.55,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
