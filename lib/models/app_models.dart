class User {
  final String id;
  final String name;
  final String email;
  final String referralCode;
  final double totalDonations;
  final int donationsCount;
  final int rank;
  final List<String> achievements;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.referralCode,
    required this.totalDonations,
    required this.donationsCount,
    required this.rank,
    required this.achievements,
  });

  static User get mockCurrentUser => User(
    id: '1',
    name: 'deepanshu',
    email: 'deepanshu@example.com',
    referralCode: 'garg2025',
    totalDonations: 5000.0,
    donationsCount: 12,
    rank: 3,
    achievements: ['Bronze Badge', 'First Donation', 'Team Player'],
  );
}

class LeaderboardEntry {
  final String userId;
  final String name;
  final double donations;
  final int donationCount;
  final int rank;
  final bool isCurrentUser;

  LeaderboardEntry({
    required this.userId,
    required this.name,
    required this.donations,
    required this.donationCount,
    required this.rank,
    this.isCurrentUser = false,
  });

  static List<LeaderboardEntry> get mockData => [
    LeaderboardEntry(
      userId: '2',
      name: 'sara',
      donations: 8500,
      donationCount: 25,
      rank: 1,
    ),
    LeaderboardEntry(
      userId: '3',
      name: 'rahul',
      donations: 7200,
      donationCount: 20,
      rank: 2,
    ),
    LeaderboardEntry(
      userId: '1',
      name: 'deepanshu',
      donations: 5000,
      donationCount: 12,
      rank: 3,
      isCurrentUser: true,
    ),
    LeaderboardEntry(
      userId: '4',
      name: 'imli',
      donations: 4800,
      donationCount: 15,
      rank: 4,
    ),
    LeaderboardEntry(
      userId: '5',
      name: 'divya',
      donations: 3900,
      donationCount: 11,
      rank: 5,
    ),
  ];
}

class Achievement {
  final String id;
  final String name;
  final String description;
  final String iconName;
  final String color;
  final bool isUnlocked;

  Achievement({
    required this.id,
    required this.name,
    required this.description,
    required this.iconName,
    required this.color,
    required this.isUnlocked,
  });

  static List<Achievement> get mockAchievements => [
    Achievement(
      id: '1',
      name: 'Bronze Badge',
      description: '5+ Donations',
      iconName: 'stars',
      color: '0xFFCD7F32',
      isUnlocked: true,
    ),
    Achievement(
      id: '2',
      name: 'Silver Badge',
      description: '15 Donations',
      iconName: 'star',
      color: '0xFFC0C0C0',
      isUnlocked: false,
    ),
    Achievement(
      id: '3',
      name: 'Gold Badge',
      description: '30 Donations',
      iconName: 'workspace_premium',
      color: '0xFFFFD700',
      isUnlocked: false,
    ),
    Achievement(
      id: '4',
      name: 'Diamond Badge',
      description: '50 Donations',
      iconName: 'diamond',
      color: '0xFF40E0D0',
      isUnlocked: false,
    ),
  ];
}

class Announcement {
  final String id;
  final String title;
  final String content;
  final String timestamp;
  final String type;
  final bool isImportant;
  final String iconName;
  final String color;

  Announcement({
    required this.id,
    required this.title,
    required this.content,
    required this.timestamp,
    required this.type,
    required this.isImportant,
    required this.iconName,
    required this.color,
  });

  static List<Announcement> get mockAnnouncements => [
    Announcement(
      id: '1',
      title: '🎉 New Milestone Achieved!',
      content:
          'Our fundraising campaign has reached ₹1,00,000! Thank you to all interns for your incredible dedication and hard work.',
      timestamp: '2 hours ago',
      type: 'celebration',
      isImportant: true,
      iconName: 'celebration',
      color: '0xFF4CAF50',
    ),
    Announcement(
      id: '2',
      title: '🏆 Weekly Leaderboard Update',
      content:
          'Sarah Chen maintains the lead with ₹8,500 raised this week. The competition is heating up for the top 3 positions!',
      timestamp: '5 hours ago',
      type: 'leaderboard',
      isImportant: false,
      iconName: 'leaderboard',
      color: '0xFFFFC107',
    ),
    Announcement(
      id: '3',
      title: '📋 New Training Session Available',
      content:
          'Join our virtual training session on "Effective Fundraising Strategies" scheduled for tomorrow at 3 PM.',
      timestamp: '1 day ago',
      type: 'training',
      isImportant: true,
      iconName: 'school',
      color: '0xFF2196F3',
    ),
  ];
}
