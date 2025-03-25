import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musicslly_app/domain/usecases/song/get_new_songs.dart';
import 'package:musicslly_app/presentation/home/bloc/news_songs_state.dart';
import 'package:musicslly_app/service_locator.dart';

class NewsSongsCubit extends Cubit<NewsSongsState> {
  NewsSongsCubit() : super(NewsSongsLoading());

  Future<void> getNewsSongs() async {
    var returnedSongs = await sl<GetNewsSongsUseCase>().call();

    returnedSongs.fold((l) {
      emit(NewsSongsLoadFaiure());
    }, (data) {
      emit(NewsSongsLoaded(songs: data));
    });
  }
}
