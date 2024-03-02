import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../feature/blackjack/domain/models/hand.dart';
import '../feature/blackjack/domain/models/table.dart';
import '../feature/blackjack/internal/methods.dart';
import '../feature/blackjack/internal/provider.dart';
import 'application.dart';


void main() {
  runApp(const ProviderScope(child: MyApp()));
}
