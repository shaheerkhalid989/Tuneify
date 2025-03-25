import 'package:dartz/dartz.dart';
import 'package:musicslly_app/data/sources/songs/song_firebase_service.dart';
import 'package:musicslly_app/domain/respository/song/song.dart';
import 'package:musicslly_app/service_locator.dart';

class SongRepositoryImpl extends SongsRepository {
  @override
  Future<Either> getNewSongs() async {
    return await sl<SongFirebaseService>().getNewSongs();
  }
}
