import 'package:flutter/material.dart';

class AccessibilitySettingsScreen extends StatefulWidget {
  const AccessibilitySettingsScreen({Key? key}) : super(key: key);

  @override
  State<AccessibilitySettingsScreen> createState() => _AccessibilitySettingsScreenState();
}

class _AccessibilitySettingsScreenState extends State<AccessibilitySettingsScreen> {
  double _fontSize = 16;
  bool _highContrast = false;
  bool _textToSpeech = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Accessibility Settings', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFF36599F),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Font Size', style: TextStyle(fontWeight: FontWeight.bold)),
            Slider(
              value: _fontSize,
              min: 12,
              max: 28,
              divisions: 8,
              label: '${_fontSize.toInt()} px',
              onChanged: (val) => setState(() => _fontSize = val),
              activeColor: const Color(0xFF36599F),
            ),
            const SizedBox(height: 16),
            SwitchListTile(
              value: _highContrast,
              onChanged: (val) => setState(() => _highContrast = val),
              title: const Text('High Contrast Mode', style: TextStyle(fontWeight: FontWeight.bold)),
              activeColor: const Color(0xFF36599F),
            ),
            const SizedBox(height: 8),
            SwitchListTile(
              value: _textToSpeech,
              onChanged: (val) => setState(() => _textToSpeech = val),
              title: const Text('Enable Text-to-Speech', style: TextStyle(fontWeight: FontWeight.bold)),
              activeColor: const Color(0xFF36599F),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF36599F),
                minimumSize: const Size.fromHeight(48),
              ),
              child: const Text('Save Accessibility Settings', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}