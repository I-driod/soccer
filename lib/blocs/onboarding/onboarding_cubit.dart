import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:soccers/blocs/onboarding/onboarding_state.dart';

import '../../ui/screens/auth/auth_screen.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(const OnboardingState(currentSlide: 1));

  final PageController controller = PageController();

  void next(BuildContext context) {
    if (state.currentSlide < 3) {
      controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      emit(OnboardingState(currentSlide: state.currentSlide + 1));
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (builder) {
            return AuthScreen();
          },
        ),
      );
    }
  }

  void onChangePage(int index) {
    emit(OnboardingState(currentSlide: index + 1));
  }

  void emailChanged(String emailOrPhone) {
    emit(
      state.copyWith(
        email: emailOrPhone,
        emailError: _validateEmail(emailOrPhone),
      ),
    );
    _validateForm();
  }

  String _validateEmail(String emailOrPhone) {
    if (emailOrPhone.isEmpty) {
      return 'Email or phone is required';
    }

    return '';
  }

  String _validatePassword(String password) {
    if (password.isEmpty) {
      return 'Password is required';
    }
    return '';
  }

  void _validateForm() {
    final isFormValid = state.email.isNotEmpty && state.password.isNotEmpty;
    emit(state.copyWith(isFormValid: isFormValid));
  }

  void clearErrors() {
    emit(state.copyWith(emailError: '', status: LoginStatus.initial));
  }
}
