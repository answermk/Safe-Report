import 'package:flutter/material.dart';

class ForumPostScreen extends StatelessWidget {
  const ForumPostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text('Forum Post', style: TextStyle(fontWeight: FontWeight.bold)),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(24),
          child: Padding(
            padding: EdgeInsets.only(bottom: 8.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text('Neighborhood patrol tips', style: TextStyle(fontSize: 14, color: Colors.white70)),
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                _buildPostCard(),
                const SizedBox(height: 16),
                const Text('Comments', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 8),
                _buildComment(
                  initials: 'JD',
                  name: 'Jane Doe',
                  location: 'Oak Street',
                  time: '5 hrs ago',
                  content: 'Great tips Mike! We also found it helpful to have a standardized checklist and log all observations via documented consistency.',
                  helpful: 3,
                ),
                _buildComment(
                  initials: 'PD',
                  name: 'Police Dept',
                  location: 'Police Dept',
                  time: '2 hrs ago',
                  content: 'Excellent suggestions. The police department appreciates organized neighborhood watches and encourages reporting suspicious activity.',
                  helpful: 8,
                ),
                _buildComment(
                  initials: 'AJ',
                  name: 'Alex Johnson',
                  location: 'Maple Ave',
                  time: '1 hr ago',
                  content: 'We\'ve been using walkie-talkies during patrols, which help with communication, especially in areas with spotty cell service.',
                  helpful: 5,
                ),
                _buildComment(
                  initials: 'SM',
                  name: 'Sarah Miller',
                  location: 'Elm Street',
                  time: '45 min ago',
                  content: 'Does anyone have recommendations for good reflective vests that are comfortable for longer patrols?',
                  helpful: 2,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Add a comment.............',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Post Comment', style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF36599F),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPostCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  child: const Text('MC', style: TextStyle(fontWeight: FontWeight.bold)),
                  backgroundColor: Colors.blue.shade100,
                  foregroundColor: Colors.blue.shade900,
                ),
                const SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Mike Chen', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('Downtown • Yesterday', style: TextStyle(fontSize: 12, color: Colors.grey)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Text('Neighborhood patrol tips', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            const Text(
              'After organizing weekly patrols in our downtown area for the past 6 months, wanted to share tips: 1. Buddy system... 2. Safety vests... 3. Documentation... Would love to hear what\'s worked for other groups!',
              style: TextStyle(color: Colors.black87),
            ),
            const SizedBox(height: 8),
            Row(
              children: const [
                Icon(Icons.emoji_people, size: 18, color: Colors.orange),
                SizedBox(width: 4),
                Text('42 Helpful', style: TextStyle(fontSize: 13)),
                SizedBox(width: 16),
                Icon(Icons.comment, size: 18, color: Colors.grey),
                SizedBox(width: 4),
                Text('8 Comments', style: TextStyle(fontSize: 13)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildComment({
    required String initials,
    required String name,
    required String location,
    required String time,
    required String content,
    required int helpful,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  child: Text(initials, style: const TextStyle(fontWeight: FontWeight.bold)),
                  backgroundColor: Colors.blue.shade100,
                  foregroundColor: Colors.blue.shade900,
                ),
                const SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
                    Text('$location • $time', style: const TextStyle(fontSize: 12, color: Colors.grey)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 6),
            Text(content, style: const TextStyle(color: Colors.black87)),
            const SizedBox(height: 6),
            Row(
              children: [
                const Text('Reply', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
                const SizedBox(width: 16),
                const Icon(Icons.emoji_people, size: 18, color: Colors.orange),
                const SizedBox(width: 4),
                Text('Helpful ($helpful)', style: const TextStyle(fontSize: 13)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}