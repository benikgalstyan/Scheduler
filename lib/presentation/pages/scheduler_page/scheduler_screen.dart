import 'package:flutter/material.dart';
import 'package:layout/presentation/pages/scheduler_page/scheduler_layout.dart';

class SchedulerScreen extends StatelessWidget {
  const SchedulerScreen({super.key});

  static const route = 'scheduler_screen';

  @override
  Widget build(BuildContext context) {
    return const SchedulerLayout();
  }
}
