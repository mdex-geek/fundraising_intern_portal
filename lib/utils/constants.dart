import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF2196F3);
  static const Color primaryDark = Color(0xFF1976D2);
  static const Color primaryLight = Color(0xFFE3F2FD);
  static const Color accent = Color(0xFF4CAF50);
  static const Color warning = Color(0xFFFFC107);
  static const Color error = Color(0xFFFF5722);
  static const Color background = Color(0xFFF5F5F5);
  static const Color surface = Colors.white;
  static const Color onSurface = Color(0xFF333333);
  static const Color textSecondary = Color(0xFF666666);

  // Achievement colors
  static const Color bronze = Color(0xFFCD7F32);
  static const Color silver = Color(0xFFC0C0C0);
  static const Color gold = Color(0xFFFFD700);
  static const Color diamond = Color(0xFF40E0D0);
}

class AppSizes {
  static const double paddingSmall = 8.0;
  static const double paddingMedium = 16.0;
  static const double paddingLarge = 24.0;
  static const double paddingXLarge = 32.0;

  static const double borderRadius = 12.0;
  static const double borderRadiusLarge = 16.0;

  static const double iconSmall = 16.0;
  static const double iconMedium = 24.0;
  static const double iconLarge = 32.0;
  static const double iconXLarge = 48.0;
}

class AppStrings {
  static const String appName = 'Fundraising Intern Portal';
  static const String loginTitle = 'Welcome back!';
  static const String signUpTitle = 'Join our mission!';
  static const String dashboardTitle = 'Dashboard';
  static const String leaderboardTitle = 'Leaderboard';
  static const String announcementsTitle = 'Announcements';

  // Error messages
  static const String emailRequired = 'Please enter your email';
  static const String emailInvalid = 'Please enter a valid email';
  static const String passwordRequired = 'Please enter your password';
  static const String passwordTooShort =
      'Password must be at least 6 characters';

  // Success messages
  static const String loginSuccess = 'Welcome back!';
  static const String codeShared = 'Referral code copied!';
  static const String progressShared = 'Progress shared successfully!';
  static const String announcementSaved = 'Announcement saved!';
}

class AppAnimations {
  static const Duration fast = Duration(milliseconds: 200);
  static const Duration normal = Duration(milliseconds: 300);
  static const Duration slow = Duration(milliseconds: 500);
  static const Duration extraSlow = Duration(milliseconds: 800);

  static const Curve easeIn = Curves.easeIn;
  static const Curve easeOut = Curves.easeOut;
  static const Curve easeInOut = Curves.easeInOut;
  static const Curve bounceOut = Curves.easeOutBack;
}

class MockData {
  static const String currentUserName = 'Alex Johnson';
  static const String currentUserEmail = 'alex.johnson@example.com';
  static const String currentUserReferralCode = 'alex2025';
  static const double currentUserDonations = 5000.0;
  static const int currentUserDonationCount = 12;
  static const int currentUserRank = 3;

  static const List<Map<String, dynamic>> leaderboardUsers = [
    {
      'name': 'Sarah Chen',
      'donations': 8500.0,
      'donationCount': 25,
      'rank': 1,
      'isCurrentUser': false,
    },
    {
      'name': 'Michael Rodriguez',
      'donations': 7200.0,
      'donationCount': 20,
      'rank': 2,
      'isCurrentUser': false,
    },
    {
      'name': 'Alex Johnson',
      'donations': 5000.0,
      'donationCount': 12,
      'rank': 3,
      'isCurrentUser': true,
    },
    {
      'name': 'Emily Davis',
      'donations': 4800.0,
      'donationCount': 15,
      'rank': 4,
      'isCurrentUser': false,
    },
    {
      'name': 'James Wilson',
      'donations': 3900.0,
      'donationCount': 11,
      'rank': 5,
      'isCurrentUser': false,
    },
  ];

  static const List<Map<String, dynamic>> achievements = [
    {
      'name': 'Bronze Badge',
      'requirement': '5+ Donations',
      'icon': Icons.stars,
      'color': AppColors.bronze,
      'isUnlocked': true,
    },
    {
      'name': 'Silver Badge',
      'requirement': '15 Donations',
      'icon': Icons.star,
      'color': AppColors.silver,
      'isUnlocked': false,
    },
    {
      'name': 'Gold Badge',
      'requirement': '30 Donations',
      'icon': Icons.workspace_premium,
      'color': AppColors.gold,
      'isUnlocked': false,
    },
    {
      'name': 'Diamond Badge',
      'requirement': '50 Donations',
      'icon': Icons.diamond,
      'color': AppColors.diamond,
      'isUnlocked': false,
    },
  ];
}
