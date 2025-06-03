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
      listener: (context, state) {},
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
                          children: [
                            Text(
                              'Enter your account details to access profile',
                            ),
                            Text("appLocalization.pleaseEnterEmail"),
                            const SizedBox(height: 40),

                            Text("     // appLocalization.email,"),

                            TextFormField(
                              onChanged: (value) =>
                                  onboardingCubit.emailChanged(value),
                              forceErrorText: state.emailError.isNotEmpty
                                  ? state.emailError
                                  : null,
                              decoration: InputDecoration(
                                labelText: appLocalization.enterYourEmail,
                                hintStyle: AppStyles.bodyLargeRegular,
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                prefixIcon: Image.asset(AppIcons.message),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              appLocalization.password,
                              style: AppStyles.bodyXLargeSemibold,
                            ),
                            SizedBox(height: AppSizes.getSize8(context)),
                            // Password Input
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: appLocalization.enterPass,
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                errorText: state.passwordError.isNotEmpty
                                    ? state.passwordError
                                    : null,
                                prefixIcon: Image.asset(AppIcons.lock),
                                suffixIcon: InkWell(
                                  onTap: () => context
                                      .read<LoginCubit>()
                                      .toggleVisibility(),
                                  child: state.isPasswordVisible
                                      ? Image.asset(AppIcons.eyeShow)
                                      : Image.asset(AppIcons.eyeHide),
                                ),
                              ),
                              style: AppStyles.bodyXLargeSemibold,
                              enableSuggestions: false,
                              autocorrect: false,
                              obscuringCharacter: '●',
                              obscureText: !state.isPasswordVisible,
                              onChanged: (value) => context
                                  .read<LoginCubit>()
                                  .passwordChanged(value),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(child: Text('Sign Up')),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
    ;
  }
}

// TabContainer(
// controller: _controller,
// borderRadius: BorderRadius.zero,
// tabBorderRadius: BorderRadius.zero,
// color: Colors.black,
// duration: const Duration(seconds: 0),
// selectedTextStyle: textTheme.bodyMedium?.copyWith(
// color: Colors.white,
// ),
// unselectedTextStyle: textTheme.bodyMedium?.copyWith(
// color: Colors.black,
// ),
// tabs: _getTabs2(),
// children: _getChildren2(),
// ),
