import 'package:flutter/material.dart';
import 'package:ios_fl_n_app_shield_9678/models/request_status.dart';

/// Small solid badge that shows a request lifecycle status.
class RequestStatusBadge extends StatelessWidget {
  const RequestStatusBadge({super.key, required this.status});

  final RequestStatus status;

  @override
  Widget build(BuildContext context) {
    final c = status.color;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Color.alphaBlend(c.withValues(alpha: 0.16), const Color(0xFF10201A)),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: c, width: 1.2),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 7,
            height: 7,
            decoration: BoxDecoration(color: c, shape: BoxShape.circle),
          ),
          const SizedBox(width: 7),
          Text(
            status.label,
            style: TextStyle(
              fontSize: 11.5,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.2,
              color: c,
            ),
          ),
        ],
      ),
    );
  }
}
