import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app/core/logic/cache_helper.dart';
import 'package:app/core/logic/helper_methods.dart';

import '../../../../core/logic/dio_helper.dart';

part 'events.dart';
part 'states.dart';

class RegisterBloc extends Bloc<RegisterEvents, RegisterStates> {
  final DioHelper _dio;

  RegisterBloc(this._dio) : super(RegisterStates()) {
    on<RegisterEvent>(_sendData);
  }

  final formKey = GlobalKey<FormState>();

  final firstNameController = TextEditingController();
  final fatherNameController = TextEditingController();
  final grandFatherNameController = TextEditingController();
  final familyNameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final dateController = TextEditingController();
  final cityController = TextEditingController();
  final districtController = TextEditingController();

  final emergencyNameController = TextEditingController();
  final emergencyMobileController = TextEditingController();

  int? selectedNationalityID,
      selectedOccupationsID,
      selectedReligionID,
      selectedRelationId;
  String? selectedGender;


  @override
  Future<void> close() {
    selectedRelationId = null;
    selectedReligionID = null;
    selectedOccupationsID = null;
    selectedNationalityID = null;
    return super.close();
  }

  void _sendData(
    RegisterEvent event,
    Emitter<RegisterStates> emit,
  ) async {
    if (formKey.currentState!.validate()) {
      emit(RegisterLoadingState());
      final response =
          await _dio.send("api/Authorization/PatientRegistration", data: {
        "FirstName": firstNameController.text,
        "FatherName": fatherNameController.text,
        "GrandFatherName": grandFatherNameController.text,
        "FamilyName": familyNameController.text,
        "NationalityID": selectedNationalityID,
        "OccupationID": selectedOccupationsID,
        "City": cityController.text,
        "District": districtController.text,
        "Telephones": phoneController.text,
        "Gender": selectedGender,
        "Dob": dateController.text,
        "NextOfKinName": emergencyNameController.text,
        "NextOfKinMobileNum": emergencyMobileController.text,
        "NextOfKinRelationID": selectedRelationId,
        "Email": emailController.text,
        "FbToken": "",
        "TypeofDevice": "web",
        "RelegionID": selectedReligionID,
        "Lang": CacheHelper.lang == "en" ? 1 : 0
      });
      if (response.isSuccess) {
        emit(RegisterSuccessState(msg: response.msg));
      } else {
        emit(RegisterFailedState(
            msg: response.msg, statusCode: response.statusCode));
      }
    }
  }
}
