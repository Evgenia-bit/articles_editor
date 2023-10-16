
import 'package:artus/core/component_state.dart';
import 'package:artus/core/widget_view.dart';
import 'package:artus/features/example/domain/use_case.dart';
import 'package:artus/features/example/presentation/component.dart';
import 'package:artus/features/example/presentation/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/change_notifier.dart';

class CounterWidgetComponent extends StatefulWidget {
  const CounterWidgetComponent({
    super.key,
    required this.decrementCounterUseCase,
    required this.incrementCounterUseCase,
    required this.getCounterUseCase,
  });

  final DecrementCounterUseCase decrementCounterUseCase;
  final IncrementCounterUseCase incrementCounterUseCase;
  final GetCounterUseCase getCounterUseCase;

  @override
  State createState() => _CounterWidgetComponentState();
}

class _CounterWidgetComponentState
    extends ComponentState<CounterWidgetComponent, CounterComponent>
    implements CounterComponent {
  @override
  WidgetView<CounterComponent> buildView(BuildContext context) {
    return CounterView(this);
  }

  @override
  void initState() {
    super.initState();
    counterState = ValueNotifier(widget.getCounterUseCase.counter);
  }

  @override
  late final ValueNotifier<int> counterState;

  @override
  void onDecreasePressed() {
    counterState.value = widget.decrementCounterUseCase.decrement();
  }

  @override
  void onIncreasePressed() {
    counterState.value = widget.incrementCounterUseCase.increment();
  }
}
