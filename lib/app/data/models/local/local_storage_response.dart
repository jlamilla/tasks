class LocalStorageResponse<T> {
  LocalStorageResponse({
    required this.isSuccess,
    this.message = '',
    this.keys,
    this.result,
  });

  bool isSuccess;
  String message;
  List<String>? keys;
  T? result;
}
