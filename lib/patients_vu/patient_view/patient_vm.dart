import 'package:my_app/patients_vu/patient_model.dart';
import 'package:stacked/stacked.dart';

class PatientVM extends BaseViewModel {
  List<PatientModel> patientsList = [
    PatientModel(
        patientName: 'M. Bilal Liaquat',
        regNo: 'CHI-NH-0012',
        gender: 'Male',
        age: 28),
    PatientModel(
        patientName: 'Shah Zaman',
        regNo: 'CHI-NH-0013',
        gender: 'Male',
        age: 30),
    PatientModel(
        patientName: 'Hassan Syed',
        regNo: 'CHI-NH-0014',
        gender: 'Male',
        age: 32),
    PatientModel(
      patientName: 'Hassan Zaman',
      regNo: 'CHI-NH-0016',
      gender: 'Male',
      age: 28,
    )
  ];

  onDeletePatient(int index) {
    patientsList.removeAt(index);
    notifyListeners();
  }

  onAddPatient(value) {
    patientsList.add(value);
    notifyListeners();
  }

  onUpdatePatient(value, index) {
    patientsList[index] = value;
    notifyListeners();
  }
}
