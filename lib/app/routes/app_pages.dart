import 'package:get/get.dart';
import 'package:mcqs_app/app/modules/jobs/views/job_company_details.dart';
import 'package:mcqs_app/app/modules/quiz/views/quiz_score_card.dart';

import '../modules/auth/bindings/auth_binding.dart';
import '../modules/auth/bindings/register_binding.dart';
import '../modules/auth/bindings/signin_binding.dart';
import '../modules/auth/views/auth_view.dart';
import '../modules/auth/views/register_view.dart';
import '../modules/auth/views/signin_view.dart';

import '../modules/quiz/bindings/createquiz_binding.dart';
import '../modules/quiz/views/createquiz_view.dart';
import '../modules/quiz/bindings/createquizquestions_binding.dart';
import '../modules/quiz/views/createquizquestions_view.dart';
import '../modules/explore/bindings/explore_binding.dart';
import '../modules/explore/views/explore_view.dart';
import '../modules/explore/bindings/explorestudymcqs_binding.dart';
import '../modules/explore/views/explorestudymcqs_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/jobs/bindings/jobs_binding.dart';
import '../modules/jobs/views/jobs_details.dart';
import '../modules/jobs/views/jobs_view.dart';
import '../modules/quiz/bindings/joinquiz_binding.dart';
import '../modules/quiz/views/joinquiz_view.dart';
import '../modules/mcqs/bindings/mcqs_binding.dart';
import '../modules/mcqs/bindings/score_card_binding.dart';
import '../modules/mcqs/views/mcqs_questions_view.dart';
import '../modules/mcqs/views/mcqs_view.dart';
import '../modules/mcqs/views/score_card_view.dart';
import '../modules/onboarding/bindings/onboarding_binding.dart';
import '../modules/onboarding/views/onboarding_view.dart';
import '../modules/quiz/bindings/onetoonequiz_binding.dart';
import '../modules/quiz/views/onetoonequiz_view.dart';
import '../modules/quiz/bindings/onetoonequizquestions_binding.dart';
import '../modules/quiz/views/onetoonequizquestions_view.dart';
import '../modules/quiz/bindings/onetoonescorecard_binding.dart';
import '../modules/quiz/views/onetoonescorecard_view.dart';
import '../modules/premium/bindings/premium_binding.dart';
import '../modules/premium/views/premium_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/quiz/bindings/quiz_binding.dart';
import '../modules/quiz/bindings/onetoone_binding.dart';
import '../modules/quiz/views/onetoone_view.dart';
import '../modules/quiz/views/quiz_questions.dart';
import '../modules/quiz/views/quiz_view.dart';
import '../modules/quiz/views/simplequiz_catagories.dart';
import '../modules/quiz/bindings/sharequiz_binding.dart';
import '../modules/quiz/views/sharequiz_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.ONBOARDING,
      page: () => OnboardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: _Paths.SIGNIN,
      page: () => const SigninView(),
      binding: SigninBinding(),
    ),
    GetPage(
      name: _Paths.AUTH,
      page: () => const AuthView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.MCQS,
      page: () => const McqsView(),
      binding: McqsBinding(),
    ),
    GetPage(
      name: _Paths.McqsQuestionsView,
      page: () => const McqsQuestionsView(),
      binding: McqsBinding(),
    ),
    GetPage(
      name: _Paths.ScoreCardView,
      page: () => const ScoreCardView(),
      binding: ScoreCardBinding(), // Correct binding for ScoreCardView
    ),
    GetPage(
      name: _Paths.QUIZ,
      page: () => const QuizView(),
      binding: QuizBinding(),
    ),
    GetPage(
      name: _Paths.SimplequizCatagories,
      page: () => const SimplequizCatagories(),
      binding: QuizBinding(),
    ),
    GetPage(
      name: _Paths.QuizQuestions,
      page: () => const QuizQuestions(),
      binding: QuizBinding(),
    ),
    GetPage(
      name: _Paths.QuizScoreCard, // Should match the constant definition
      page: () => const QuizScoreCard(),
      binding: QuizBinding(),
    ),
    GetPage(
      name: _Paths.EXPLORE,
      page: () => const ExploreView(),
      binding: ExploreBinding(),
    ),
    GetPage(
      name: _Paths.JOBS,
      page: () => const JobsView(),
      binding: JobsBinding(),
    ),
    GetPage(
      name: _Paths.JobsDetails,
      page: () => const JobsDetails(), // Ensure JobsDetails is imported
      binding: JobsBinding(), // Use the relevant binding, if necessary
    ),
    GetPage(
      name: Routes.JobCompanyDetails,
      page: () => const JobCompanyDetails(),
      binding: JobsBinding(), // This should be your screen widget
    ),
    GetPage(
      name: _Paths.ONETOONE,
      page: () => const OnetooneView(),
      binding: OnetooneBinding(),
    ),
    GetPage(
      name: _Paths.ONETOONEQUIZ,
      page: () => const OnetoonequizView(),
      binding: OnetoonequizBinding(),
    ),
    GetPage(
      name: _Paths.ONETOONEQUIZQUESTIONS,
      page: () => const OnetoonequizquestionsView(),
      binding: OnetoonequizquestionsBinding(),
    ),
    GetPage(
      name: _Paths.ONETOONESCORECARD,
      page: () => const OnetoonescorecardView(),
      binding: OnetoonescorecardBinding(),
    ),
    GetPage(
      name: _Paths.JOINQUIZ,
      page: () => const JoinquizView(),
      binding: JoinquizBinding(),
    ),
    GetPage(
      name: _Paths.CREATEQUIZ,
      page: () => const CreatequizView(),
      binding: CreatequizBinding(),
    ),
    GetPage(
      name: _Paths.CREATEQUIZQUESTIONS,
      page: () => const CreatequizquestionsView(),
      binding: CreatequizquestionsBinding(),
    ),
    GetPage(
      name: _Paths.SHAREQUIZ,
      page: () => const SharequizView(),
      binding: SharequizBinding(),
    ),
    GetPage(
      name: _Paths.EXPLORESTUDYMCQS,
      page: () => const ExplorestudymcqsView(),
      binding: ExplorestudymcqsBinding(),
    ),
    GetPage(
      name: _Paths.PREMIUM,
      page: () => const PremiumView(),
      binding: PremiumBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
  ];
}
