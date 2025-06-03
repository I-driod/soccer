import 'package:equatable/equatable.dart';

class OnboardingState extends Equatable {
  final int currentSlide;
  final String email;
  final String password;
  final bool isPasswordVisible;
  final bool isFormValid;
  final LoginStatus? status;
  final String emailError;

  const OnboardingState({
    required this.currentSlide,
    this.email = '',
    this.password = '',
    this.isPasswordVisible = false,
    this.isFormValid = false,
    this.status = LoginStatus.initial,
    this.emailError = '',
  });

  OnboardingState copyWith({
    int? currentSlide,
    String? email,
    String? password,
    bool? isPasswordVisible,
    bool? isFormValid,
    LoginStatus? status,
    String? emailError,
  }) {
    return OnboardingState(
      currentSlide: currentSlide ?? this.currentSlide,
      email: email ?? this.email,
      password: password ?? this.password,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
      isFormValid: isFormValid ?? this.isFormValid,
      status: status ?? this.status,
      emailError: emailError ?? this.emailError,
    );
  }

  @override
  List<Object> get props => [currentSlide];
}

enum LoginStatus { initial, loading, success, failure }
