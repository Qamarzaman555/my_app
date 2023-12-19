import 'package:flutter/material.dart';
import 'package:my_app/test_vu/escalations_vu/alert_dialogue_vm.dart';
import 'package:stacked/stacked.dart';

class AlertDialogueVU extends StackedView<AlertDialogueVM> {
  const AlertDialogueVU({super.key});

  @override
  Widget builder(
      BuildContext context, AlertDialogueVM viewModel, Widget? child) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                    bottomLeft: Radius.zero,
                    bottomRight: Radius.zero),
                color: Colors.grey[700]),
            height: 44,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 16.0),
                  child: Text(
                    'Create Patient Form',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w300),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(12),
                          bottomLeft: Radius.zero,
                          bottomRight: Radius.zero),
                      color: Colors.blue,
                    ),
                    child: const Icon(
                      Icons.close,
                      size: 28,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomSheet: Container(
        color: Colors.amber,
        width: MediaQuery.sizeOf(context).width,
        height: 100,
      ),
    );
  }

  @override
  AlertDialogueVM viewModelBuilder(BuildContext context) {
    return AlertDialogueVM();
  }
}
