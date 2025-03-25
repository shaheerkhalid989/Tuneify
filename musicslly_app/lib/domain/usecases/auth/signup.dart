import 'package:dartz/dartz.dart';
import 'package:musicslly_app/core/usecase/usecase.dart';
import 'package:musicslly_app/data/models/auth/create_user_req.dart';
import 'package:musicslly_app/domain/respository/auth/auth.dart';
import 'package:musicslly_app/service_locator.dart';

class SignupUseCase implements UseCase<Either, CreateUserReq> {
  @override
  Future<Either> call({CreateUserReq? params}) async {
    return sl<AuthRepository>().signUP(params!);
  }
}
