import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lol_data/bloc/profile_bloc/profile_cubit.dart';
import 'package:lol_data/presentation/pages/main_screen_page.dart';



void main() {
  runApp(
      MultiBlocProvider(
      providers: [
        BlocProvider<ProfileCubit>(
          create: (context)=> ProfileCubit()..getSummoner(),
          lazy: false,
        ),
        // BlocProvider<BlocB>(
        //   create: (BuildContext context) => BlocB(),
        // ),
      ],
      child: const MainScreenPage()));
}


