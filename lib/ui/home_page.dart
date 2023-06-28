import 'package:flutter/material.dart';

import '../modules/currency_converter/converter_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red.shade800,
      appBar: AppBar(
        backgroundColor: Colors.red.shade800,
        title: const Text(
          'Currency Converter',
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Icon(
              Icons.currency_exchange_rounded,
              size: 200,
              color: Colors.white,
            ),
            const SizedBox(height: 80),
            TextButton(
              onPressed: () => Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (ctx) => const ConverterPage())),
              child: const Text(
                'Change',
                style: TextStyle(fontSize: 50, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
