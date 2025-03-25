import 'package:dartz/dartz.dart';
import 'package:musicslly_app/core/usecase/usecase.dart';
import 'package:musicslly_app/data/models/auth/signin_user_req.dart';
import 'package:musicslly_app/domain/respository/auth/auth.dart';
import 'package:musicslly_app/service_locator.dart';

class SigninUseCase implements UseCase<Either, SigninUserReq> {
  @override
  Future<Either> call({SigninUserReq? params}) async {
    return sl<AuthRepository>().signIN(params!);
  }
}
