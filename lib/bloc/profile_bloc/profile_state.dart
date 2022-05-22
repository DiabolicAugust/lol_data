part of 'profile_cubit.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  Summoner summoner;
  String icon;
  ProfileLoaded({required this.summoner, required this.icon}):assert(summoner != null);
}

class ProfileError extends ProfileState {
  dynamic error;
  ProfileError({required this.error});
}
