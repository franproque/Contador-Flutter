import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

//Criando o primeiro widget
class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int counter = 0;

  bool get isFull => counter > 10;
  void incremet() {
    setState(() {
      counter++;
    });

    print(counter);
  }

  void decrement() {
    setState(() {
      if (counter > 0) {
        counter--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: avoid_unnecessary_containers
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
                'assets/high-angle-delicious-brazilian-food-composition.jpg'),
          ),
        ),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(isFull ? 'Lotado' : 'Vagas',
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold)),
          Text(
            counter.toString(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 100,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: incremet,
                child: const Text('Entrada',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    )),
                style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all(
                    const Size(100, 100),
                  ),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all(Colors.white70),
                ),
              ),
              const SizedBox(
                width: 64,
              ),
              TextButton(
                onPressed: decrement,
                child: const Text('Saiu',
                    style: TextStyle(color: Colors.black, fontSize: 20)),
                style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all(Colors.white70),
                    fixedSize: MaterialStateProperty.all(const Size(100, 100))),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
