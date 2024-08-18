class GkResult<T, E> {
  final T? _value;
  final E? _error;
  final bool _isSuccess;

  GkResult._(this._value, this._error, this._isSuccess);

  factory GkResult.success(T value) {
    return GkResult._(value, null, true);
  }

  factory GkResult.failure(E error) {
    return GkResult._(null, error, false);
  }

  static Future<GkResult<T, E>> fromFuture<T, E>(Future<T> future) {
    return future.then(
      (value) => GkResult.success(value),
      onError: (error) => GkResult.failure(error as E),
    );
  }

  bool get isSuccess => _isSuccess;

  bool get isFailure => !_isSuccess;

  T get value {
    if (!isSuccess) {
      throw StateError('Cannot retrieve value from a failure Result');
    }
    return _value!;
  }

  E get error {
    if (isSuccess) {
      throw StateError('Cannot retrieve error from a success Result');
    }
    return _error!;
  }
}
