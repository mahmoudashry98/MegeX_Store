import 'package:e_commerce_app/core/utils/app_string.dart';
import 'package:equatable/equatable.dart';

class StatusModel extends Equatable {
  final bool status;
  final String message;
  

  const StatusModel({
    required this.status,
    required this.message,
   
  });

  factory StatusModel.fromJson(Map<String, dynamic> json) {
    return StatusModel(
      status: json[AppString.status],
      message: json[AppString.message],
      
    );
  }

  @override
  List<Object?> get props => [
        status,
        message,
      ];
}
