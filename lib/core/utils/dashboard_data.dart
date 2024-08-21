

class DashboardItem {
  final String caption;
  final String imageUrl;

  DashboardItem({
    required this.caption,
    required this.imageUrl
  });
}

class ReactionItem {
  final String timeStamp;
  final String name;
  int likes;
  final bool isVerified;
  final String imageUrl;
  final String message;

  ReactionItem({
    required this.timeStamp,
    required this.likes,
    required this.isVerified,
    required this.name,
    required this.imageUrl,
    required this.message,
  });
}

final List<DashboardItem> dashboardItemList = [
  DashboardItem(
    caption: "Finished working on a project",
    imageUrl: 'https://picsum.photos/seed/picsum/200/300',
  ),
  DashboardItem(
    caption: "Cute doddle doo on",
    imageUrl: 'https://picsum.photos/200/300?grayscale',
  ),
  DashboardItem(
    caption: "On a mission to get away",
    imageUrl: 'https://picsum.photos/200/300/?blur',
  ),
];

final List<ReactionItem> reactionItems = [
  ReactionItem(
    name: "Saul Niguel",
    isVerified: true,
    likes: 400,
    timeStamp: "Today 08:30 AM",
    imageUrl: 'https://picsum.photos/seed/picsum/200/300',
    message: "Finally, Congratulations on completing the project",
  ),
  ReactionItem(
    name: "Barak Ishak",
    isVerified: false,
    likes: 124,
    timeStamp: "Yesterday 10:52 PM",
    imageUrl: 'https://picsum.photos/200/300?grayscale',
    message: "Well done on the new initiative",
  ),
  ReactionItem(
    name: "Samuel Gabriel",
    isVerified: true,
    likes: 76,
    timeStamp: "2 Days Ago",
    imageUrl: 'https://picsum.photos/200/300/?blur',
    message: "Great job on the recent mission",
  ),
];

final List<List<String>> reactions = [
  [
    'https://picsum.photos/seed/picsum/200/300',
    'Finished working on a project',
  ],
  [
    'https://picsum.photos/200/300?grayscale',
    'Cute doddle doo on',
  ],
  [
    'https://picsum.photos/200/300/?blur',
    'On a mission to get away',
  ],
];
