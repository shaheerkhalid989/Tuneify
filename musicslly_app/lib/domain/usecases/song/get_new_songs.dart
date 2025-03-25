import 'package:dartz/dartz.dart';
import 'package:musicslly_app/core/usecase/usecase.dart';
import 'package:musicslly_app/domain/respository/song/song.dart';
import 'package:musicslly_app/service_locator.dart';

class GetNewsSongsUseCase implements UseCase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await sl<SongsRepository>().getNewSongs();
  }
}
