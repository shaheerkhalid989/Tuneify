import 'package:dartz/dartz.dart';
import 'package:musicslly_app/data/models/auth/create_user_req.dart';
import 'package:musicslly_app/data/models/auth/signin_user_req.dart';
import 'package:musicslly_app/data/sources/auth/auth_firebase_service.dart';
import 'package:musicslly_app/domain/respository/auth/auth.dart';
import 'package:musicslly_app/service_locator.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> signIN(SigninUserReq signinUserReq) async {
    return await sl<AuthFirebaseService>().signIN(signinUserReq);
  }
  
  @override
  Future<Either> signUP (CreateUserReq createUserReq) async {
    return await sl<AuthFirebaseService>().signUP(createUserReq);
  }
}