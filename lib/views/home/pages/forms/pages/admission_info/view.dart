import 'package:app/core/design/app_image.dart';
import 'package:app/core/design/app_radio.dart';
import 'package:app/core/design/responsive.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'components/input.dart';

part 'components/admitted.dart';

part 'components/bowel_or_genitourinary.dart';

part 'components/emergency_contact.dart';

part 'components/from.dart';

part 'components/immunizations_record_hygiene_assist_clinic.dart';

part 'components/medical_allergies.dart';

part 'components/nutrition.dart';

part 'components/outside_data.dart';

part 'components/patient_position_disposition_medication.dart';

part 'components/prosthesis.dart';

part 'components/radio_select.dart';

part 'components/toggle.dart';

part 'components/valuables.dart';

part 'components/vital_signs1.dart';

part 'components/vital_signs2.dart';

part 'components/header/header.dart';

part 'components/header/web.dart';

part 'components/header/tablet.dart';

part 'components/header/mobile.dart';

part 'components/header/qr_code.dart';

class AdmissionInfoPage extends StatefulWidget {
  static const route = "/admissionInfo";

  const AdmissionInfoPage({Key? key}) : super(key: key);

  @override
  State<AdmissionInfoPage> createState() => _AdmissionInfoPageState();
}

class _AdmissionInfoPageState extends State<AdmissionInfoPage> {
  bool isBottomShown = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        height: double.infinity,
        child: NotificationListener<ScrollNotification>(
          onNotification: (sn) {
            if (sn.metrics.pixels == sn.metrics.maxScrollExtent && sn.metrics.axisDirection == AxisDirection.down) {
              isBottomShown = false;
            } else {
              isBottomShown = true;
            }
            // todo: make it stream and StreamBuilder instead of setState
            setState(() {});
            return true;
          },
          child: SingleChildScrollView(
            padding: EdgeInsets.all(8),
            child: Column(
              children: [
                _Header(),
                SizedBox(height: 24),
                Responsive(
                    mobile: Column(
                      children: [
                        _Admitted(),
                        SizedBox(height: 8),
                        _From(),
                        SizedBox(height: 8),
                        _EmergencyContact(),
                        SizedBox(height: 8),
                        _VitalSigns1(),
                        SizedBox(height: 8),
                        _VitalSigns2(),
                        SizedBox(height: 8),
                        _PatientPositionDispositionMedication(),
                        SizedBox(height: 8),
                        _ImmunizationsRecordHygieneAssistClinic(),
                        SizedBox(height: 8),
                        _Nutrition(),
                        SizedBox(height: 8),
                        _BowelOrGenitourinary(isBowel: true),
                        SizedBox(height: 8),
                        _Prosthesis(),
                        SizedBox(height: 8),
                        _OutSideData(),
                        SizedBox(height: 8),
                        _BowelOrGenitourinary(isBowel: false),
                        SizedBox(height: 8),
                        _Valuables(),
                        SizedBox(height: 8),
                        _MedicalAllergies()
                      ],
                    ),
                    tablet: Column(
                      children: [
                        IntrinsicHeight(
                          child: Row(
                            children: [
                              Flexible(child: _Admitted()),
                              SizedBox(width: 8),
                              Flexible(child: _From()),
                            ],
                          ),
                        ),
                        SizedBox(height: 8),
                        IntrinsicHeight(
                          child: Row(
                            children: [
                              Flexible(child: _EmergencyContact()),
                              SizedBox(width: 8),
                              Flexible(child: _VitalSigns1()),
                            ],
                          ),
                        ),
                        SizedBox(height: 8),
                        IntrinsicHeight(
                          child: Row(
                            children: [
                              Flexible(child: _VitalSigns2()),
                              SizedBox(width: 8),
                              Flexible(child: _PatientPositionDispositionMedication()),
                            ],
                          ),
                        ),
                        SizedBox(height: 8),
                        IntrinsicHeight(
                          child: Row(
                            children: [
                              Flexible(child: _ImmunizationsRecordHygieneAssistClinic()),
                              SizedBox(width: 8),
                              Flexible(child: _Nutrition()),
                            ],
                          ),
                        ),
                        SizedBox(height: 8),
                        IntrinsicHeight(
                          child: Row(
                            children: [
                              Flexible(child: _BowelOrGenitourinary(isBowel: true)),
                              SizedBox(width: 8),
                              Flexible(child: _Prosthesis()),
                            ],
                          ),
                        ),
                        SizedBox(height: 8),
                        IntrinsicHeight(
                          child: Row(
                            children: [
                              Flexible(child: _OutSideData()),
                              SizedBox(width: 8),
                              Flexible(child: _BowelOrGenitourinary(isBowel: false)),
                            ],
                          ),
                        ),
                        SizedBox(height: 8),
                        IntrinsicHeight(
                          child: Row(
                            children: [
                              Flexible(child: _Valuables()),
                              SizedBox(width: 8),
                              Flexible(child: _MedicalAllergies()),
                            ],
                          ),
                        )
                      ],
                    ),
                    web: Column(
                      children: [
                        IntrinsicHeight(
                          child: Row(
                            children: [
                              Flexible(child: _Admitted()),
                              SizedBox(
                                width: 12,
                              ),
                              Flexible(child: _From()),
                              SizedBox(
                                width: 12,
                              ),
                              Flexible(child: _EmergencyContact()),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        IntrinsicHeight(
                          child: Row(
                            children: [
                              Flexible(child: _VitalSigns1()),
                              SizedBox(
                                width: 12,
                              ),
                              Flexible(child: _VitalSigns2()),
                              SizedBox(
                                width: 12,
                              ),
                              Flexible(child: _PatientPositionDispositionMedication()),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        IntrinsicHeight(
                          child: Row(
                            children: [
                              Flexible(child: _ImmunizationsRecordHygieneAssistClinic()),
                              SizedBox(
                                width: 12,
                              ),
                              Flexible(child: _Nutrition()),
                              SizedBox(
                                width: 12,
                              ),
                              Flexible(child: _BowelOrGenitourinary(isBowel: true)),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        IntrinsicHeight(
                          child: Row(
                            children: [
                              Flexible(child: _Prosthesis()),
                              SizedBox(
                                width: 12,
                              ),
                              Flexible(child: _OutSideData()),
                              SizedBox(
                                width: 12,
                              ),
                              Flexible(child: _BowelOrGenitourinary(isBowel: false)),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        IntrinsicHeight(
                          child: Row(
                            children: [
                              Flexible(child: _Valuables()),
                              SizedBox(
                                width: 12,
                              ),
                              Flexible(child: _MedicalAllergies()),
                              Spacer(),
                            ],
                          ),
                        )
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: isBottomShown
          ? FilledButton.icon(
              onPressed: () {},
              style: FilledButton.styleFrom(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                backgroundColor: const Color(0xff0496FF),
              ),
              label: const Text("Save Data"),
              icon: const AppImage(
                "save_data.svg",
                height: 16,
                width: 16,
                fit: BoxFit.fill,
              ),
            )
          : null,
    );
  }
}
