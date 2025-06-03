import 'package:flutter/material.dart';

class OnboardingWidget extends StatelessWidget {
  final String title;
  final String subTitle;
  final String image;

  const OnboardingWidget({
    super.key,
    required this.title,
    required this.subTitle,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox.expand(child: Image.asset(image, fit: BoxFit.cover)),
        DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF010101),
                Color(0xFFDBE13A).withValues(alpha: 0.5),
                Color(0xFFFAE10F).withValues(alpha: 0.1),
              ],
              stops: [0.3, 0.5, .9],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 10,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                    Text(
                      subTitle,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Theme.of(context).colorScheme.primaryFixed,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 150),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
