import '../providers/leaders_state_provider.dart';
import 'leader_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LeaderBoard extends ConsumerStatefulWidget {
  const LeaderBoard({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LeaderBoardState();
}

class _LeaderBoardState extends ConsumerState<LeaderBoard> {
  @override
  void initState() {
    ref.read(leadersStateProvider.notifier).getLeaders();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final leaders = ref.watch(leadersStateProvider);
    return leaders.when(
      data: (data) => Center(
        child: Container(
          width: MediaQuery.sizeOf(context).width * 0.7,
          height: MediaQuery.sizeOf(context).height * 0.7,
          decoration: BoxDecoration(
              boxShadow: [
                const BoxShadow(
                  color: Colors.green,
                  blurRadius: 2,
                  spreadRadius: 0.5,
                ), //BoxShadow
                BoxShadow(
                  color: Theme.of(context).canvasColor,
                  offset: const Offset(0.0, 0.0),
                  blurRadius: 0.0,
                  spreadRadius: 0.0,
                ), //BoxShadow
              ],
              border: Border.all(
                  color: const Color.fromARGB(255, 2, 113, 6), width: 3)),
          child: Center(
            child: SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.5,
              height: MediaQuery.sizeOf(context).height * 0.55,
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return LeaderField(
                      data[index].username,
                      data[index].balance,
                      index,
                      color: const Color.fromARGB(255, 255, 215, 0),
                    );
                  } else if (index == 1) {
                    return LeaderField(
                      data[index].username,
                      data[index].balance,
                      index,
                      color: const Color.fromARGB(255, 192, 192, 192),
                    );
                  } else if (index == 2) {
                    return LeaderField(
                      data[index].username,
                      data[index].balance,
                      index,
                      color: const Color.fromARGB(255, 205, 127, 50),
                    );
                  }
                  return LeaderField(
                      data[index].username, data[index].balance, index);
                },
                itemCount: data.length,
              ),
            ),
          ),
        ),
      ),
      error: (error, stackTrace) => Text(error.toString()),
      loading: () => const CircularProgressIndicator(),
    );
  }
}
