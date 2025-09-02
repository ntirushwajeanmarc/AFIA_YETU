class Appointment {
  final String id;
  final String patientId;
  final String doctorId;
  final String patientName;
  final String doctorName;
  final String doctorSpecialty;
  final DateTime scheduledAt;
  final AppointmentStatus status;
  final String? notes;
  final String? consultationType;

  Appointment({
    required this.id,
    required this.patientId,
    required this.doctorId,
    required this.patientName,
    required this.doctorName,
    required this.doctorSpecialty,
    required this.scheduledAt,
    required this.status,
    this.notes,
    this.consultationType,
  });

  factory Appointment.fromJson(Map<String, dynamic> json) {
    return Appointment(
      id: json['id'],
      patientId: json['patient_id'],
      doctorId: json['doctor_id'],
      patientName: json['patient_name'],
      doctorName: json['doctor_name'],
      doctorSpecialty: json['doctor_specialty'],
      scheduledAt: DateTime.parse(json['scheduled_at']),
      status: AppointmentStatus.values.firstWhere(
        (e) => e.name == json['status'],
        orElse: () => AppointmentStatus.pending,
      ),
      notes: json['notes'],
      consultationType: json['consultation_type'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'patient_id': patientId,
      'doctor_id': doctorId,
      'patient_name': patientName,
      'doctor_name': doctorName,
      'doctor_specialty': doctorSpecialty,
      'scheduled_at': scheduledAt.toIso8601String(),
      'status': status.name,
      'notes': notes,
      'consultation_type': consultationType,
    };
  }
}

enum AppointmentStatus { pending, confirmed, inProgress, completed, cancelled }
