import 'package:equatable/equatable.dart';

class OnboardingState extends Equatable {
  final int currentSlide;
  final String email;
  final String password;
  final bool isPasswordVisible;
  final bool isFormValid;
  final LoginStatus? status;
  final String emailError;
  final String passwordError;
  final String errorMessage;

  const OnboardingState({
    required this.currentSlide,
    this.email = '',
    this.password = '',
    this.isPasswordVisible = false,
    this.isFormValid = false,
    this.status = LoginStatus.initial,
    this.emailError = '',
    this.passwordError = '',
    this.errorMessage = '',
  });

  OnboardingState copyWith({
    int? currentSlide,
    String? email,
    String? password,
    bool? isPasswordVisible,
    bool? isFormValid,
    LoginStatus? status,
    String? emailError,
    String? passwordError,
    String? errorMessage,
  }) {
    return OnboardingState(
      currentSlide: currentSlide ?? this.currentSlide,
      email: email ?? this.email,
      password: password ?? this.password,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
      isFormValid: isFormValid ?? this.isFormValid,
      status: status ?? this.status,
      emailError: emailError ?? this.emailError,
      passwordError: passwordError ?? this.passwordError,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  @override
  List<Object> get props => [
    currentSlide,
    email,
    password,
    isPasswordVisible,
    isFormValid,
    ?status,
    emailError,
    passwordError,
    errorMessage,
  ];
}

enum LoginStatus { initial, loading, success, failure }
