part of 'profile_cubit.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  Summoner summoner;
  String icon;
  List<ChampionMastery> championMastery;

  ProfileLoaded({
    required this.summoner,
    required this.icon,
    required this.championMastery,
  }) : assert(summoner != null);
}

class ProfileError extends ProfileState {
  dynamic error;

  ProfileError({required this.error});
}
