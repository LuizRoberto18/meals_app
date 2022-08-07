import 'package:flutter/material.dart';

import '../components/main_drawer.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text("Configurações"),
      ),
      body: Center(
        child: Text("Configurações"),
      ),
    );
  }
}
