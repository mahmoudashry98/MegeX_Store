import 'package:e_commerce_app/core/utils/app_string.dart';
import 'package:equatable/equatable.dart';

class LogoutModel extends Equatable {
  final int id;
  final String token;

  const LogoutModel({required this.id, required this.token});

  factory LogoutModel.fromJson(Map<String, dynamic> json) {
    return LogoutModel(
      id: json[AppString.id],
      token: json[AppString.token],
    );
  }
  @override
  List<Object?> get props => [id, token];
}
