import '../models/app_models.dart';
import '../utils/constants.dart';

class DataService {
  static final DataService _instance = DataService._internal();
  factory DataService() => _instance;
  DataService._internal();

  // Simulate network delay
  Future<void> _simulateDelay() async {
    await Future.delayed(const Duration(milliseconds: 500));
  }

  // Authentication methods
  Future<User?> signIn(String email, String password) async {
    await _simulateDelay();

    // Mock authentication - always successful
    if (email.isNotEmpty && password.length >= 6) {
      return User.mockCurrentUser;
    }
    return null;
  }

  Future<User?> signUp(String email, String password) async {
    await _simulateDelay();

    // Mock registration - always successful
    if (email.isNotEmpty && password.length >= 6) {
      return User.mockCurrentUser;
    }
    return null;
  }

  // User data methods
  Future<User> getCurrentUser() async {
    await _simulateDelay();
    return User.mockCurrentUser;
  }

  Future<List<LeaderboardEntry>> getLeaderboard() async {
    await _simulateDelay();
    return LeaderboardEntry.mockData;
  }

  Future<List<Achievement>> getAchievements() async {
    await _simulateDelay();
    return Achievement.mockAchievements;
  }

  Future<List<Announcement>> getAnnouncements() async {
    await _simulateDelay();
    return Announcement.mockAnnouncements;
  }

  // Action methods
  Future<bool> shareReferralCode(String code) async {
    await _simulateDelay();
    // Mock sharing functionality
    return true;
  }

  Future<bool> markAnnouncementAsRead(String announcementId) async {
    await _simulateDelay();
    // Mock marking as read
    return true;
  }

  Future<bool> saveAnnouncement(String announcementId) async {
    await _simulateDelay();
    // Mock saving announcement
    return true;
  }

  Future<Map<String, dynamic>> getStats() async {
    await _simulateDelay();
    return {
      'totalRaised': MockData.currentUserDonations,
      'donationsCount': MockData.currentUserDonationCount,
      'rank': MockData.currentUserRank,
      'monthlyTotal': 1250.0,
      'referralCode': MockData.currentUserReferralCode,
    };
  }

  // Utility methods
  String formatCurrency(double amount) {
    return '₹${amount.toStringAsFixed(0)}';
  }

  String formatRank(int rank) {
    return '#$rank';
  }

  String getTimeAgo(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inDays > 0) {
      return '${difference.inDays} day${difference.inDays > 1 ? 's' : ''} ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} hour${difference.inHours > 1 ? 's' : ''} ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} minute${difference.inMinutes > 1 ? 's' : ''} ago';
    } else {
      return 'Just now';
    }
  }
}
