import 'package:flutter/material.dart';

class ReportCrimeScreen extends StatefulWidget {
  const ReportCrimeScreen({Key? key}) : super(key: key);

  @override
  State<ReportCrimeScreen> createState() => _ReportCrimeScreenState();
}

class _ReportCrimeScreenState extends State<ReportCrimeScreen> {
  bool _submitAnonymously = false;
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(context),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 18),
                      const Text(
                        'Select Incident Type',
                        style: TextStyle(
                          color: Color(0xFF36599F),
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 16),
                      _buildIncidentTypeCard(
                        icon: Icons.person_search,
                        title: 'Suspicious Person',
                        subtitle: 'Individual acting suspiciously',
                      ),
                      const SizedBox(height: 12),
                      _buildIncidentTypeCard(
                        icon: Icons.directions_car,
                        title: 'Vehicle Activity',
                        subtitle: 'Suspicious vehicle behavior',
                      ),
                      const SizedBox(height: 12),
                      _buildIncidentTypeCard(
                        icon: Icons.inventory_2,
                        title: 'Abandoned Item',
                        subtitle: 'Unattended suspicious items',
                      ),
                      const SizedBox(height: 28),
                      const Text(
                        'Description',
                        style: TextStyle(
                          color: Color(0xFF36599F),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 8),
                      _buildDescriptionField(),
                      const SizedBox(height: 24),
                      const Text(
                        'Add Evidence',
                        style: TextStyle(
                          color: Color(0xFF36599F),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 8),
                      _buildEvidenceRow(),
                      const SizedBox(height: 24),
                      _buildAnonymousToggle(),
                      const SizedBox(height: 32),
                      _buildContinueButton(),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF36599F),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
          const SizedBox(width: 8),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Report Crime',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Text(
                'Help keep your community safe',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildIncidentTypeCard({required IconData icon, required String title, required String subtitle}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.blue.shade100, width: 1.5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Icon(icon, color: const Color(0xFF36599F), size: 32),
        title: Text(
          title,
          style: const TextStyle(
            color: Color(0xFF36599F),
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(fontSize: 13),
        ),
        onTap: () {},
      ),
    );
  }

  Widget _buildDescriptionField() {
    return TextField(
      controller: _descriptionController,
      maxLines: 3,
      decoration: InputDecoration(
        hintText: 'Describe What you observed...............',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.blue.shade100),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      ),
    );
  }

  Widget _buildEvidenceRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _buildEvidenceIcon(Icons.camera_alt, 'Photo'),
        const SizedBox(width: 16),
        _buildEvidenceIcon(Icons.videocam, 'Video'),
        const SizedBox(width: 16),
        _buildEvidenceIcon(Icons.mic, 'Audio'),
      ],
    );
  }

  Widget _buildEvidenceIcon(IconData icon, String label) {
    return Column(
      children: [
        Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: const Color(0xFFE8F0FE),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: const Color(0xFF36599F), size: 32),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(fontSize: 12, color: Color(0xFF36599F)),
        ),
      ],
    );
  }

  Widget _buildAnonymousToggle() {
    return Row(
      children: [
        Switch(
          value: _submitAnonymously,
          onChanged: (val) {
            setState(() {
              _submitAnonymously = val;
            });
          },
          activeColor: const Color(0xFF36599F),
        ),
        const SizedBox(width: 8),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Submit Anonymously',
              style: TextStyle(
                color: Color(0xFF36599F),
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            Text(
              'Your identity will be protected',
              style: TextStyle(fontSize: 12, color: Colors.black54),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildContinueButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF36599F),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(vertical: 16),
        ),
        child: const Text(
          'Continue to Location',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white, // Add this line to make text white
          ),
        ),
      ),
    );
  }
}