abstract class Maybe<A> {
  const Maybe();

  const factory Maybe.just(A value) = _Just;
  const factory Maybe.nothing() = _Nothing;

  bool get isJust => false;
  bool get isNothing => false;

  B match<B>(
      {required B Function(A a) onJust, required B Function() onNothing});

  @override
  bool operator ==(Object other) =>
      other is Maybe &&
      match(
        onJust: (value) => other.match(
          onJust: (otherValue) => value == otherValue,
          onNothing: () => false,
        ),
        onNothing: () => other.isNothing,
      );

  @override
  int get hashCode => Object.hash(this, super.hashCode);
}

class _Just<A> extends Maybe<A> {
  final A value;

  const _Just(this.value);

  @override
  bool get isJust => true;

  @override
  B match<B>(
          {required B Function(A a) onJust, required B Function() onNothing}) =>
      onJust(value);
}

class _Nothing<A> extends Maybe<A> {
  const _Nothing();

  @override
  bool get isNothing => true;

  @override
  B match<B>(
          {required B Function(A a) onJust, required B Function() onNothing}) =>
      onNothing();
}
