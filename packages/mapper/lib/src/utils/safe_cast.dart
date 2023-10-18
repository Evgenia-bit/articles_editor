// ignore: type_annotate_public_apis
T? safeCast<T>(value) {
  try {
    return value as T;
    // ignore: avoid_catches_without_on_clauses
  } catch (e) {
    return null;
  }
}
