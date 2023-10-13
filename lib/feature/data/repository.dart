import 'package:artus/feature/domain/use_case.dart';

class CounterRepository
    implements
        DecrementCounterUseCase,
        IncrementCounterUseCase,
        GetCounterUseCase {
  CounterRepository({
    required this.counter,
  });

  @override
  int counter;

  @override
  int decrement() => --counter;

  @override
  int increment() => ++counter;
}
