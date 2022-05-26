import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import '../../bloc/profile_bloc/profile_cubit.dart';

class ProfileScreenWidget extends StatefulWidget {
  const ProfileScreenWidget({Key? key}) : super(key: key);

  @override
  _ProfileScreenWidgetState createState() => _ProfileScreenWidgetState();
}

class _ProfileScreenWidgetState extends State<ProfileScreenWidget>
    with SingleTickerProviderStateMixin {
  // dynamic bloc;
  late AnimationController controller;

  @override
  dispose() {
    controller.dispose(); // you need this
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
// bloc = BlocProvider.of<ProfileCubit>(context);
    controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      // bloc: BlocProvider.of<ProfileCubit>(context),
      bloc: context.read<ProfileCubit>(),
      builder: (context, state) {
        if (state is ProfileInitial) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is ProfileLoading) {
          return _BuildLoading(controller: controller);
        } else if (state is ProfileLoaded) {
          return SingleChildScrollView(
            child: Column(
              children: [
                _BuildProfileTop(state: state),
                const SizedBox(height: 10,),
                const Center(child: Text('My current character top', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),)),
                Center(
                  child: Row(
                    children: [
                      Container(
                              height: 100,
                                width: 100,
                                decoration: const BoxDecoration(
                                  color: Colors.black26
                                ),
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Text(state
                                      .championMastery[1].championPoints
                                      .toString()),
                                )),
                      Container(
                              height: 100,
                                width: 100,
                                decoration: const BoxDecoration(
                                  color: Colors.black26
                                ),
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Text(state
                                      .championMastery[0].championPoints
                                      .toString()),
                                )),
                      Container(
                              height: 100,
                                width: 100,
                                decoration: const BoxDecoration(
                                  color: Colors.black26
                                ),
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Text(state
                                      .championMastery[2].championPoints
                                      .toString()),
                                )),
                    ],
                  ),
                  ),
              ],
            ),
          );
        } else if (state is ProfileError) {
          return Center(child: Text(state.error));
        } else {
          return Center(
            child: TextButton(
              onPressed: () => context.read<ProfileCubit>().getSummoner(),
              child: const Text('Press to refresh'),
            ),
          );
        }
      },
    );
  }
}

class _BuildProfileTop extends StatelessWidget {
  final ProfileLoaded state;

  const _BuildProfileTop({required this.state, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                          image: NetworkImage(state.icon), fit: BoxFit.cover),
                      shape: BoxShape.circle),
                  child: const SizedBox(),
                ),
                Positioned(
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: const BoxDecoration(
                        color: Colors.black, shape: BoxShape.circle),
                    child: Center(
                      child: Text(
                        state.summoner.level.toString(),
                        style: const TextStyle(color: Colors.white),
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
                    DateFormat('yMMMd').format(state.summoner.lastTimeOnline!),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _BuildLoading extends StatelessWidget {
  const _BuildLoading({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final AnimationController controller;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RotationTransition(
        turns: Tween(begin: 0.0, end: 1.0).animate(controller),
        child: Container(
            height: 60,
            width: 60,
            child: SvgPicture.asset('lib/assets/icons/loading_icon.svg')),
      ),
    );
  }
}
