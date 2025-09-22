import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart';
import 'screens/onboarding_screen_1.dart';
import 'screens/onboarding_screen_2.dart';
import 'screens/onboarding_screen_3.dart';
import 'screens/onboarding_screen_4.dart';
import 'screens/login_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/privacy_data_screen.dart';
import 'screens/forgot_password_screen.dart';
import 'screens/check_email_screen.dart';
import 'screens/location_services_screen.dart';
import 'screens/notifications_screen.dart';
import 'screens/dashboard_screen.dart';
import 'screens/report_success_screen.dart';
import 'screens/location_screen.dart';
import 'screens/review_report_screen.dart';
import 'screens/emergency_contact_screen.dart';
import 'screens/report_crime_screen.dart';
import 'screens/my_reports_screen.dart';
import 'screens/report_details_screen.dart';
import 'screens/messages_screen.dart';
import 'screens/emergency_mode_screen.dart';
import 'screens/my_watch_groups_screen.dart';
import 'screens/watch_group_details_screen.dart';
import 'screens/group_chat_screen.dart';
import 'screens/profile_edit_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/account_settings_screen.dart';
import 'screens/help_support_screen.dart';
import 'screens/community_forum_screen.dart';
import 'screens/forum_post_screen.dart';
import 'screens/report_status_tracking_screen.dart';
import 'screens/media_gallery_screen.dart';
import 'screens/feedback_rating_screen.dart';
import 'screens/multi_language_screen.dart';
import 'screens/accessibility_settings_screen.dart';
import 'screens/tutorial_faq_screen.dart';
import 'screens/incident_map_view_screen.dart';
import 'screens/create_post_screen.dart';

class SafeReportApp extends StatelessWidget {
  const SafeReportApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SafeReport',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
        useMaterial3: true,
      ),
      home: const OnboardingFlow(),
    );
  }
}

class OnboardingFlow extends StatefulWidget {
  const OnboardingFlow({super.key});

  @override
  State<OnboardingFlow> createState() => _OnboardingFlowState();
}

class _OnboardingFlowState extends State<OnboardingFlow> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Widget> _screens = [
    const WelcomeScreen(),
    const OnboardingScreen1(),
    const OnboardingScreen2(),
    const OnboardingScreen3(),
    const OnboardingScreen4(),
    const LoginScreen(),
    const SignupScreen(),
    const PrivacyDataScreen(),
    const ForgotPasswordScreen(),
    const CheckEmailScreen(),
    const LocationServicesScreen(),
    const NotificationsScreen(),
    const DashboardScreen(),
    const EmergencyContactScreen(),
    const ReportCrimeScreen(),
    const MyReportsScreen(),
    const ReportDetailsScreen(),
    const MessagesScreen(),
    const EmergencyModeScreen(),
    const MyWatchGroupsScreen(),
    const WatchGroupDetailsScreen(),
    const GroupChatScreen(),
    const ProfileEditScreen(),
    const ProfileScreen(),
    const ReportSuccessScreen(reportId: '',),
    const LocationScreen(),
    const ReviewReportScreen(reportData: {},),
    const AccountSettingsScreen(),
    const HelpSupportScreen(),
    const CommunityForumScreen(),
    const ForumPostScreen(),
    const ReportStatusTrackingScreen(),
    const MediaGalleryScreen(),
    const FeedbackRatingScreen(),
    const MultiLanguageScreen(),
    const AccessibilitySettingsScreen(),
    const TutorialFaqScreen(),
    const IncidentMapViewScreen(),
    const CreatePostScreen(),


  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_currentPage < _screens.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      setState(() {
        _currentPage++;
      });
    } else {
      // Navigate to main app
      _navigateToMainApp();
    }
  }

  void _skipTutorial() {
    _navigateToMainApp();
  }

  void _navigateToMainApp() {
    // TODO: Navigate to main app screen
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Welcome to SafeReport!'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentPage = index;
          });
        },
        children: _screens,
      ),
    );
  }
} 