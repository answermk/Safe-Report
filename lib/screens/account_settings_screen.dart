import 'package:flutter/material.dart';

class AccountSettingsScreen extends StatefulWidget {
  const AccountSettingsScreen({Key? key}) : super(key: key);

  @override
  State<AccountSettingsScreen> createState() => _AccountSettingsScreenState();
}

class _AccountSettingsScreenState extends State<AccountSettingsScreen> {
  bool twoFactorEnabled = false;
  bool biometricLogin = true;
  bool pushNotifications = true;
  bool emailUpdates = true;
  bool watchGroupAlerts = true;
  bool anonymousMode = false;
  bool locationSharing = false;
  String appLanguage = 'English';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text('Account Settings', style: TextStyle(fontWeight: FontWeight.bold)),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(24),
          child: Padding(
            padding: EdgeInsets.only(bottom: 8.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text('Manage your preferences', style: TextStyle(fontSize: 14, color: Colors.white70)),
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
            _buildSection(
              icon: Icons.security,
              title: 'Security Settings',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('Change Password', style: TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(height: 2),
                          Text('Last changed 30 days ago', style: TextStyle(fontSize: 12, color: Colors.grey)),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text('Update'),
                        style: ElevatedButton.styleFrom(minimumSize: Size(70, 36)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  SwitchListTile(
                    contentPadding: EdgeInsets.zero,
                    title: const Text('Two- Factor Authentication', style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: const Text('Add extra security to your account'),
                    value: twoFactorEnabled,
                    onChanged: (val) => setState(() => twoFactorEnabled = val),
                  ),
                  SwitchListTile(
                    contentPadding: EdgeInsets.zero,
                    title: const Text('Biometric Login', style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: const Text('Use fingerprint or face ID'),
                    value: biometricLogin,
                    onChanged: (val) => setState(() => biometricLogin = val),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            _buildSection(
              icon: Icons.notifications,
              title: 'Notifications Preferences',
              child: Column(
                children: [
                  SwitchListTile(
                    contentPadding: EdgeInsets.zero,
                    title: const Text('Push Notifications', style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: const Text('Report updates and alerts'),
                    value: pushNotifications,
                    onChanged: (val) => setState(() => pushNotifications = val),
                  ),
                  SwitchListTile(
                    contentPadding: EdgeInsets.zero,
                    title: const Text('Email Updates', style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: const Text('Weekly community summary'),
                    value: emailUpdates,
                    onChanged: (val) => setState(() => emailUpdates = val),
                  ),
                  SwitchListTile(
                    contentPadding: EdgeInsets.zero,
                    title: const Text('Watch Group Alerts', style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: const Text('Messages from your groups'),
                    value: watchGroupAlerts,
                    onChanged: (val) => setState(() => watchGroupAlerts = val),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            _buildSection(
              icon: Icons.privacy_tip,
              title: 'Privacy Settings',
              child: Column(
                children: [
                  SwitchListTile(
                    contentPadding: EdgeInsets.zero,
                    title: const Text('Default Anonymous Mode', style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: const Text('Always submit reports anonymously'),
                    value: anonymousMode,
                    onChanged: (val) => setState(() => anonymousMode = val),
                  ),
                  SwitchListTile(
                    contentPadding: EdgeInsets.zero,
                    title: const Text('Location Sharing', style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: const Text('Share precise location with reports'),
                    value: locationSharing,
                    onChanged: (val) => setState(() => locationSharing = val),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            _buildSection(
              icon: Icons.language,
              title: 'Language Preferences',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('App Language', style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  DropdownButton<String>(
                    value: appLanguage,
                    isExpanded: true,
                    items: const [
                      DropdownMenuItem(value: 'English', child: Text('English')),
                      DropdownMenuItem(value: 'Spanish', child: Text('Spanish')),
                    ],
                    onChanged: (val) => setState(() => appLanguage = val ?? 'English'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Save All Settings', style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(48),
                textStyle: const TextStyle(fontWeight: FontWeight.bold),
                backgroundColor: Color(0xFF36599F),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection({required IconData icon, required String title, required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: Colors.blue),
              const SizedBox(width: 8),
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.blue)),
            ],
          ),
          const SizedBox(height: 8),
          child,
        ],
      ),
    );
  }
}