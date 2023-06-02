import 'package:flutter_supabase/Models/onboarding_model.dart';
import 'package:flutter_supabase/appConstants/assetsPath.dart/assets_path.dart';

class OnBoardingData {
  List<DataModel> datalist = [
    DataModel(
        onboardingImage: AssetsPath.onBoarding1,
        onboardingTitle: 'Ask your Queries',
        onboardingDesp:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry.'),
    DataModel(
        onboardingImage: AssetsPath.onBoarding2,
        onboardingTitle: "Learn from top\nMentors in Your Budget",
        onboardingDesp:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry.'),
    DataModel(
        onboardingImage: AssetsPath.onBoarding3,
        onboardingTitle: 'Right place to Grow\nyour Skills',
        onboardingDesp:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry.')
  ];
}
