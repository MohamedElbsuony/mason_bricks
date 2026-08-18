class BaseResponseModel<T> {
  final bool status;
  final String message;
  final T? data;

  const BaseResponseModel({
    required this.status,
    required this.message,
    this.data,
  });

  factory BaseResponseModel.fromJson(
    Map<String, dynamic> json,
    T Function(dynamic json)? fromJsonT,
  ) {
    return BaseResponseModel<T>(
      status: json['status'] as bool? ?? false,
      message: json['message']?.toString() ?? '',
      data: json['data'] != null && fromJsonT != null
          ? fromJsonT(json['data'])
          : null,
    );
  }
}
