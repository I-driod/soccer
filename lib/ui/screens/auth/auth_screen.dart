import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soccers/blocs/onboarding/onboarding_state.dart';
import 'package:tab_container/tab_container.dart';

import '../../../blocs/onboarding/onboarding_cubit.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OnboardingCubit, OnboardingState>(
      listener: (context, state) {
        if (state.status == LoginStatus.failure &&
            state.errorMessage.isNotEmpty) {
          // ScaffoldMessenger.of(context).clearSnackBars();
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
          context.read<OnboardingCubit>().clearErrors();
        }
      },
      builder: (context, state) {
        final onboardingCubit = context.read<OnboardingCubit>();
        return Scaffold(
          body: Column(
            spacing: 10,
            children: [
              Column(
                children: [
                  Image.asset(
                    "assets/football.jpg",
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    height: 5,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFFFFCE00), Color(0xFF5B44F0)],
                        stops: [0.3, 0.5],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                    ),
                  ),
                ],
              ),

              Expanded(
                flex: 3,
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  margin: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Color(0xFFE8EAEC),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: TabContainer(
                    tabEdge: TabEdge.top,

                    borderRadius: BorderRadius.circular(10),
                    tabBorderRadius: BorderRadius.circular(10),
                    // childPadding: const EdgeInsets.all(20.0),
                    color: Color(0xFFF8F9F9),
                    selectedTextStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w600,
                    ),
                    unselectedTextStyle: const TextStyle(
                      color: Color(0xFF707070),
                      fontSize: 13.0,
                    ),

                    // colors: [Colors.red, Colors.green],
                    tabs: [Text('Sign In'), Text('Sign Up')],
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(9.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            SizedBox(height: 20),
                            Text(
                              'Enter your account details to access profile',
                            ),
                            SizedBox(height: 20),

                            AppTextField(
                              onChanged: (value) =>
                                  onboardingCubit.emailChanged(value),
                              labelText: "Email Address",
                              errorText: state.emailError.isNotEmpty
                                  ? state.emailError
                                  : null,
                            ),
                            const SizedBox(height: 20),
                            AppTextField(
                              labelText: "Password",
                              suffixIcon: InkWell(
                                onTap: () => onboardingCubit.toggleVisibility(),
                                child: state.isPasswordVisible
                                    ? Icon(Icons.visibility_sharp)
                                    : Icon(Icons.visibility_off_outlined),
                              ),
                              errorText: state.passwordError.isNotEmpty
                                  ? state.passwordError
                                  : null,
                              isPasswordVisible: !state.isPasswordVisible,
                              onChanged: (value) =>
                                  onboardingCubit.passwordChanged(value),
                            ),

                            // AppTextField(onboardingCubit: onboardingCubit),
                          ],
                        ),
                      ),
                      SizedBox(child: Text('Sign Up')),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(8),
                width: double.infinity,
                child: FilledButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Color(0xFF5B44F0)),
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  onPressed: () {
                    onboardingCubit.login();
                  },
                  child: Text('Continue'),
                ),
              ),
              Expanded(child: SizedBox()),
            ],
          ),
        );
      },
    );
    ;
  }
}

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    this.errorText,
    this.suffixIcon,

    this.isPasswordVisible,
    this.onChanged,
    this.labelText,
  });

  final String? errorText;
  final Widget? suffixIcon;

  final bool? isPasswordVisible;
  final Function(String)? onChanged;
  final String? labelText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: labelText,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        errorText: errorText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),

        suffixIcon: suffixIcon,
      ),

      enableSuggestions: false,
      autocorrect: false,
      obscuringCharacter: '●',
      obscureText: isPasswordVisible ?? false,

      onChanged: onChanged,
    );
  }
}
