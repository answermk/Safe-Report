import 'package:flutter/material.dart';

class TutorialFaqScreen extends StatelessWidget {
  const TutorialFaqScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final faqs = [
      {
        'question': 'How do I report a suspicious activity?',
        'answer': 'Tap the "Report" button on the dashboard, fill in the details, and submit. You can add photos, videos, or audio.'
      },
      {
        'question': 'Can I report anonymously?',
        'answer': 'Yes, you can choose to hide your identity when submitting a report.'
      },
      {
        'question': 'How do I track my report status?',
        'answer': 'Go to the "My Reports" section to see the status of all your submitted reports.'
      },
      {
        'question': 'How do I join a watch group?',
        'answer': 'Navigate to "Watch Groups" and tap on "Find More Groups" to join or request to join a group.'
      },
      {
        'question': 'How do I change the app language?',
        'answer': 'Go to Settings > Language Preferences to select your preferred language.'
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tutorial & FAQ', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFF36599F),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text('Frequently Asked Questions', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            const SizedBox(height: 16),
            ...faqs.map((faq) => ExpansionTile(
              title: Text(faq['question']!, style: const TextStyle(fontWeight: FontWeight.w600)),
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Text(faq['answer']!),
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }
}