import '../providers/wheel_state_provider.dart';
import 'money_wheel_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MoneyWheelButton extends ConsumerStatefulWidget {
  const MoneyWheelButton({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FortuneWheelState();
}

class _FortuneWheelState extends ConsumerState<MoneyWheelButton> {
  @override
  Widget build(BuildContext context) {
    final wheelData = ref.watch(wheelDataProvider);
    return wheelData.when(data: (data) {
      return MonyeWheel(        
        angleDelta: data.angleDelta,
        
        );
  }
    , error: (er, stackTrace) => const MonyeWheel(), loading: (){
      return const MonyeWheel();

    });
  }
}
