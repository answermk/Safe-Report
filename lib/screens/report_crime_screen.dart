import 'package:flutter/material.dart';
import 'location_screen.dart';

class ReportCrimeScreen extends StatefulWidget {
  const ReportCrimeScreen({Key? key}) : super(key: key);

  @override
  State<ReportCrimeScreen> createState() => _ReportCrimeScreenState();
}

class _ReportCrimeScreenState extends State<ReportCrimeScreen> {
  bool _submitAnonymously = true;
  String? _selectedIncidentType;
  final TextEditingController _descriptionController = TextEditingController();
  List<String> _selectedEvidence = [];

  // Backend data structure for report
  Map<String, dynamic> reportData = {};

  @override
  void dispose() {
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> _handleContinueToLocation() async {
    // Prepare report data for backend
    reportData = {
      'incidentType': _selectedIncidentType,
      'description': _descriptionController.text,
      'evidence': _selectedEvidence,
      'submitAnonymously': _submitAnonymously,
      'timestamp': DateTime.now().toIso8601String(),
      // TODO: Add user location, user ID if not anonymous, etc.
    };

    print('Report data prepared for backend: $reportData');

    // TODO: Validate required fields
    if (_selectedIncidentType == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select an incident type'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    if (_descriptionController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please provide a description'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // TODO: Save draft to backend
    // await ReportService.saveDraft(reportData);

    // Navigate to location screen with report data
   /* Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LocationScreen(reportData: reportData),
      ),
    );*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(context),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 25),
                      const Text(
                        'Select Incident Type',
                        style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 20),
                      _buildIncidentTypeCard(
                        icon: Icons.person,
                        iconColor: const Color(0xFFFFB347),
                        title: 'Suspicious Person',
                        subtitle: 'Individual acting suspiciously',
                        value: 'suspicious_person',
                      ),
                      const SizedBox(height: 15),
                      _buildIncidentTypeCard(
                        icon: Icons.directions_car,
                        iconColor: const Color(0xFFFF6B6B),
                        title: 'Vehicle Activity',
                        subtitle: 'Suspicious vehicle behavior',
                        value: 'vehicle_activity',
                      ),
                      const SizedBox(height: 15),
                      _buildIncidentTypeCard(
                        icon: Icons.inventory_2,
                        iconColor: const Color(0xFFFFD93D),
                        title: 'Abandoned Item',
                        subtitle: 'Unattended suspicious items',
                        value: 'abandoned_item',
                      ),
                      const SizedBox(height: 30),
                      const Text(
                        'Description',
                        style: TextStyle(
                          color: Color(0xFF36599F),
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 15),
                      _buildDescriptionField(),
                      const SizedBox(height: 30),
                      const Text(
                        'Add Evidence',
                        style: TextStyle(
                          color: Color(0xFF36599F),
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 15),
                      _buildEvidenceRow(),
                      const SizedBox(height: 30),
                      _buildAnonymousToggle(),
                      const SizedBox(height: 40),
                      _buildContinueButton(),
                      const SizedBox(height: 30),
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
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white, size: 24),
            onPressed: () => Navigator.pop(context),
          ),
          const SizedBox(width: 10),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Report Crime',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 22,
                ),
              ),
              SizedBox(height: 2),
              Text(
                'Help keep your community safe',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildIncidentTypeCard({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String subtitle,
    required String value,
  }) {
    final isSelected = _selectedIncidentType == value;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIncidentType = value;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: isSelected ? const Color(0xFF36599F) : Colors.grey[300]!,
            width: isSelected ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.08),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: iconColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                color: Colors.white,
                size: 28,
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            if (isSelected)
              Container(
                width: 24,
                height: 24,
                decoration: const BoxDecoration(
                  color: Color(0xFF36599F),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 16,
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildDescriptionField() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        controller: _descriptionController,
        maxLines: 4,
        decoration: InputDecoration(
          hintText: 'Describe What you\nobserved...............',
          hintStyle: TextStyle(
            color: Colors.grey[400],
            fontSize: 15,
          ),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey[200]!),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey[200]!),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xFF36599F)),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        ),
        onChanged: (value) {
          // TODO: Auto-save draft to backend
        },
      ),
    );
  }

  Widget _buildEvidenceRow() {
    return Row(
      children: [
        _buildEvidenceIcon(Icons.camera_alt, 'Photo', 'photo'),
        const SizedBox(width: 20),
        _buildEvidenceIcon(Icons.videocam, 'Video', 'video'),
        const SizedBox(width: 20),
        _buildEvidenceIcon(Icons.mic, 'Audio', 'audio'),
      ],
    );
  }

  Widget _buildEvidenceIcon(IconData icon, String label, String type) {
    final isSelected = _selectedEvidence.contains(type);

    return GestureDetector(
      onTap: () {
        setState(() {
          if (isSelected) {
            _selectedEvidence.remove(type);
          } else {
            _selectedEvidence.add(type);
          }
        });
        // TODO: Handle evidence upload based on type
      },
      child: Column(
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: isSelected ? const Color(0xFF36599F) : const Color(0xFF93C5FD),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Icon(
              icon,
              color: Colors.white,
              size: 32,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              color: isSelected ? const Color(0xFF36599F) : Colors.grey[600],
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAnonymousToggle() {
    return Row(
      children: [
        const Text(
          'Submit Anonymously',
          style: TextStyle(
            color: Color(0xFF36599F),
            fontWeight: FontWeight.w700,
            fontSize: 16,
          ),
        ),
        const Spacer(),
        Switch(
          value: _submitAnonymously,
          onChanged: (val) {
            setState(() {
              _submitAnonymously = val;
            });
          },
          activeColor: Colors.white,
          activeTrackColor: const Color(0xFF36599F),
          inactiveThumbColor: Colors.white,
          inactiveTrackColor: Colors.grey[300],
        ),
      ],
    );
  }

  Widget _buildContinueButton() {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: _handleContinueToLocation,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF36599F),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 0,
        ),
        child: const Text(
          'Continue to Location',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}