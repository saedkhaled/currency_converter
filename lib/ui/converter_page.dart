import 'package:currency_converter/modules/currency_converter/converter_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/currency_row.dart';
import 'widgets/num_pad.dart';

class ConverterPage extends StatefulWidget {
  const ConverterPage({Key? key}) : super(key: key);

  @override
  State<ConverterPage> createState() => _ConverterPageState();
}

class _ConverterPageState extends State<ConverterPage> {
  final ConverterController _controller = ConverterController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Currency Converter',
          style: TextStyle(
              fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: [
              Obx(
                () => CurrencyRow(
                  currencies: _controller.supportedCurrencies.value,
                  selectedCurrency: _controller.fromCurrency.value,
                  onCurrencyChanged: _controller.onFromCurrencyChanged,
                  amount: _controller.amount.value.toString(),
                ),
              ),
              const SizedBox(height: 20),
              Obx(
                () => CurrencyRow(
                  currencies: _controller.supportedCurrencies.value,
                  selectedCurrency: _controller.toCurrency.value,
                  onCurrencyChanged: _controller.onToCurrencyChanged,
                  amount: _controller.result.value.toString(),
                ),
              ),
            ],
          ),
          NumPad(onKeyPressed: (value) => _controller.onKeyPressed(value)),
        ],
      ),
    );
  }
}
