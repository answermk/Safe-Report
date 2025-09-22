import 'package:flutter/material.dart';

class HelpSupportScreen extends StatelessWidget {
  const HelpSupportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text('Help & Support', style: TextStyle(fontWeight: FontWeight.bold)),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(24),
          child: Padding(
            padding: EdgeInsets.only(bottom: 8.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text('Get assistance and answers', style: TextStyle(fontSize: 14, color: Colors.white70)),
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  const Icon(Icons.chat_bubble_outline, size: 48, color: Colors.black54),
                  const SizedBox(height: 8),
                  const Text('Need Help?', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.blue)),
                  const SizedBox(height: 4),
                  const Text("We're here to assist you 24/7", style: TextStyle(color: Colors.black54)),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Start Live Chat', style: TextStyle(color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF36599F),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            _buildQuickHelpSection(context),
            const SizedBox(height: 16),
            _buildContactOptionsSection(context),
            const SizedBox(height: 16),
            _buildFeedbackSection(context),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickHelpSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: const [
            Icon(Icons.help_outline_sharp, color: Colors.green),
            SizedBox(width: 8),
            Text('Quick Help', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green)),
          ],
        ),
        const SizedBox(height: 8),
        _buildHelpTile(
          context,
          icon: Icons.question_answer,
          title: 'Frequently Asked Questions',
          subtitle: 'Common questions and answers',
        ),
        _buildHelpTile(
          context,
          icon: Icons.rule,
          title: 'Reporting Guidelines',
          subtitle: 'Best practices for safety reporting',
        ),
        _buildHelpTile(
          context,
          icon: Icons.group,
          title: 'Community Guidelines',
          subtitle: 'Rules and expectations',
        ),
      ],
    );
  }

  Widget _buildHelpTile(BuildContext context, {required IconData icon, required String title, required String subtitle}) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: ListTile(
        leading: Icon(icon, color: Colors.blue),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios, size: 18),
        onTap: () {},
      ),
    );
  }

  Widget _buildContactOptionsSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: const [
            Icon(Icons.contact_phone, color: Colors.indigo),
            SizedBox(width: 8),
            Text('Contact Options', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.indigo)),
          ],
        ),
        const SizedBox(height: 8),
        Card(
          child: ListTile(
            leading: const Icon(Icons.email_rounded, color: Colors.red),
            title: const Text('Email Support'),
            subtitle: const Text('support@saferreport.com'),
            trailing: ElevatedButton(
              onPressed: () {},
              child: const Text('Email', style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF36599F),
              ),
            ),
          ),
        ),
        Card(
          child: ListTile(
            leading: const Icon(Icons.phone, color: Colors.blue),
            title: const Text('Phone Support'),
            subtitle: const Text('1-800-SAFERPORT'),
            trailing: ElevatedButton(
              onPressed: () {},
              child: const Text('Call', style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF36599F),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFeedbackSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: const [
            Icon(Icons.feedback, color: Colors.black87),
            SizedBox(width: 8),
            Text('Send Feedback', style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        const SizedBox(height: 8),
        TextField(
          maxLines: 2,
          decoration: InputDecoration(
            hintText: 'Tell us how we can improve ......',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          ),
        ),
        const SizedBox(height: 8),
        ElevatedButton(
          onPressed: () {},
          child: const Text('Submit Feedback', style: TextStyle(color: Colors.white)),
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF36599F),
          ),
        ),
      ],
    );
  }
}