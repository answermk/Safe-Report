import 'package:flutter/material.dart';

class MyWatchGroupsScreen extends StatelessWidget {
  const MyWatchGroupsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(context),
                const SizedBox(height: 18),
                _buildWatchGroupCard(
                  icon: Icons.apartment,
                  title: 'Oak Street Residential',
                  subtitle: 'Oak Street Neighborhood',
                  members: 15,
                  alerts: 2,
                  status: 'Active',
                ),
                const SizedBox(height: 16),
                _buildWatchGroupCard(
                  icon: Icons.business,
                  title: 'Downtown Business',
                  subtitle: 'Business District',
                  members: 8,
                  alerts: 1,
                  status: 'Active',
                  coverage: 'Mon-Fri 9AM-5PM',
                  schedule: 'Business hours',
                ),
                const SizedBox(height: 24),
                _buildFindMoreGroups(),
                const SizedBox(height: 24),
                _buildYourImpact(),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xFF36599F),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'My Watch Groups',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          SizedBox(height: 4),
          Text(
            'Community safety partnerships',
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWatchGroupCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required int members,
    required int alerts,
    required String status,
    String? coverage,
    String? schedule,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.blue.shade100, width: 1.2),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: const Color(0xFF36599F), size: 32),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFF36599F))),
                  Text(subtitle, style: const TextStyle(fontSize: 13)),
                ],
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFFD1FADF),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  status,
                  style: const TextStyle(
                    color: Color(0xFF039855),
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.location_on, color: Colors.red, size: 18),
              const SizedBox(width: 4),
              Text('$members members • $alerts new alert${alerts > 1 ? 's' : ''}', style: const TextStyle(fontSize: 13, color: Colors.black54)),
            ],
          ),
          if (coverage != null && schedule != null) ...[
            const SizedBox(height: 8),
            Text('Coverage: $coverage', style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
            Text('Your schedule: $schedule', style: const TextStyle(fontSize: 13)),
          ],
          const SizedBox(height: 12),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF36599F),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                ),
                child: const Text('View Group', style: TextStyle(color: Colors.white)),
              ),
              const SizedBox(width: 12),
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Color(0xFF36599F)),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                ),
                child: const Text('Message', style: TextStyle(color: Color(0xFF36599F))),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFindMoreGroups() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.blue.shade100, width: 1.2),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Icon(Icons.search, color: Color(0xFF36599F)),
              SizedBox(width: 8),
              Text('Find More Groups', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF36599F), fontSize: 15)),
            ],
          ),
          const SizedBox(height: 8),
          const Text('Join watch groups in other areas you frequent', style: TextStyle(fontSize: 13)),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF36599F),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              padding: EdgeInsets.symmetric(horizontal: 18, vertical: 8),
            ),
            child: const Text('Browse Watch Group', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  Widget _buildYourImpact() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.blue.shade100, width: 1.2),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Your Impact', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF36599F), fontSize: 15)),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('Reports Submitted'),
              Text('12', style: TextStyle(color: Color(0xFF36599F), fontWeight: FontWeight.bold)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('Patrol Hours'),
              Text('24', style: TextStyle(color: Color(0xFF36599F), fontWeight: FontWeight.bold)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('Community'),
              Text('Gold', style: TextStyle(color: Color(0xFFFFC107), fontWeight: FontWeight.bold)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('Rank'),
              Text('Member', style: TextStyle(color: Color(0xFF36599F), fontWeight: FontWeight.bold)),
            ],
          ),
        ],
      ),
    );
  }
}