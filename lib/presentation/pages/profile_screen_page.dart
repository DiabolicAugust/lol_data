import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lol_data/bloc/profile_bloc/profile_cubit.dart';
import 'package:lol_data/presentation/widgets/profile_screen_widget.dart';

class ProfileScreenPage extends StatelessWidget {
  const ProfileScreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfileCubit>(
        create: (context)=> ProfileCubit()..getSummoner('CutieMorgan'),
        child: const ProfileScreenWidget());
  }
}
