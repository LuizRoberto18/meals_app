import 'package:flutter/material.dart';

import '../utils/app_routes.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.black,
              image: DecorationImage(
                fit: BoxFit.cover,
                opacity: 0.9,
                image: AssetImage("assets/images/bg.png"),
              ),
            ),
          ),
          Container(
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black.withOpacity(0),
                  Colors.black.withOpacity(0.4),
                  Colors.black,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 450,
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const Text(
                      "Não fique parado, aqui você aprende com os melhores!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'RobotoCondensed',
                        fontWeight: FontWeight.w900,
                        fontSize: 40,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Personalize suas receitas para deixar a sua cara, com passo a passo simples e fácil.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Raleway',
                        fontSize: 17,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 45),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed(
                          AppRoutes.mainHome,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(240, 60),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        textStyle: const TextStyle(
                          fontFamily: 'RobotoCondensed',
                          fontWeight: FontWeight.w900,
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      child: const Text("Vamos Cozinhar!"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
