class ResponseModel {
  final int statusCode;
  final bool isSuccess;
  final dynamic responseData;

  ResponseModel(
      {required this.statusCode,
      required this.isSuccess,
      required this.responseData});
}
