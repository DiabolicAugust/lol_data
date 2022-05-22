import 'package:bloc/bloc.dart';
import 'package:lol_data/services/profile_repository.dart';
import 'package:meta/meta.dart';

import '../../models/summoner.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());
final ProfileRepository _repository = ProfileRepository('euw1');

Future<void> getSummoner(String summonerName)async{
  try{
    emit(ProfileLoading());
    Summoner summoner = await _repository.getSummonerInfo(summonerName,);
    String icon = await _repository.getSummonerIcon(summoner.profileIconID.toString(),);
    emit(ProfileLoaded(summoner: summoner, icon: icon,));
  }catch(_){
    emit(ProfileError(error:_.toString() ));
  }
}

}
