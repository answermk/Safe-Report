import 'package:flutter/material.dart';
import 'location_screen.dart';
import 'media_capture_screen.dart'; // You'll need to create this

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
  List<String> _uploadedMediaPaths = []; // Store actual media file paths

  // Backend data structure for report
  Map<String, dynamic> reportData = {};

  // All incident categories
  final List<Map<String, dynamic>> _incidentCategories = [
    {
      'id': 'suspicious_person',
      'icon': Icons.person,
      'color': const Color(0xFFFFB347),
      'title': 'Suspicious Person',
      'subtitle': 'Individual acting suspiciously'
    },
    {
      'id': 'vehicle_activity',
      'icon': Icons.directions_car,
      'color': const Color(0xFFFF6B6B),
      'title': 'Vehicle Activity',
      'subtitle': 'Suspicious vehicle behavior'
    },
    {
      'id': 'abandoned_item',
      'icon': Icons.inventory_2,
      'color': const Color(0xFFFFD93D),
      'title': 'Abandoned Item',
      'subtitle': 'Unattended suspicious items'
    },
    {
      'id': 'theft',
      'icon': Icons.shopping_bag,
      'color': const Color(0xFFEF4444),
      'title': 'Theft/Burglary',
      'subtitle': 'Property theft or break-in'
    },
    {
      'id': 'vandalism',
      'icon': Icons.broken_image,
      'color': const Color(0xFFF97316),
      'title': 'Vandalism',
      'subtitle': 'Property damage or graffiti'
    },
    {
      'id': 'drug_activity',
      'icon': Icons.medication,
      'color': const Color(0xFF8B5CF6),
      'title': 'Drug Activity',
      'subtitle': 'Suspected drug-related behavior'
    },
    {
      'id': 'assault',
      'icon': Icons.dangerous,
      'color': const Color(0xFFDC2626),
      'title': 'Assault/Violence',
      'subtitle': 'Physical altercation or threat'
    },
    {
      'id': 'noise',
      'icon': Icons.volume_up,
      'color': const Color(0xFF06B6D4),
      'title': 'Noise Disturbance',
      'subtitle': 'Excessive noise complaint'
    },
    {
      'id': 'trespassing',
      'icon': Icons.no_accounts,
      'color': const Color(0xFF84CC16),
      'title': 'Trespassing',
      'subtitle': 'Unauthorized entry'
    },
    {
      'id': 'other',
      'icon': Icons.more_horiz,
      'color': const Color(0xFF6B7280),
      'title': 'Other',
      'subtitle': 'Other incident type'
    },
  ];

  @override
  void dispose() {
    _descriptionController.dispose();
    super.dispose();
  }

  // Auto-save draft every 3 seconds
  void _autoSaveDraft() {
    // TODO: Implement debounced auto-save
    // await ReportService.saveDraft(reportData);
    print('Auto-saving draft...');
  }

  Future<void> _handleEvidenceSelection(String type) async {
    // Navigate to MediaCaptureScreen based on type
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MediaCaptureScreen(
          mediaType: type, // 'photo', 'video', 'audio'
        ),
      ),
    );

    if (result != null && result is List<String>) {
      setState(() {
        _uploadedMediaPaths.addAll(result);
        if (!_selectedEvidence.contains(type)) {
          _selectedEvidence.add(type);
        }
      });

      // Show success feedback
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('${result.length} ${type}(s) added'),
          backgroundColor: Colors.green,
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }

  Future<void> _handleContinueToLocation() async {
    // Validate required fields
    if (_selectedIncidentType == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select an incident type'),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 3),
        ),
      );
      return;
    }

    if (_descriptionController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please provide a description'),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 3),
        ),
      );
      return;
    }

    // Prepare report data for backend
    reportData = {
      'incidentType': _selectedIncidentType,
      'incidentTitle': _incidentCategories
          .firstWhere((cat) => cat['id'] == _selectedIncidentType)['title'],
      'description': _descriptionController.text.trim(),
      'evidence': _selectedEvidence,
      'mediaPaths': _uploadedMediaPaths,
      'submitAnonymously': _submitAnonymously,
      'timestamp': DateTime.now().toIso8601String(),
      'status': 'draft',
    };

    print('Report data prepared for backend: $reportData');

    // TODO: Save draft to backend before navigation
    // await ReportService.saveDraft(reportData);

    // Navigate to location screen with report data
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LocationScreen(reportData: reportData),
      ),
    );
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

                      // Section Title with count
                      Row(
                        children: [
                          const Text(
                            'Select Incident Type',
                            style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFF36599F).withOpacity(0.1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              '${_incidentCategories.length}',
                              style: const TextStyle(
                                color: Color(0xFF36599F),
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),

                      // Incident Type Cards
                      ..._incidentCategories.map((category) => Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: _buildIncidentTypeCard(
                          icon: category['icon'] as IconData,
                          iconColor: category['color'] as Color,
                          title: category['title'] as String,
                          subtitle: category['subtitle'] as String,
                          value: category['id'] as String,
                        ),
                      )),

                      const SizedBox(height: 30),

                      // Description Section
                      const Text(
                        'Description',
                        style: TextStyle(
                          color: Color(0xFF36599F),
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Provide details about what you observed',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 15),
                      _buildDescriptionField(),

                      const SizedBox(height: 30),

                      // Evidence Section
                      Row(
                        children: [
                          const Text(
                            'Add Evidence',
                            style: TextStyle(
                              color: Color(0xFF36599F),
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            '(Optional)',
                            style: TextStyle(
                              color: Colors.grey[500],
                              fontSize: 14,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Photos, videos, or audio recordings',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 15),
                      _buildEvidenceRow(),

                      // Show uploaded media count
                      if (_uploadedMediaPaths.isNotEmpty) ...[
                        const SizedBox(height: 15),
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.green.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: Colors.green.withOpacity(0.3),
                            ),
                          ),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.check_circle,
                                color: Colors.green,
                                size: 20,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                '${_uploadedMediaPaths.length} file(s) attached',
                                style: const TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],

                      const SizedBox(height: 30),

                      // Anonymous Toggle Section
                      _buildAnonymousSection(),

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
          const Expanded(
            child: Column(
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
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
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
              color: isSelected
                  ? const Color(0xFF36599F).withOpacity(0.15)
                  : Colors.grey.withOpacity(0.08),
              blurRadius: isSelected ? 12 : 8,
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
        maxLines: 5,
        maxLength: 500,
        decoration: InputDecoration(
          hintText: 'Describe what you observed in detail...',
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
            borderSide: const BorderSide(color: Color(0xFF36599F), width: 2),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          counterStyle: TextStyle(color: Colors.grey[500], fontSize: 12),
        ),
        onChanged: (value) {
          _autoSaveDraft();
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
      onTap: () => _handleEvidenceSelection(type),
      child: Column(
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: isSelected
                  ? const Color(0xFF36599F)
                  : const Color(0xFF93C5FD),
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

  Widget _buildAnonymousSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey[200]!),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.privacy_tip,
                color: _submitAnonymously
                    ? const Color(0xFF36599F)
                    : Colors.grey[400],
                size: 24,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Submit Anonymously',
                      style: TextStyle(
                        color: Color(0xFF36599F),
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Your identity will be protected',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
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
          ),
        ],
      ),
    );
  }

  Widget _buildContinueButton() {
    final bool isValid = _selectedIncidentType != null &&
        _descriptionController.text.trim().isNotEmpty;

    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: isValid ? _handleContinueToLocation : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF36599F),
          disabledBackgroundColor: Colors.grey[300],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: isValid ? 2 : 0,
        ),
        child: Text(
          'Continue to Location',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: isValid ? Colors.white : Colors.grey[500],
          ),
        ),
      ),
    );
  }
}