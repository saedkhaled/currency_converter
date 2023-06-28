import 'package:currency_converter/modules/currency_converter/converter_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../ui/widgets/currency_row.dart';
import '../../ui/widgets/num_pad.dart';

class ConverterPage extends StatefulWidget {
  const ConverterPage({Key? key}) : super(key: key);

  @override
  State<ConverterPage> createState() => _ConverterPageState();
}

class _ConverterPageState extends State<ConverterPage> {
  final ConverterController _controller = ConverterController();

  @override
  void initState() {
    _controller.message.listen((msg) {
      if (msg.isNotEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(msg),
            duration: const Duration(seconds: 1),
          ),
        );
      }
    });
    super.initState();
  }

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
        children: <Widget>[
          Expanded(
            child: LayoutBuilder(
              builder: (ctx, constraints) => RefreshIndicator(
                onRefresh: () async => _controller.refresh(),
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    height: constraints.maxHeight,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Obx(
                          () => CurrencyRow(
                            isLoading: _controller.isLoading.value,
                            currencies: _controller.supportedCurrencies.value,
                            selectedCurrency: _controller.fromCurrency.value,
                            onCurrencyChanged:
                                _controller.onFromCurrencyChanged,
                            amount: _controller.amount.value.toString(),
                          ),
                        ),
                        Obx(
                          () => CurrencyRow(
                            isLoading: _controller.isLoading.value,
                            currencies: _controller.supportedCurrencies.value,
                            selectedCurrency: _controller.toCurrency.value,
                            onCurrencyChanged: _controller.onToCurrencyChanged,
                            amount: _controller.result.value.toString(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          NumPad(onKeyPressed: (value) => _controller.onKeyPressed(value)),
        ],
      ),
    );
  }
}
