import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soccers/repositories/auth_repository.dart';
import 'package:soccers/ui/screens/onboarding/onboarding.dart';

import 'blocs/onboarding/onboarding_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'data/remote/auth_api_service.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final authApiService = AuthApiService();

    final authRepository = AuthRepositoryImpl(authApiService);
    return MultiBlocProvider(
      providers: [
        BlocProvider<OnboardingCubit>(
          create: (context) => OnboardingCubit(authRepository),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(primarySwatch: Colors.purple),
        home: const OnboardingScreen(),
      ),
    );
  }
}
