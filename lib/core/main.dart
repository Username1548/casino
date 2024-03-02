import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../blackjack/domain/models/hand.dart';
import '../blackjack/domain/models/table.dart';
import '../blackjack/internal/methods.dart';
import '../blackjack/internal/provider.dart';
import 'application.dart';


final tableBjProvider = StateNotifierProvider<TableBjNotifier, TableBj>((ref) =>
    TableBjNotifier(TableBj(getFullDeck(), 1, Hand([], getFullDeck(), 1), Hand([], getFullDeck(), 1), false)));

void main() {
  runApp(const ProviderScope(child: MyApp()));
}
