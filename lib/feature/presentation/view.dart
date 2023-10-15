import 'package:artus/core/widget_view.dart';
import 'package:artus/feature/presentation/component.dart';
import 'package:flutter/material.dart';
import 'package:localizations/localizations.dart';

class CounterView extends WidgetView<CounterComponent> {
  const CounterView(super.component, {super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppLocalizations.of(context)!.text,
            ),
            ValueListenableBuilder<int>(
              valueListenable: component.counterState,
              builder: (_, value, __) {
                return Text(
                  '$value',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: component.onIncreasePressed,
            tooltip: AppLocalizations.of(context)!.increment,
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            onPressed: component.onDecreasePressed,
            tooltip: AppLocalizations.of(context)!.decrement,
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
