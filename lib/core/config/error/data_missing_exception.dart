class DataMissingException implements Exception {
  
  const DataMissingException(this.message);
  
  final String message;

  @override
  String toString() {
    return 'DataMissingException: $message';
  }
}
