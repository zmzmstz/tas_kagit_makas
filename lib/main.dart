import 'dart:ffi';

import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _phoneCounter = 0;
  int _userCounter = 0;
  int phoneChoice = 4;

  void _incrementCounter(int userChoice, int phoneChoice) {
    if (phoneChoice == 0 && userChoice == 0 ||
        phoneChoice == 1 && userChoice == 1 ||
        phoneChoice == 2 && userChoice == 2) {
      //Berabere
    } else if (phoneChoice == 0 && userChoice == 1 ||
        phoneChoice == 1 && userChoice == 2 ||
        phoneChoice == 2 && userChoice == 0) {
      setState(() {
        _userCounter++;
      });
    } else if (phoneChoice == 1 && userChoice == 0 ||
        phoneChoice == 2 && userChoice == 1 ||
        phoneChoice == 0 && userChoice == 2) {
      setState(() {
        _phoneCounter++;
      });
    }
  }

  int choseElement() {
    var random = Random();
    var randomNumber = random.nextInt(3);
    return randomNumber;
  }

  Icon getChoiceIcon(int choice, Color color, double size) {
    switch (choice) {
      case 0:
        return Icon(Icons.lens, size: size, color: color);
      case 1:
        return Icon(Icons.note, size: size, color: color);
      case 2:
        return Icon(Icons.content_cut, size: size, color: color);
      default:
        return Icon(Icons.error, size: size, color: color);
    }
  }

  @override
  Widget build(BuildContext context) {
    String puanMesaji = "Telefonun puanı: " +
        _phoneCounter.toString() +
        "   Benim puanım: " +
        _userCounter.toString();
    if (phoneChoice == 4) {
      // Açılış ekranı
      return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  getChoiceIcon(0, Colors.white, 96),
                  getChoiceIcon(1, Colors.white, 96),
                  getChoiceIcon(2, Colors.white, 96),
                ],
              ),
              SizedBox(height: 150),
              Text(
                "Taş Kağıt Makas Oyunu",
                style: TextStyle(fontSize: 24),
                selectionColor: Colors.white,
              ),
              SizedBox(height: 70),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    phoneChoice = choseElement();
                  });
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                      horizontal: 40, vertical: 20), // Düğme boyutunu ayarlayın
                ),
                child: Text("Oyuna Başla", style: TextStyle(fontSize: 18)),
              ),
              SizedBox(height: 70),
            ],
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: Text(
            "Taş Kağıt Makas Oyunu",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(height: 50),
              Text(
                puanMesaji,
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 120),
              Text(
                "Telefonun seçimi: ",
              ),
              getChoiceIcon(
                  phoneChoice, Theme.of(context).colorScheme.primary, 192),
              SizedBox(height: 200),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          phoneChoice = choseElement();
                        });
                        _incrementCounter(0, phoneChoice);
                      },
                      child: const Text("Taş"),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          phoneChoice = choseElement();
                        });
                        _incrementCounter(1, phoneChoice);
                      },
                      child: const Text("Kağıt"),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          phoneChoice = choseElement();
                        });
                        _incrementCounter(2, phoneChoice);
                      },
                      child: const Text("Makas"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }
  }
}
