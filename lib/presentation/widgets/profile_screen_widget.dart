import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:vector_math/vector_math.dart' hide Colors;

import '../../bloc/profile_bloc/profile_cubit.dart';

class ProfileScreenWidget extends StatefulWidget {
  const ProfileScreenWidget({Key? key}) : super(key: key);

  @override
  _ProfileScreenWidgetState createState() => _ProfileScreenWidgetState();
}

class _ProfileScreenWidgetState extends State<ProfileScreenWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is ProfileInitial) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is ProfileLoading) {
          return Center(
            child: RotationTransition(
              turns: Tween(begin: 0.0, end: 1.0).animate(controller),
              child: Container(
                  height: 60,
                  width: 60,
                  child: SvgPicture.asset('lib/assets/icons/loading_icon.svg')),
            ),
          );
        } else if (state is ProfileLoaded) {
          // var format = DateFormat("yMd");
          return SafeArea(
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Stack(alignment: Alignment.topRight, children: [
                      Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(state.icon),
                                fit: BoxFit.cover),
                            shape: BoxShape.circle),
                        child: SizedBox(),
                      ),
                      Positioned(
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                              color: Colors.black, shape: BoxShape.circle),
                          child: Center(
                            child: Text(
                              state.summoner.level.toString(),
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ]),
                    Column(
                      children: [
                        Text(
                          state.summoner.summonerName.toString(),
                          style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          DateFormat('yMMMd')
                              .format(state.summoner.lastTimeOnline!),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
        } else if (state is ProfileError) {
          return Center(child: Text(state.error));
        } else {
          return Center(
            child: TextButton(
              onPressed: () =>
                  context.read<ProfileCubit>().getSummoner('CutieMorgan'),
              child: Text('Press to refresh'),
            ),
          );
        }
      },
    );
  }
}
