import 'package:flutter/material.dart';
import 'package:ui_kit/src/styles/colors/color_scheme.dart';
import 'package:ui_kit/src/styles/text/text_extention.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final bool automaticallyImplyLeading;

  const CustomAppBar({
    required this.title,
    this.automaticallyImplyLeading = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: ColoredBox(
        color: AppColorScheme.of(context).background,
        child: automaticallyImplyLeading
            ? Row(
                children: [
                  if (automaticallyImplyLeading)
                    const Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: _BackButton(),
                      ),
                    ),
                  Expanded(
                    child: _AppBarTitle(title: title),
                  ),
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
    return GestureDetector(
      onTap: () => Navigator.of(context).pop(),
      child: const Icon(Icons.arrow_back_ios),
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
      overflow: TextOverflow.ellipsis,
      style: AppTextTheme.of(context).headlineMedium.copyWith(
            color: AppColorScheme.of(context).onBackground,
          ),
    );
  }
}
