/// A default showdown point.
class DefaultShowdownPoint {
  /// Create an instance.
  const DefaultShowdownPoint({
    required this.name,
    required this.value,
    this.endsPoint = true,
  });

  /// The name of this point.
  final String name;

  /// The value of this point.
  final int value;

  /// Whether this point ends a point.
  final bool endsPoint;
}
