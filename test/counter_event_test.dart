import 'package:bloc_test/bloc_test.dart';
import 'package:counter/counter_event.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CounterBloc counterBlocWithDefaultInitialState;
  late CounterBloc counterBlocWithInitialState10;
  group('CounterBloc', () {
    setUp(() {
      counterBlocWithDefaultInitialState = CounterBloc();
      counterBlocWithInitialState10 = CounterBloc(initialState: 10);
    });

    test('Initial state is [0]', () {
      expect(counterBlocWithDefaultInitialState.state, 0);
    });

    blocTest(
      'emits [1] when [1] is added.',
      build: () => counterBlocWithDefaultInitialState,
      act: (bloc) => bloc.add(CounterIncrementPressed()),
      expect: () => <int>[1],
    );

    blocTest(
      'emits [-1] when [1] is subtracted.',
      build: () => counterBlocWithDefaultInitialState,
      act: (bloc) => bloc.add(CounterDecrementPressed()),
      expect: () => const <int>[-1],
    );

    test('initial state is [10].', () {
      expect(counterBlocWithInitialState10.state, 10);
    });

    blocTest(
      'emits [11] when [1] is added to [10].',
      build: () => counterBlocWithInitialState10,
      act: (bloc) => bloc.add(CounterIncrementPressed()),
      expect: () => const <int>[11],
    );
  });
}
