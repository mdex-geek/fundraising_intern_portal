import 'package:flutter/material.dart';

class AnnouncementsScreen extends StatefulWidget {
  const AnnouncementsScreen({super.key});

  @override
  State<AnnouncementsScreen> createState() => _AnnouncementsScreenState();
}

class _AnnouncementsScreenState extends State<AnnouncementsScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  // Mock announcements data
  final List<Map<String, dynamic>> announcements = [
    {
      'id': 1,
      'title': '🎉 New Milestone Achieved!',
      'content':
          'Our fundraising campaign has reached ₹1,00,000! Thank you to all interns for your incredible dedication and hard work.',
      'timestamp': '2 hours ago',
      'type': 'celebration',
      'isImportant': true,
      'icon': Icons.celebration,
      'color': Color(0xFF4CAF50),
    },
    {
      'id': 2,
      'title': '🏆 Weekly Leaderboard Update',
      'content':
          'Sarah Chen maintains the lead with ₹8,500 raised this week. The competition is heating up for the top 3 positions!',
      'timestamp': '5 hours ago',
      'type': 'leaderboard',
      'isImportant': false,
      'icon': Icons.leaderboard,
      'color': Color(0xFFFFC107),
    },
    {
      'id': 3,
      'title': '📋 New Training Session Available',
      'content':
          'Join our virtual training session on "Effective Fundraising Strategies" scheduled for tomorrow at 3 PM. Registration link in your dashboard.',
      'timestamp': '1 day ago',
      'type': 'training',
      'isImportant': true,
      'icon': Icons.school,
      'color': Color(0xFF2196F3),
    },
    {
      'id': 4,
      'title': '🎁 Reward System Update',
      'content':
          'We\'ve added new rewards to our system! Check out the Diamond Badge for reaching 50 donations and exclusive merchandise for top performers.',
      'timestamp': '2 days ago',
      'type': 'rewards',
      'isImportant': false,
      'icon': Icons.card_giftcard,
      'color': Color(0xFF9C27B0),
    },
    {
      'id': 5,
      'title': '📱 Mobile App Features',
      'content':
          'The new mobile app update includes real-time donation tracking, improved referral sharing, and push notifications for important updates.',
      'timestamp': '3 days ago',
      'type': 'app',
      'isImportant': false,
      'icon': Icons.phone_android,
      'color': Color(0xFF607D8B),
    },
    {
      'id': 6,
      'title': '🌟 Community Spotlight',
      'content':
          'Featuring Alex Johnson this week for consistent performance and excellent team collaboration. Keep up the great work!',
      'timestamp': '4 days ago',
      'type': 'spotlight',
      'isImportant': false,
      'icon': Icons.star,
      'color': Color(0xFFFF5722),
    },
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String _getAnnouncementTypeLabel(String type) {
    switch (type) {
      case 'celebration':
        return 'CELEBRATION';
      case 'leaderboard':
        return 'LEADERBOARD';
      case 'training':
        return 'TRAINING';
      case 'rewards':
        return 'REWARDS';
      case 'app':
        return 'APP UPDATE';
      case 'spotlight':
        return 'SPOTLIGHT';
      default:
        return 'ANNOUNCEMENT';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Announcements'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_active),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Notification Settings'),
                  content: const Text(
                    'Manage your notification preferences for announcements, rewards, and leaderboard updates.',
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Cancel'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Notification settings updated!'),
                            backgroundColor: Color(0xFF4CAF50),
                          ),
                        );
                      },
                      child: const Text('Save'),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: Column(
          children: [
            // Summary Header
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF2196F3), Color(0xFF1976D2)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                children: [
                  const Text(
                    'Latest Updates',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${announcements.where((a) => a['isImportant'] == true).length} important announcements • ${announcements.length} total',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.9),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),

            // Filter Chips
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildFilterChip('All', true),
                    _buildFilterChip('Important', false),
                    _buildFilterChip('Training', false),
                    _buildFilterChip('Rewards', false),
                    _buildFilterChip('Leaderboard', false),
                  ],
                ),
              ),
            ),

            // Announcements List
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: announcements.length,
                itemBuilder: (context, index) {
                  final announcement = announcements[index];
                  return AnimatedContainer(
                    duration: Duration(milliseconds: 100 * (index + 1)),
                    curve: Curves.easeOutBack,
                    child: _buildAnnouncementCard(announcement, index),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('All announcements marked as read!'),
              backgroundColor: Color(0xFF4CAF50),
            ),
          );
        },
        icon: const Icon(Icons.mark_email_read),
        label: const Text('Mark All Read'),
      ),
    );
  }

  Widget _buildFilterChip(String label, bool isSelected) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      child: FilterChip(
        label: Text(label),
        selected: isSelected,
        onSelected: (selected) {
          // Filter logic would go here
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Filtering by: $label'),
              backgroundColor: const Color(0xFF2196F3),
              duration: const Duration(seconds: 1),
            ),
          );
        },
        selectedColor: const Color(0xFF2196F3).withOpacity(0.2),
        checkmarkColor: const Color(0xFF2196F3),
      ),
    );
  }

  Widget _buildAnnouncementCard(Map<String, dynamic> announcement, int index) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: Card(
        elevation: announcement['isImportant'] ? 6 : 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: announcement['isImportant']
              ? BorderSide(color: announcement['color'], width: 2)
              : BorderSide.none,
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () {
            _showAnnouncementDetails(announcement);
          },
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header with type and timestamp
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: announcement['color'].withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        _getAnnouncementTypeLabel(announcement['type']),
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: announcement['color'],
                        ),
                      ),
                    ),
                    const Spacer(),
                    if (announcement['isImportant'])
                      Container(
                        margin: const EdgeInsets.only(right: 8),
                        child: Icon(
                          Icons.priority_high,
                          color: announcement['color'],
                          size: 16,
                        ),
                      ),
                    Text(
                      announcement['timestamp'],
                      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                // Title with icon
                Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: announcement['color'].withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        announcement['icon'],
                        color: announcement['color'],
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        announcement['title'],
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                // Content preview
                Text(
                  announcement['content'],
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[700],
                    height: 1.4,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 12),

                // Action buttons
                Row(
                  children: [
                    TextButton.icon(
                      onPressed: () => _showAnnouncementDetails(announcement),
                      icon: const Icon(Icons.read_more, size: 16),
                      label: const Text('Read More'),
                      style: TextButton.styleFrom(
                        foregroundColor: announcement['color'],
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Announcement saved!'),
                            backgroundColor: Color(0xFF4CAF50),
                          ),
                        );
                      },
                      icon: const Icon(Icons.bookmark_border),
                      iconSize: 20,
                    ),
                    IconButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Announcement shared!'),
                            backgroundColor: Color(0xFF2196F3),
                          ),
                        );
                      },
                      icon: const Icon(Icons.share),
                      iconSize: 20,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showAnnouncementDetails(Map<String, dynamic> announcement) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.7,
        maxChildSize: 0.9,
        minChildSize: 0.5,
        expand: false,
        builder: (context, scrollController) => Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Handle
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Header
              Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: announcement['color'].withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      announcement['icon'],
                      color: announcement['color'],
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: announcement['color'].withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            _getAnnouncementTypeLabel(announcement['type']),
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: announcement['color'],
                            ),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          announcement['timestamp'],
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Title
              Text(
                announcement['title'],
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),

              // Content
              Expanded(
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Text(
                    announcement['content'],
                    style: const TextStyle(fontSize: 16, height: 1.5),
                  ),
                ),
              ),

              // Actions
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Announcement shared!'),
                            backgroundColor: Color(0xFF2196F3),
                          ),
                        );
                      },
                      icon: const Icon(Icons.share),
                      label: const Text('Share'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () {
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Announcement saved!'),
                            backgroundColor: Color(0xFF4CAF50),
                          ),
                        );
                      },
                      icon: const Icon(Icons.bookmark),
                      label: const Text('Save'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
