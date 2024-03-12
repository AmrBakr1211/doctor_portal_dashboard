import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:app/core/design/app_image.dart';

part 'components/admitted.dart';

part 'components/from.dart';

part 'components/emergency_contact.dart';

part 'components/vital_signs.dart';

part 'components/toggle.dart';

part 'components/radio_select.dart';

part 'components/medical_route_dose.dart';

part 'components/allergies.dart';

part 'components/nutrition.dart';

part 'components/outside_data.dart';

part 'components/bowel_or_genitourinary.dart';

part 'components/prosthesis.dart';

part 'components/valuables.dart';

part 'components/header.dart';

class AdmissionInfoPage extends StatefulWidget {
  static const route = "/admissionInfo";

  const AdmissionInfoPage({Key? key}) : super(key: key);

  @override
  State<AdmissionInfoPage> createState() => _AdmissionInfoPageState();
}

class _AdmissionInfoPageState extends State<AdmissionInfoPage> {
  bool isBottomShown = true;
  bool isGrid = true;

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
            padding: const EdgeInsets.all(8),
            child: isGrid ? shape1 : shape2,
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

  Widget get shape1 {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _Header(),
        // SizedBox(height: 24),
        SizedBox(height: 8),
        IconButton(
            onPressed: () {
              isGrid = !isGrid;
              setState(() {});
            },
            icon: Icon(
              isGrid ? Icons.grid_3x3 : Icons.more_horiz_rounded,
            )),
        SizedBox(height: 8),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: _Admitted()),
            SizedBox(width: 12),
            Expanded(child: _From()),
            SizedBox(width: 12),
            Expanded(child: _EmergencyContact()),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: _VitalSigns()),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: _RadioSelect(title: "Patient Position", list: ["Standard", "Sitting", "Lying"])),
            SizedBox(width: 12),
            Expanded(child: _RadioSelect(title: "Disposition", list: ["Home", "Pharmacy"])),
            SizedBox(width: 12),
            Expanded(child: _RadioSelect(title: "Medication", list: ["None", "Yes"])),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: _MedicalRouteDose()),
            SizedBox(width: 12),
            Expanded(child: _Allergies()),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: _RadioSelect(
                title: "Immunizations",
                list: ["Yes", "No", "Unknown"],
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: _RadioSelect(
                title: "Record",
                list: ["Yes", "No"],
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: _RadioSelect(
                title: "Hygiene",
                list: ["Hygiene", "Poor (Requires Technician )"],
              ),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: _Nutrition()),
            SizedBox(width: 12),
            Expanded(child: _OutSideData()),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: _BowelOrGenitourinary(isBowel: true)),
            SizedBox(width: 12),
            Expanded(child: _BowelOrGenitourinary(isBowel: false)),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: _RadioSelect(title: "Assist", list: ["Yes", "No"]),
            ),
            SizedBox(width: 12),
            Expanded(
              child: _RadioSelect(title: "Clinic APPT", list: ["Yes", "No", "Clinic Contracted"]),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: _Prosthesis(),
            ),
            SizedBox(width: 12),
            Expanded(
              child: _Valuables(),
            ),
          ],
        ),
      ],
    );
  }

  int selectedIndex = 0;

  Widget get shape2 {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _Header(),
        SizedBox(height: 8),
        // SizedBox(height: 24),
        IconButton(
            onPressed: () {
              isGrid = !isGrid;
              setState(() {});
            },
            icon: Icon(
              isGrid ? Icons.grid_3x3 : Icons.more_horiz_rounded,
            )),
        SizedBox(height: 8),
        _Admitted(),
        _From(),
        _EmergencyContact(),
        _VitalSigns(),
        _RadioSelect(title: "Patient Position", list: ["Standard", "Sitting", "Lying"]),
        _RadioSelect(title: "Disposition", list: ["Home", "Pharmacy"]),
        _RadioSelect(title: "Medication", list: ["None", "Yes"]),
        _MedicalRouteDose(),
        _Allergies(),
        _RadioSelect(
          title: "Immunizations",
          list: ["Yes", "No", "Unknown"],
        ),
        _RadioSelect(
          title: "Record",
          list: ["Yes", "No"],
        ),
        _RadioSelect(
          title: "Hygiene",
          list: ["Hygiene", "Poor (Requires Technician )"],
        ),
        _Nutrition(),
        _OutSideData(),
        _BowelOrGenitourinary(isBowel: true),
        _BowelOrGenitourinary(isBowel: false),
        _RadioSelect(title: "Assist", list: ["Yes", "No"]),
        _RadioSelect(title: "Clinic APPT", list: ["Yes", "No", "Clinic Contracted"]),
        _Prosthesis(),
        _Valuables(),
      ],
    );
  }
}
