import 'package:musicslly_app/domain/entities/song/song.dart';

abstract class NewsSongsState {}

class NewsSongsLoading extends NewsSongsState {}

class NewsSongsLoaded extends NewsSongsState {
  final List<SongEntity> songs;
  NewsSongsLoaded({required this.songs});
}

class NewsSongsLoadFaiure extends NewsSongsState {}