import 'package:flutter/material.dart';
import 'dashboard_screen.dart';
import 'messages_screen.dart';
import 'profile_screen.dart';
import 'report_details_screen.dart';

class MyReportsScreen extends StatefulWidget {
  const MyReportsScreen({Key? key}) : super(key: key);

  @override
  State<MyReportsScreen> createState() => _MyReportsScreenState();
}

class _MyReportsScreenState extends State<MyReportsScreen> {
  int _selectedFilter = 0; // 0: All, 1: Active, 2: Resolved
  int _selectedIndex = 1; // For bottom navigation
  List<Map<String, dynamic>> reports = []; // Will be populated from backend

  @override
  void initState() {
    super.initState();
    _loadReports();
  }

  Future<void> _loadReports() async {
    // TODO: Implement backend call to load reports
    print('Loading reports from backend...');
    print('Filter: ${_getFilterText()}');

    // Simulate API call
    // final reportData = await ReportService.getUserReports(filter: _getFilterText());

    // For now, using placeholder data
    setState(() {
      reports = _getFilteredReports();
    });
  }

  String _getFilterText() {
    switch (_selectedFilter) {
      case 0: return 'all';
      case 1: return 'active';
      case 2: return 'resolved';
      default: return 'all';
    }
  }

  List<Map<String, dynamic>> _getFilteredReports() {
    // Placeholder data - TODO: Replace with backend data
    final allReports = [
      {
        'id': '1',
        'type': 'Suspicious Person',
        'status': 'REVIEWING',
        'location': '123 Main Street',
        'time': '2 hours ago',
        'desc': 'Individual loitering around school entrance...'
      },
      {
        'id': '2',
        'type': 'Vehicle Activity',
        'status': 'RESOLVED',
        'location': 'Oak Street',
        'time': 'Yesterday',
        'desc': 'Vehicle circling neighbourhood multiple times...'
      },
      {
        'id': '3',
        'type': 'Abandoned Package',
        'status': 'SUBMITTED',
        'location': 'City Park',
        'time': '3 days ago',
        'desc': 'Suspicious backpack left unattended...'
      },
    ];

    if (_selectedFilter == 0) return allReports; // All
    if (_selectedFilter == 1) return allReports.where((r) => r['status'] == 'REVIEWING' || r['status'] == 'SUBMITTED').toList(); // Active
    if (_selectedFilter == 2) return allReports.where((r) => r['status'] == 'RESOLVED').toList(); // Resolved

    return allReports;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            const SizedBox(height: 20),
            _buildFilterRow(),
            const SizedBox(height: 15),
            Expanded(child: _buildReportList()),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigation(),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0xFF36599F),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'My Reports',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 24,
            ),
          ),
          SizedBox(height: 5),
          Text(
            'Track your submissions',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: [
          _buildFilterButton('All', 0),
          const SizedBox(width: 12),
          _buildFilterButton('Active', 1),
          const SizedBox(width: 12),
          _buildFilterButton('Resolved', 2),
        ],
      ),
    );
  }

  Widget _buildFilterButton(String label, int index) {
    final bool selected = _selectedFilter == index;
    return GestureDetector(
      onTap: () async {
        setState(() {
          _selectedFilter = index;
        });
        await _loadReports(); // Reload data when filter changes
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: selected ? const Color(0xFF36599F) : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: selected ? const Color(0xFF36599F) : Colors.grey[300]!,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: selected ? Colors.white : Colors.grey[600],
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  Widget _buildReportList() {
    if (reports.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.description_outlined,
              size: 64,
              color: Colors.grey[400],
            ),
            const SizedBox(height: 16),
            Text(
              'No reports found',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      itemCount: reports.length,
      separatorBuilder: (_, __) => const SizedBox(height: 15),
      itemBuilder: (context, i) {
        final r = reports[i];
        return _buildReportCard(r);
      },
    );
  }

  Widget _buildReportCard(Map<String, dynamic> report) {
    final String type = report['type'];
    final String status = report['status'];
    final String location = report['location'];
    final String time = report['time'];
    final String desc = report['desc'];
    final String id = report['id'];

    Color statusColor;
    String statusText;
    Color statusTextColor;
    String buttonText;
    Color buttonColor;
    Color buttonTextColor;

    switch (status) {
      case 'REVIEWING':
        statusColor = const Color(0xFF93C5FD);
        statusText = 'REVIEWING';
        statusTextColor = const Color(0xFF1E40AF);
        buttonText = 'View Details';
        buttonColor = const Color(0xFF36599F);
        buttonTextColor = const Color(0xFF36599F);
        break;
      case 'RESOLVED':
        statusColor = const Color(0xFF86EFAC);
        statusText = 'RESOLVED';
        statusTextColor = const Color(0xFF15803D);
        buttonText = 'View Resolution';
        buttonColor = const Color(0xFF10B981);
        buttonTextColor = const Color(0xFF10B981);
        break;
      case 'SUBMITTED':
        statusColor = const Color(0xFFFDE68A);
        statusText = 'SUBMITTED';
        statusTextColor = const Color(0xFF92400E);
        buttonText = 'Pending';
        buttonColor = const Color(0xFFEAB308);
        buttonTextColor = const Color(0xFFCA8A04);
        break;
      default:
        statusColor = Colors.grey[300]!;
        statusText = status;
        statusTextColor = Colors.grey[600]!;
        buttonText = 'View';
        buttonColor = Colors.grey[500]!;
        buttonTextColor = Colors.grey[600]!;
    }

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.08),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
        border: Border(
          left: BorderSide(color: statusColor, width: 4),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  type,
                  style: const TextStyle(
                    color: Color(0xFF36599F),
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: statusColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    statusText,
                    style: TextStyle(
                      color: statusTextColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                const Icon(
                  Icons.location_on,
                  color: Color(0xFFEF4444),
                  size: 16,
                ),
                const SizedBox(width: 6),
                Text(
                  '$location • $time',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              desc,
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey[700],
                height: 1.4,
              ),
            ),
            const SizedBox(height: 15),
            SizedBox(
              height: 36,
              child: OutlinedButton(
                onPressed: () {
                  // Navigate to report details with backend integration
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ReportDetailsScreen(
                        //reportId: id,
                        //reportData: report, // Pass the report data
                      ),
                    ),
                  );
                },
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: buttonColor, width: 1.5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                ),
                child: Text(
                  buttonText,
                  style: TextStyle(
                    color: buttonTextColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavigation() {
    return Container(
      height: 90,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(Icons.home, 'Home', 0, false, () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const DashboardScreen(),
              ),
            );
          }),
          _buildNavItem(Icons.description, 'Reports', 1, true, () {
            // Current screen, no navigation needed
          }),
          _buildNavItem(Icons.message, 'Messages', 2, false, () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const MessagesScreen(),
              ),
            );
          }),
          _buildNavItem(Icons.person, 'Profile', 3, false, () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ProfileScreen(),
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index, bool isSelected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFE0E7FF) : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isSelected ? const Color(0xFF36599F) : Colors.grey[600],
              size: 24,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color: isSelected ? const Color(0xFF36599F) : Colors.grey[600],
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}