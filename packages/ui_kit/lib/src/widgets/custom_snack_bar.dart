import 'package:flutter/material.dart';
import 'package:ui_kit/src/styles/colors/color_scheme.dart';
import 'package:ui_kit/src/styles/text/text_extention.dart';

class CustomSnackBar extends StatefulWidget {
  final String text;
  const CustomSnackBar({required this.text, super.key});

  @override
  State<CustomSnackBar> createState() => _CustomSnackBarState();
}

class _CustomSnackBarState extends State<CustomSnackBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _animate();
  }

  Future<void> _animate() async {
    await _controller.forward();
    await Future.delayed(const Duration(seconds: 3));
    await _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: FadeTransition(
        opacity: _animation,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: ColoredBox(
            color: AppColorScheme.of(context).surface,
            child: SizedBox(
              height: 50,
              child: Center(
                child: Text(
                  widget.text,
                  style: AppTextTheme.of(context).body.copyWith(
                        color: AppColorScheme.of(context).onSurface,
                      ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
