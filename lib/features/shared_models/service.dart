class ServiceModel {
  late String laboratory, radiology, treatment, pharmacy;

  ServiceModel.fromJson(Map<String, dynamic> json) {
    laboratory = json['Laboratory'] ?? "";
    radiology = json['Radiology'] ?? "";
    treatment = json['Treatment'] ?? "";
    pharmacy = json['Pharmacy'] ?? "";
  }
}
