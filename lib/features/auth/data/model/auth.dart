import 'package:e_commerce_app/core/utils/app_string.dart';
import 'package:e_commerce_app/features/auth/domain/entities/auth.dart';

class AuthModel extends Auth {
  const AuthModel({
    required super.status,
    required super.message,
    super.userData,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      status: json[AppString.status],
      message: json[AppString.message],
      userData: json[AppString.data]!= null? UserDataModel.fromJson(json[AppString.data]):null,
    );

    
  }
}

class UserDataModel extends UserData {
  const UserDataModel({
    required super.name,
    required super.id,
    required super.token,
    required super.email,
    required super.phone,
    super.image,
  });
  factory UserDataModel.fromJson(Map<String, dynamic> json) {
    return UserDataModel(
      name: json[AppString.name],
      id: json[AppString.id],
      token: json[AppString.token],
      email: json[AppString.email],
      phone: json[AppString.phone],
      image: json[AppString.image],
    );
  }
}
