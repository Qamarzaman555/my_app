import 'package:flutter/material.dart';
import 'package:my_app/patients_vu/patient_model.dart';
import 'package:stacked/stacked.dart';

class PatientFormVM extends BaseViewModel {
  final formKey = GlobalKey<FormState>();
  PatientModel? patient;

  String? name;
  String? regNo;
  String? gender;
  int? age;

  String? onPatientNameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Patient name is required';
    }
    return null;
  }

  String? onRegNoValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'registeration no is required';
    }
    return null;
  }

  String? onGenderValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Gender is required';
    }
    return null;
  }

  String? onAgeValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Age is required';
    }
    return null;
  }

  onSavedPatient(BuildContext context) {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      patient = PatientModel(
        patientName: name,
        regNo: regNo,
        gender: gender,
        age: age,
      );
      Navigator.pop(context, patient);
    }
  }

  onPatientNameSaved(String? value) {
    name = value;
  }

  onRegNoSaved(String? value) {
    regNo = value;
  }

  onGenderSaved(String? value) {
    gender = value;
  }

  onAgeSaved(String? value) {
    age = int.parse(value!);
  }
}
