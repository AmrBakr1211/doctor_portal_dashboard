import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';
import 'package:app/core/logic/helper_methods.dart';
import 'package:app/core/logic/input_validator.dart';
import 'package:app/features/auth/occupations/bloc.dart';
import 'package:app/views/auth/components/logo.dart';
import 'package:app/views/auth/login/view.dart';

import '../../../../../core/design/app_button.dart';
import '../../../../../core/design/have_account_or_not.dart';
import '../../../../../core/design/responsive.dart';
import '../../../../../features/auth/nationalites/bloc.dart';
import '../../../../../features/auth/register/bloc.dart';
import '../../../../../features/auth/relations/bloc.dart';
import '../../../../../features/auth/religions/bloc.dart';

part 'btn.dart';
part 'date_of_birth.dart';
part 'district_and_city.dart';
part 'drop_down.dart';
part 'email_religions.dart';
part 'full_name.dart';
part 'input.dart';
part 'mobile_gender_date.dart';
part 'name_mobile_relations.dart';
part 'nationalities.dart';
part 'nationalities_and_occupations.dart';
part 'occupations.dart';
part 'relations.dart';
part 'religions.dart';

class RegisterForm extends StatefulWidget {

  const RegisterForm({Key? key}) : super(key: key);

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final bloc = KiwiContainer().resolve<RegisterBloc>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Form(
        key: bloc.formKey,
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
                horizontal: !Responsive.isWeb(context) ? 24 : 64, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Logo(),
                const Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    "Register new member",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 28,
                        color: Color(0xff414D55)),
                  ),
                ),
                const SizedBox(height: 24),
                _FullName(bloc: bloc),
                const SizedBox(height: 24),
                _NationalitiesAndOccupations(
                  onSelectNationalities: (value) {
                    bloc.selectedNationalityID = value;
                  },
                  onSelectOccupations: (value) {
                    bloc.selectedOccupationsID = value;
                  },
                ),
                const SizedBox(height: 16),
                _DistrictAndCity(bloc: bloc),
                const SizedBox(height: 16),
                _MobileGenderDate(bloc: bloc),
                const SizedBox(height: 16),
                _EmailReligions(bloc: bloc),
                const SizedBox(height: 32),
                const Text(
                  "To Contact in emergency",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff414D55)),
                ),
                const SizedBox(height: 16),
                _NameMobileRelations(bloc: bloc),
                const SizedBox(height: 16),
                const SizedBox(height: 32),
                _Btn(bloc: bloc),
                const HaveAccountOrNo( isCreate: false),
                const SizedBox(height: 44)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
