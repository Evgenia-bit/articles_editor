import 'package:flutter/widgets.dart';

class AppBar extends StatelessWidget {
  final String title;
  final bool automaticallyImplyLeading;

  const AppBar({
    required this.title,
    this.automaticallyImplyLeading = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: ColoredBox(
        color: const Color(0xFFFFFFFF),
        child: automaticallyImplyLeading
            ? Row(
                children: [
                  if (automaticallyImplyLeading)
                    const Expanded(
                      child: _BackButton(),
                    ),
                  _AppBarTitle(title: title),
                  const Spacer(),
                ],
              )
            : Center(
                child: _AppBarTitle(title: title),
              ),
      ),
    );
  }
}

class _BackButton extends StatelessWidget {
  const _BackButton();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: const Text(
          '\u276E',
          style: TextStyle(
            color: Color(0xFF000000),
            decoration: TextDecoration.none,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}

class _AppBarTitle extends StatelessWidget {
  final String title;
  const _AppBarTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: const TextStyle(
        color: Color(0xFF000000),
        decoration: TextDecoration.none,
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
    );
  }
}
