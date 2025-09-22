import 'package:flutter/material.dart';

class MultiLanguageScreen extends StatefulWidget {
  const MultiLanguageScreen({Key? key}) : super(key: key);

  @override
  State<MultiLanguageScreen> createState() => _MultiLanguageScreenState();
}

class _MultiLanguageScreenState extends State<MultiLanguageScreen> {
  String _selectedLanguage = 'English';
  final List<String> _languages = [
    'English',
    'French',
    'Kinyarwanda',
    'Swahili',
    'Spanish',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Language', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFF36599F),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Select your preferred language:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            const SizedBox(height: 16),
            ..._languages.map((lang) => RadioListTile<String>(
              value: lang,
              groupValue: _selectedLanguage,
              onChanged: (val) => setState(() => _selectedLanguage = val ?? 'English'),
              title: Text(lang, style: const TextStyle(fontWeight: FontWeight.w500)),
              activeColor: const Color(0xFF36599F),
            )),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF36599F),
                minimumSize: const Size.fromHeight(48),
              ),
              child: const Text('Save Language', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}