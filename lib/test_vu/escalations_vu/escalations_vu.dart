import 'package:flutter/material.dart';
import 'package:my_app/test_vu/escalations_vu/alert_dialogue_vu.dart';
import 'package:my_app/test_vu/escalations_vu/escalations_vm.dart';
import 'package:stacked/stacked.dart';

class EscalationsVU extends StackedView<EscalationsVM> {
  const EscalationsVU({super.key});

  @override
  Widget builder(BuildContext context, EscalationsVM viewModel, Widget? child) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Dialog(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      backgroundColor: Colors.white,
                      child: const AlertDialogueVU());
                });
          },
          child: const Text('Next'),
        ),
      ),
    );
  }

  @override
  EscalationsVM viewModelBuilder(BuildContext context) {
    return EscalationsVM();
  }
}
