import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../widgets/layout/root.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Root(
      child: Center(
        child: Text("Home"),
      ),
    );
  }
}