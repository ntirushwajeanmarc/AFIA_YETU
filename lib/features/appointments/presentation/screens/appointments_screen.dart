import 'package:flutter/material.dart';

class AppointmentsScreen extends StatefulWidget {
  const AppointmentsScreen({super.key});

  @override
  State<AppointmentsScreen> createState() => _AppointmentsScreenState();
}

class _AppointmentsScreenState extends State<AppointmentsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text(
          'Appointments',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF4A90E2),
        foregroundColor: Colors.white,
        elevation: 0,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white70,
          tabs: const [
            Tab(text: 'Upcoming'),
            Tab(text: 'Past'),
            Tab(text: 'Book New'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildUpcomingAppointments(),
          _buildPastAppointments(),
          _buildBookNewAppointment(),
        ],
      ),
    );
  }

  Widget _buildUpcomingAppointments() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildAppointmentCard(
          'Dr. Sarah Johnson',
          'Cardiologist',
          'Today, 2:30 PM',
          'Video Consultation',
          Colors.green,
          'Confirmed',
          isUpcoming: true,
        ),
        const SizedBox(height: 12),
        _buildAppointmentCard(
          'Dr. Michael Brown',
          'General Physician',
          'Tomorrow, 10:00 AM',
          'In-person Visit',
          Colors.orange,
          'Pending',
          isUpcoming: true,
        ),
        const SizedBox(height: 12),
        _buildAppointmentCard(
          'Dr. Emily Davis',
          'Dermatologist',
          'Dec 15, 3:00 PM',
          'Video Consultation',
          Colors.green,
          'Confirmed',
          isUpcoming: true,
        ),
      ],
    );
  }

  Widget _buildPastAppointments() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildAppointmentCard(
          'Dr. Robert Wilson',
          'Orthopedic',
          'Dec 1, 11:00 AM',
          'In-person Visit',
          Colors.blue,
          'Completed',
          isUpcoming: false,
        ),
        const SizedBox(height: 12),
        _buildAppointmentCard(
          'Dr. Lisa Anderson',
          'Psychiatrist',
          'Nov 28, 4:00 PM',
          'Video Consultation',
          Colors.blue,
          'Completed',
          isUpcoming: false,
        ),
      ],
    );
  }

  Widget _buildBookNewAppointment() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Select Specialty',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          _buildSpecialtyGrid(),
          const SizedBox(height: 24),
          const Text(
            'Available Doctors',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          _buildDoctorList(),
        ],
      ),
    );
  }

  Widget _buildSpecialtyGrid() {
    final specialties = [
      {'name': 'General', 'icon': Icons.medical_services, 'color': Colors.blue},
      {'name': 'Cardiology', 'icon': Icons.favorite, 'color': Colors.red},
      {'name': 'Dermatology', 'icon': Icons.face, 'color': Colors.orange},
      {'name': 'Orthopedic', 'icon': Icons.accessible, 'color': Colors.green},
      {'name': 'Psychiatry', 'icon': Icons.psychology, 'color': Colors.purple},
      {'name': 'Pediatrics', 'icon': Icons.child_care, 'color': Colors.pink},
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 1,
      ),
      itemCount: specialties.length,
      itemBuilder: (context, index) {
        final specialty = specialties[index];
        return GestureDetector(
          onTap: () {
            // TODO: Filter doctors by specialty
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withValues(alpha: 0.1),
                  spreadRadius: 1,
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: (specialty['color'] as Color).withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    specialty['icon'] as IconData,
                    color: specialty['color'] as Color,
                    size: 24,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  specialty['name'] as String,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildDoctorList() {
    return Column(
      children: [
        _buildDoctorCard(
          'Dr. Sarah Johnson',
          'Cardiologist',
          '4.8',
          '150+ reviews',
          'assets/doctor1.jpg',
        ),
        const SizedBox(height: 12),
        _buildDoctorCard(
          'Dr. Michael Brown',
          'General Physician',
          '4.9',
          '200+ reviews',
          'assets/doctor2.jpg',
        ),
        const SizedBox(height: 12),
        _buildDoctorCard(
          'Dr. Emily Davis',
          'Dermatologist',
          '4.7',
          '120+ reviews',
          'assets/doctor3.jpg',
        ),
      ],
    );
  }

  Widget _buildDoctorCard(
    String name,
    String specialty,
    String rating,
    String reviews,
    String imagePath,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 30,
            backgroundColor: Color(0xFF4A90E2),
            child: Icon(Icons.person, color: Colors.white, size: 30),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  specialty,
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.amber, size: 16),
                    const SizedBox(width: 4),
                    Text(
                      rating,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      reviews,
                      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    ),
                  ],
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              _showBookingDialog(context, name);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF4A90E2),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text('Book'),
          ),
        ],
      ),
    );
  }

  Widget _buildAppointmentCard(
    String doctorName,
    String specialty,
    String time,
    String type,
    Color statusColor,
    String status, {
    required bool isUpcoming,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 25,
                backgroundColor: Color(0xFF4A90E2),
                child: Icon(Icons.medical_services, color: Colors.white),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      doctorName,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      specialty,
                      style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(
                          Icons.access_time,
                          size: 16,
                          color: Colors.grey[600],
                        ),
                        const SizedBox(width: 4),
                        Text(
                          time,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: statusColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  status,
                  style: TextStyle(
                    color: statusColor,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          if (isUpcoming) ...[
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      // TODO: Reschedule appointment
                    },
                    style: OutlinedButton.styleFrom(
                      foregroundColor: const Color(0xFF4A90E2),
                      side: const BorderSide(color: Color(0xFF4A90E2)),
                    ),
                    child: const Text('Reschedule'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // TODO: Join consultation
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF4A90E2),
                      foregroundColor: Colors.white,
                    ),
                    child: Text(
                      type == 'Video Consultation'
                          ? 'Join Call'
                          : 'View Details',
                    ),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  void _showBookingDialog(BuildContext context, String doctorName) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Book Appointment with $doctorName'),
          content: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Select your preferred date and time:'),
              SizedBox(height: 16),
              // TODO: Add date and time picker
              Text('Available slots will be shown here.'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Appointment booked with $doctorName'),
                  ),
                );
              },
              child: const Text('Book'),
            ),
          ],
        );
      },
    );
  }
}
