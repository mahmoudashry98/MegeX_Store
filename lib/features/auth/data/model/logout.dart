import 'package:e_commerce_app/core/utils/app_string.dart';
import 'package:equatable/equatable.dart';

// class LogoutModel  {
//   dynamic id;
//   final String token;

//   LogoutModel({required this.id, required this.token});

//   factory LogoutModel.fromJson(Map<String, dynamic> json) {
//     return LogoutModel(
//       id: json[AppString.id],
//       token: json[AppString.token],
//     );
//   }

// }

class LogoutModel extends Equatable {
  final bool status;
  final String message;
  final Data? data;
  
  const LogoutModel({
    required this.status,
    required this.message,
    this.data,
  });

  factory LogoutModel.fromJson(Map<String, dynamic> json) => LogoutModel(
        status: json["status"],
        message: json["message"],
        data:json['data']!= null? Data.fromJson(json[AppString.data]):null,
      );

  @override
  List<Object?> get props => [status, message, data];
}

class Data extends Equatable{
  final int id;
  final String token;
  const Data({
    required this.id,
    required this.token,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        token: json["token"],
      );
      @override
  List<Object?> get props => [id,token];
}
