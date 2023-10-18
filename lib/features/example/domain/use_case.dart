// ignore_for_file: one_member_abstracts

abstract interface class DecrementCounterUseCase {
  int decrement();
}

abstract interface class IncrementCounterUseCase {
  int increment();
}

abstract interface class GetCounterUseCase {
  int get counter;
}
