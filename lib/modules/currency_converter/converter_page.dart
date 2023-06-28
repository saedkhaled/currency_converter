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
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/images/bg.png'),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.sizeOf(context).height,
            child: Column(
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
                                  controller: _controller.valueController,
                                  onAmountChanged: (value) => _controller.convert(),
                                ),
                              ),
                              IconButton(
                                onPressed: () => _controller.swapCurrencies(),
                                icon: const Icon(
                                  Icons.change_circle_outlined,
                                  size: 50,
                                  color: Colors.white,
                                ),
                              ),
                              Obx(
                                () => CurrencyRow(
                                  isLoading: _controller.isLoading.value,
                                  currencies: _controller.supportedCurrencies.value,
                                  selectedCurrency: _controller.toCurrency.value,
                                  onCurrencyChanged:
                                      _controller.onToCurrencyChanged,
                                  controller: _controller.resultController,
                                  isFieldDisabled: true,
                                  onAmountChanged: (value) => _controller.convert(),
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
          ),
        ),
      ),
    );
  }
}
