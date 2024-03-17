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
part 'components/header.dart';
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
            child: Column(
              children: [
                if(Responsive.isWeb(context ))
                _Header(),
                SizedBox(height: 24),
                GridView(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: Responsive.gridView3ItemCount(context),
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 384 / 396,
                  ),
                  children: [
                    _Admitted(),
                    _From(),
                    _EmergencyContact(),
                    _VitalSigns1(),
                    _VitalSigns2(),
                    _PatientPositionDispositionMedication(),
                    _ImmunizationsRecordHygieneAssistClinic(),
                    _Nutrition(),
                    _BowelOrGenitourinary(isBowel: true),
                    _Prosthesis(),
                    _OutSideData(),
                    _BowelOrGenitourinary(isBowel: false),
                    _Valuables(),
                    _MedicalAllergies(),
                  ],
                ),
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
              icon: const AppImage("save_data.svg"),
            )
          : null,
    );
  }
}
