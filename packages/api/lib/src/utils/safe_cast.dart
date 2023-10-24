T? safeCast<T>(value) {
  try {
    return value as T;
  } catch (e) {
    return null;
  }
}
