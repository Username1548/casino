import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/use_cases/bj_use_cases.dart';

import '../utils/utils.dart';


class BlackJackResultScreen extends ConsumerWidget {
  const BlackJackResultScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final table = ref.watch(tableBjProvider);

    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      width: 400,
                      height: 200,
                      child: Column(
                        children: [
                          ListTile(
                              title: Text(
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                  "Ваши карты (${table.playerHand.calculateAmount()}):")),
                          SizedBox(
                              width: 400,
                              height: 130,
                              child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: getImages(table.playerHand.cards))),
                        ],
                      )),
                  SizedBox(
                      width: 300,
                      height: 200,
                      child: Column(
                        children: [
                          ListTile(
                              title: Text(
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                  "Карты дилера(${table.dealerHand.calculateAmount()}):")),
                          SizedBox(
                              width: 300,
                              height: 130,
                              child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: getImages(table.dealerHand.cards)))
                        ],
                      ))
                ],
              ),
              Center(
                  child: Container(
                      width: 200,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                          color: Colors.red.shade900),
                      child: TextField(
                        readOnly: true,
                        decoration: InputDecoration(
                          hintText: "Результат: !въебать сюда результат ток хз как!}",
                          border: InputBorder.none,
                          hintStyle: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        textAlign: TextAlign.center,
                      ))),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FilledButton(
                      style: FilledButton.styleFrom(
                          backgroundColor: Colors.red.shade900),
                      onPressed: () {
                        Navigator.popUntil(context, ModalRoute.withName("/"));
                      },
                      child: const Text("Главное меню")),
                  FilledButton(
                      style: FilledButton.styleFrom(
                          backgroundColor: Colors.red.shade900),
                      onPressed: () {
                        Navigator.popUntil(context, ModalRoute.withName("/Main/BJBet"));

                      },
                      child: const Text("Играть снова"))
                ],
              )
            ])));
  }
}
