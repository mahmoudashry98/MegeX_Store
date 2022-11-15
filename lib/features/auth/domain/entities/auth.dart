import 'package:equatable/equatable.dart';

class Auth extends Equatable {
  final int id;
  final String name;
  final String token;
  final String email;
  final String phone;
  final String? image;

  const Auth({
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
