import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/use_cases/bj_use_cases.dart';
import '../utils/utils.dart';


class BlackjackGameScreen extends ConsumerWidget {
  const BlackjackGameScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final table = ref.watch(tableBjProvider);

    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    width: 400,
                    height: double.maxFinite,
                    child: Column(
                      children: [
                        const ListTile(
                            title: Text(
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                                "Ваши карты: ")),
                        SizedBox(
                            width: 400,
                            height: 130,
                            child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: getImages(table.playerHand.cards))),
                        const SizedBox(
                          height: 50,
                        ),
                        Container(
                            width: 400,
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                color: Colors.white),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                      child: Row(children: [
                                    IconButton(
                                        onPressed: () {
                                          ref.read(tableBjProvider.notifier)
                                              .add();

                                          if (ref.read(tableBjProvider.notifier)
                                              .state.playerHand.calculateAmount() >= 21){
                                            ref.read(tableBjProvider.notifier)
                                                .stand();
                                            Navigator.pushNamed(context, "/BJResult");
                                          }


                                        },
                                        icon: const Icon(Icons.add),
                                        color: Colors.green),
                                    const Text(
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                        "Hit")
                                  ])),
                                  SizedBox(
                                      child: Row(children: [
                                    IconButton(
                                        onPressed: () {
                                          ref.read(tableBjProvider.notifier)
                                              .stand();
                                          Navigator.pushNamed(context, "/BJResult");
                                        },
                                        icon: const Icon(Icons.stop),
                                        color: Colors.red),
                                    const Text(
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                        "Stand")
                                  ])),
                                  if (table.playerHand.cards.length == 2)
                                    SizedBox(
                                        child: Row(children: [
                                      IconButton(
                                          onPressed: () {
                                            if (table.playerHand.cards.length == 2){
                                              ref
                                                  .read(tableBjProvider.notifier)
                                                  .double();
                                              Navigator.pushNamed(context, "/BJResult");
                                            }
                                          },
                                          icon: const Icon(
                                              Icons.looks_two_rounded),
                                          color: Colors.amber),
                                      const Text(
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                          "Double")
                                    ]))
                                ]))
                      ],
                    )),
                SizedBox(
                    width: 300,
                    height: double.maxFinite,
                    child: Column(
                      children: [
                        const ListTile(
                            title: Text(
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                                "Карты дилера:")),
                        SizedBox(
                            width: 300,
                            height: 130,
                            child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: getImages(table.dealerHand.cards)))
                      ],
                    ))
              ],
            )));
  }
}
