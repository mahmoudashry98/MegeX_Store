import 'package:equatable/equatable.dart';

class AuthEntities extends Equatable {
  final bool status;
  final String message;
  final UserData? userData;

  const AuthEntities({
    required this.status,
    required this.message,
    this.userData,
  });

  @override
  List<Object?> get props => [
        status,
        message,
        userData,
      ];
}

class UserData extends Equatable {
  final int id;
  final String name;
  final String token;
  final String email;
  final String phone;
  final String? image;

  const UserData({
    required this.name,
    required this.id,
    required this.token,
    required this.email,
    required this.phone,
    this.image,
  });

  @override
  List<Object?> get props => [
        email,
        id,
        token,
        name,
        phone,
        image,
      ];
}
