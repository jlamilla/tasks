class LocalStorageResponse<T> {
  const LocalStorageResponse({
    required this.isSuccess,
    this.message = '',
    this.keys,
    this.result,
  });

  final bool isSuccess;
  final String message;
  final List<String>? keys;
  final T? result;
}
