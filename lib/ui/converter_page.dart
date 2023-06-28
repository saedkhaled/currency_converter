import 'package:currency_converter/modules/currency_converter/converter_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'currency_dropdown.dart';
import 'num_pad.dart';

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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(
                    () => CurrencyDropdown(
                      currencies: _controller.supportedCurrencies.value,
                      selectedCurrency: _controller.fromCurrency.value,
                      onCurrencyChanged: _controller.onFromCurrencyChanged,
                    ),
                  ),
                  Obx(
                    () => Text(
                      _controller.amount.value.toString(),
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(
                    () => CurrencyDropdown(
                      currencies: _controller.supportedCurrencies.value,
                      selectedCurrency: _controller.toCurrency.value,
                      onCurrencyChanged: _controller.onToCurrencyChanged,
                    ),
                  ),
                  Obx(
                    () => Text(
                      _controller.result.value.toString(),
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          NumPad(onKeyPressed: (value) => _controller.onKeyPressed(value)),
        ],
      ),
    );
  }
}
