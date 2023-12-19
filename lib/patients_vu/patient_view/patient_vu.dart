import 'package:flutter/material.dart';
import 'package:my_app/patients_vu/patient_form/patient_form_vu.dart';
import 'package:stacked/stacked.dart';

import 'patient_vm.dart';

class PatientVU extends StackedView<PatientVM> {
  const PatientVU({super.key});

  @override
  Widget builder(BuildContext context, PatientVM viewModel, Widget? child) =>
      Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          title: const Text('Patients'),
          centerTitle: true,
          leading: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              color: Colors.grey.shade100,
              child: const Icon(Icons.menu),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 12),
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.red[100],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.ondemand_video_outlined,
                  color: Colors.red,
                ),
              ),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Search Patient',
                  hintStyle: const TextStyle(color: Colors.grey),
                  suffixIcon: const Icon(Icons.search, color: Colors.grey),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none),
                ),
              ),
              const SizedBox(height: 12),
              Expanded(
                child: ListView.builder(
                    itemCount: viewModel.patientsList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.white,
                          ),
                          padding: const EdgeInsets.all(12),
                          width: MediaQuery.sizeOf(context).width,
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${viewModel.patientsList[index].patientName}',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16),
                                    ),
                                    Text(
                                      '${viewModel.patientsList[index].regNo}',
                                      style: const TextStyle(
                                          color: Colors.grey, fontSize: 14),
                                    ),
                                    IntrinsicHeight(
                                        child: Row(
                                      children: [
                                        Text(
                                          '${viewModel.patientsList[index].gender}',
                                          style: const TextStyle(
                                              color: Colors.grey, fontSize: 14),
                                        ),
                                        const VerticalDivider(
                                          color: Colors.grey,
                                        ),
                                        Text(
                                          '${viewModel.patientsList[index].age}',
                                          style: const TextStyle(
                                              color: Colors.grey, fontSize: 14),
                                        ),
                                      ],
                                    )),
                                  ],
                                ),
                              ),
                              IconButton(
                                  onPressed: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return PatientFormVU(
                                        patient: viewModel.patientsList[index],
                                      );
                                    })).then((value) {
                                      if (value != null) {
                                        viewModel.onUpdatePatient(value, index);
                                      }
                                    });
                                  },
                                  icon: const Icon(
                                    Icons.edit,
                                    color: Colors.green,
                                  )),
                              IconButton(
                                  onPressed: () {
                                    viewModel.onDeletePatient(index);
                                  },
                                  icon: const Icon(
                                    Icons.delete_outline,
                                    color: Colors.red,
                                  )),
                            ],
                          ),
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return PatientFormVU();
            })).then((value) {
              if (value != null) {
                viewModel.onAddPatient(value);
              }
            });
          },
          child: const Icon(Icons.add),
        ),
      );

  @override
  PatientVM viewModelBuilder(BuildContext context) => PatientVM();
}
