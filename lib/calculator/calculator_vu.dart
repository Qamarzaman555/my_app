import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'calculator_vm.dart';

class CalculatorVU extends StackedView<CalculatorVM> {
  const CalculatorVU({super.key});

  @override
  Widget builder(BuildContext context, CalculatorVM viewModel, Widget? child) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Calclator"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          AnimatedContainer(
            duration: const  Duration(seconds:1),
            child: const Padding(
              padding:  EdgeInsets.all(16.0),
              child:  Column(children: [Text('data'),Text('data'),Text('data'),Text('data'),Text('data'),Text('data'),],),
            ),
          ),
        ],
      ),
    );
  }

  @override
  CalculatorVM viewModelBuilder(BuildContext context) => CalculatorVM();
}
