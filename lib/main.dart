import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soccers/repositories/auth_repository.dart';
import 'package:soccers/ui/screens/onboarding/onboarding.dart';
import 'package:soccers/ui/screens/select_fav_club/select_fav_club.dart';

import 'blocs/onboarding/onboarding_cubit.dart';
import 'blocs/select_team/select_team_cubit.dart';
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
        BlocProvider<SelectTeamCubit>(
          create: (context) => SelectTeamCubit(authRepository),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(primarySwatch: Colors.purple),
        home: const AuthGate(),
      ),
    );
  }
}

class AuthGate extends StatelessWidget {
  const AuthGate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Show a loading indicator while waiting for the authentication state
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasData) {
          // User is signed in
          return const SelectTeam();
        } else {
          // User is not signed in
          return const OnboardingScreen();
        }
      },
    );
  }
}
