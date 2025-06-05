import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:soccers/blocs/onboarding/onboarding_state.dart';

import '../../repositories/auth_repository.dart';
import '../../ui/screens/auth/auth_screen.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  final AuthRepository authRepository;

  OnboardingCubit(this.authRepository)
    : super(const OnboardingState(currentSlide: 1));

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
      return 'Oops! email is invalid';
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

  void toggleVisibility() {
    emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));
  }

  void passwordChanged(String password) {
    emit(
      state.copyWith(
        password: password,
        passwordError: _validatePassword(password),
      ),
    );
    _validateForm();
  }

  Future<void> login() async {
    if (state.emailError.isEmpty &&
        state.passwordError.isEmpty &&
        state.email.isNotEmpty &&
        state.password.isNotEmpty) {
      emit(state.copyWith(status: LoginStatus.loading));

      try {
        final response = await authRepository.login(
          state.email,
          state.password,
        );

        emit(state.copyWith(status: LoginStatus.success));
      } catch (e) {
        emit(
          state.copyWith(
            errorMessage: e.toString(),
            status: LoginStatus.failure,
          ),
        );
      }
    }
  }
}
