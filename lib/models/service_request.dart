import 'package:ios_fl_n_app_shield_9678/models/request_status.dart';

/// A guest service request submitted from the Services tab.
class ServiceRequest {
  ServiceRequest({
    required this.id,
    required this.serviceName,
    required this.guestName,
    required this.preferredTime,
    required this.guestCount,
    required this.note,
    required this.status,
    required this.submittedOn,
  });

  final String id;
  final String serviceName;
  final String guestName;
  final String preferredTime;
  final int? guestCount;
  final String note;
  final RequestStatus status;
  final String submittedOn;
}
