# 📱 Fundraising Intern Portal

A Flutter mobile application designed for fundraising interns to track their progress, view leaderboards, and stay updated with announcements.

## ✨ Features

### 🔐 Authentication
- **Login/Sign-Up Screen**: Clean UI with form validation (no backend integration)
- **Animated transitions** and loading states
- **Input validation** for email and password fields

### 📊 Dashboard
- **Personalized welcome section** with intern name and referral code
- **Statistics cards** showing:
  - Total donations raised (₹5,000)
  - Number of donations (12)
  - Current rank (#3)
  - Monthly progress (₹1,250)
- **Rewards & Achievements section** with progress tracking:
  - Bronze Badge (Unlocked - 5+ donations)
  - Silver Badge (Locked - 15 donations)
  - Gold Badge (Locked - 30 donations)
  - Diamond Badge (Locked - 50 donations)
- **Quick Actions** for sharing referral code and tracking progress

### 🏆 Leaderboard
- **Top 3 podium display** with visual ranking
- **Full rankings list** with detailed user information
- **Current user highlighting** with special styling
- **Animated entries** with rank badges and colors
- **Refresh functionality** and sharing options

### 📢 Announcements
- **Categorized announcements** with different types:
  - Celebrations (milestones)
  - Leaderboard updates
  - Training sessions
  - Rewards system updates
  - App features
  - Community spotlights
- **Filter functionality** by category and importance
- **Detailed view** with expandable content
- **Interactive features** (save, share, mark as read)

## 🎨 Design Features

### 🌈 Visual Design
- **Modern Material Design** with custom color scheme
- **Gradient backgrounds** and elevated cards
- **Consistent iconography** and typography
- **Responsive layout** that works on different screen sizes

### ✨ Animations
- **Smooth page transitions** with slide animations
- **Fade-in effects** for screen content
- **Scale animations** for interactive elements
- **Staggered list animations** for better user experience

### 🎯 User Experience
- **Intuitive bottom navigation** between main screens
- **Clear visual hierarchy** with proper spacing
- **Interactive feedback** with snackbars and dialogs
- **Consistent button styles** and touch targets

## 📱 App Structure

```
lib/
├── main.dart                 # App entry point with theme configuration
├── screens/                  # All application screens
│   ├── login_screen.dart     # Authentication screen
│   ├── dashboard_screen.dart # Main dashboard with stats
│   ├── leaderboard_screen.dart # Rankings and competition
│   └── announcements_screen.dart # News and updates
├── models/                   # Data models
│   └── app_models.dart       # User, Achievement, Announcement models
└── utils/                    # Utilities and constants
    └── constants.dart        # App colors, sizes, strings, mock data
```

## 🗃️ Mock Data

The app uses static mock data to simulate real functionality:

### 👤 Current User
- **Name**: Alex Johnson
- **Email**: alex.johnson@example.com
- **Referral Code**: alex2025
- **Total Raised**: ₹5,000
- **Donations**: 12
- **Rank**: #3

### 🏆 Leaderboard (Top 5)
1. Sarah Chen - ₹8,500 (25 donations)
2. Michael Rodriguez - ₹7,200 (20 donations)
3. Alex Johnson - ₹5,000 (12 donations) [Current User]
4. Emily Davis - ₹4,800 (15 donations)
5. James Wilson - ₹3,900 (11 donations)

### 🎖️ Achievements System
- **Bronze Badge**: Unlocked (5+ donations)
- **Silver Badge**: Locked (15 donations needed)
- **Gold Badge**: Locked (30 donations needed)
- **Diamond Badge**: Locked (50 donations needed)

## 🚀 Getting Started

### Prerequisites
- Flutter SDK 3.8.1 or higher
- Dart SDK
- Android Studio / VS Code with Flutter extensions
- Android emulator or physical device

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd fundraising_intern_portal
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

### Testing the App

1. **Login Screen**: 
   - Enter any email and password (minimum 6 characters)
   - Both "Sign In" and "Sign Up" lead to the dashboard

2. **Dashboard Navigation**:
   - Tap bottom navigation items to explore screens
   - Try tapping on stats cards and action buttons
   - Check the notification icon and menu options

3. **Interactive Features**:
   - Share referral code button
   - Leaderboard refresh and sharing
   - Announcement filtering and detailed views
   - Achievement progress indicators

## 🎯 Future Enhancements

- **Backend Integration**: Connect to real APIs for authentication and data
- **Push Notifications**: Real-time updates for announcements
- **Data Persistence**: Local storage for offline functionality
- **Social Features**: Team collaboration and messaging
- **Analytics**: Detailed progress tracking and insights
- **Gamification**: More achievement types and rewards

## 🛠️ Technical Details

### Dependencies
- **flutter**: Core framework
- **material_design**: UI components and theming
- **built-in animations**: Page transitions and micro-interactions

### Architecture
- **Screen-based organization**: Each major feature has its own screen
- **Mock data approach**: Static data for demonstration purposes
- **Responsive design**: Adaptable to different screen sizes
- **Modular structure**: Reusable widgets and components

### Performance
- **Efficient widgets**: Uses const constructors where possible
- **Optimized animations**: Proper disposal of animation controllers
- **Memory management**: Clean disposal of resources

## 📸 Screenshots

The app includes:
- 🔐 **Login Screen**: Gradient background with animated form
- 📊 **Dashboard**: Stats cards, achievements, and quick actions
- 🏆 **Leaderboard**: Podium view with detailed rankings
- 📢 **Announcements**: Categorized news with rich content

---

**Built with ❤️ using Flutter**
