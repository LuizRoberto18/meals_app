import 'package:flutter/material.dart';

import '../components/main_drawer.dart';
import '../models/settings.dart';

class SettingsScreen extends StatefulWidget {
  final Function(Settings) onSettingsChanged;
  final Settings settings;

  const SettingsScreen({
    Key? key,
    required this.onSettingsChanged,
    required this.settings,
  }) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  Settings? settings;

  @override
  void initState() {
    super.initState();
    settings = widget.settings;
  }

  Widget _createSwitch(
    String title,
    String subTitle,
    bool value,
    Function(bool) onChanged,
  ) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subTitle),
      value: value,
      onChanged: (value) {
        onChanged(value);
        widget.onSettingsChanged(settings!);
      },
      activeColor: Theme.of(context).colorScheme.primary,
      inactiveThumbColor: Theme.of(context).colorScheme.secondary,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MainDrawer(),
      appBar: AppBar(
        title: const Text("Configurações"),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "Configurações",
              style: Theme.of(context).textTheme.copyWith().headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _createSwitch(
                  "Sem Glutén",
                  "Só exibe receitas sem glutén!.",
                  settings!.isGlutenFree,
                  (value) {
                    setState(() {
                      settings!.isGlutenFree = value;
                    });
                  },
                ),
                _createSwitch(
                  "Sem Lactose",
                  "Só exibe receitas sem Lactose!.",
                  settings!.isLactoseFree,
                  (value) {
                    setState(() {
                      settings!.isLactoseFree = value;
                    });
                  },
                ),
                _createSwitch(
                  "Vegana",
                  "Só exibe receitas veganas!.",
                  settings!.isVegan,
                  (value) {
                    setState(() {
                      settings!.isVegan = value;
                    });
                  },
                ),
                _createSwitch(
                  "Vegetariana",
                  "Só exibe receitas vegetarianas!.",
                  settings!.isVegetarian,
                  (value) {
                    setState(() {
                      settings!.isVegetarian = value;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
