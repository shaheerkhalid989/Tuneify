import "package:get_it/get_it.dart";
import "package:musicslly_app/data/respository/auth/auth_repository_impl.dart";
import "package:musicslly_app/data/respository/song/song_repo_impl.dart";
import "package:musicslly_app/data/sources/auth/auth_firebase_service.dart";
import "package:musicslly_app/data/sources/songs/song_firebase_service.dart";
import "package:musicslly_app/domain/respository/auth/auth.dart";
import "package:musicslly_app/domain/respository/song/song.dart";
import "package:musicslly_app/domain/usecases/auth/signin.dart";
import "package:musicslly_app/domain/usecases/auth/signup.dart";
import "package:musicslly_app/domain/usecases/song/get_new_songs.dart";

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());

  sl.registerSingleton<SongFirebaseService>(SongFirebaseServiceImpl());

  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());

  sl.registerSingleton<SongsRepository>(SongRepositoryImpl());

  sl.registerSingleton<SignupUseCase>(SignupUseCase());

  sl.registerSingleton<SigninUseCase>(SigninUseCase());

  sl.registerSingleton<GetNewsSongsUseCase>(GetNewsSongsUseCase());
}
