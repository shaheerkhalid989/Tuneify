import 'package:dartz/dartz.dart';
import 'package:musicslly_app/data/models/auth/create_user_req.dart';
import 'package:musicslly_app/data/models/auth/signin_user_req.dart';

abstract class AuthRepository {
  Future<Either> signIN(SigninUserReq signinUserReq);
  Future<Either> signUP(CreateUserReq createUserReq);
  // Future<void> logout();
  // Future<void> register(String email, String password);
  // Future<bool> isLogged();
}
