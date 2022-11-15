import 'package:e_commerce_app/core/utils/app_string.dart';
import 'package:e_commerce_app/features/auth/domain/entities/auth.dart';

class AuthModel extends Auth {
  const AuthModel({
    required super.name,
    required super.id,
    required super.token,
    required super.email,
    required super.phone,
    super.image,
  });
  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      name: json[AppString.data][AppString.name],
      id: json[AppString.data][AppString.id],
      token: json[AppString.data][AppString.token],
      email: json[AppString.data][AppString.email],
      phone: json[AppString.data][AppString.phone],
      image: json[AppString.data][AppString.image],
    );
  }
}
