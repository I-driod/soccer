import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:soccers/blocs/onboarding/onboarding_cubit.dart';
import 'package:soccers/blocs/onboarding/onboarding_state.dart';
import 'package:soccers/ui/screens/onboarding/widgets/onbparding_widget.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> pages = [
      {
        'title': 'Home for every sports',
        'subTitle': 'Where every entertainment lives, and brought to you',
        'image': 'assets/football.jpg',
      },
      {
        'title': 'Free Predictions on every sport ',
        'subTitle': 'Where every entertainment lives, and brought to you',
        'image': 'assets/football.jpg',
      },
      {
        'title': '24/7 Live Game Events/Updates',
        'subTitle': 'Where every entertainment lives, and brought to you',
        'image': 'assets/football.jpg',
      },
    ];
    return Scaffold(
      body: BlocConsumer<OnboardingCubit, OnboardingState>(
        listener: (context, state) {},
        builder: (context, state) {
          final onboardingCubit = context.read<OnboardingCubit>();
          return Stack(
            children: [
              PageView.builder(
                itemCount: pages.length,
                controller: onboardingCubit.controller,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, item) {
                  final data = pages[item];
                  return OnboardingWidget(
                    title: data['title'] ?? '',
                    subTitle: data['subTitle'] ?? '',
                    image: data['image'] ?? '',
                  );
                },
              ),
              SizedBox(height: 200),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 82,
                    horizontal: 8,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 24,
                    children: [
                      SmoothPageIndicator(
                        controller: onboardingCubit.controller,
                        count: pages.length,
                        effect: ExpandingDotsEffect(
                          dotHeight: 5,
                          dotWidth: 20,
                          dotColor: Color(0xFFFFFDF5),
                          activeDotColor: Color(0xFF5B44F0),
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: FilledButton(
                          style: ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(
                              Color(0xFF5B44F0),
                            ),
                            shape: WidgetStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                          onPressed: () {
                            onboardingCubit.next(context);
                          },
                          child: Text('Continue'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
