import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musicslly_app/domain/entities/song/song.dart';
import 'package:musicslly_app/presentation/home/bloc/news_songs_cubit.dart';
import 'package:musicslly_app/presentation/home/bloc/news_songs_state.dart';
import 'package:musicslly_app/presentation/home/pages/extra/cover_images.dart';

class NewsSongs extends StatelessWidget {
  const NewsSongs({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NewsSongsCubit()..getNewsSongs(),
      child: SizedBox(
          height: 200,
          child: BlocBuilder<NewsSongsCubit, NewsSongsState>(
            builder: (context, state) {
              if (state is NewsSongsLoading) {
                return Center(child: CircularProgressIndicator());
              }
              if (state is NewsSongsLoaded) {
                return songs(context, state.songs);
              }
              return Container(
                child: CoverImages(),
              );
            },
          )),
    );
  }

  Widget songs(BuildContext context, List<SongEntity> songs) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Column(
          children: [],
        );
      },
      separatorBuilder: (context, index) => SizedBox(width: 14),
      itemCount: songs.length,
    );
  }
}
