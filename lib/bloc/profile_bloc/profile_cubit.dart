import 'package:bloc/bloc.dart';
import 'package:lol_data/models/champion_mastery.dart';
import 'package:lol_data/services/profile_repository.dart';
import 'package:meta/meta.dart';

import '../../models/summoner.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());
  final ProfileRepository _repository = ProfileRepository('euw1');

  Future<void> getSummoner() async {
    try {
      emit(ProfileLoading());
      Summoner summoner = await _repository.getSummonerInfo(
      );
      String icon = await _repository.getSummonerIcon(
        summoner.profileIconID.toString(),
      );
      List<ChampionMastery> championMastery =
          await _repository.getChampionMastery(
        summoner.summonerID.toString(),
      );
      emit(ProfileLoaded(
        summoner: summoner,
        icon: icon,
        championMastery: championMastery,
      ));
    } catch (_) {
      emit(ProfileError(error: _.toString()));
    }
  }
}
