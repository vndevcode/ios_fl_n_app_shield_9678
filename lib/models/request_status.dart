import 'package:flutter/material.dart';
import 'package:ios_fl_n_app_shield_9678/theme/app_colors.dart';

/// Lifecycle status shared by service requests and event requests.
enum RequestStatus {
  pending,
  inReview,
  confirmed,
  completed;

  String get label => switch (this) {
        RequestStatus.pending => 'Pending',
        RequestStatus.inReview => 'In Review',
        RequestStatus.confirmed => 'Confirmed',
        RequestStatus.completed => 'Completed',
      };

  Color get color => switch (this) {
        RequestStatus.pending => AppColors.statusPending,
        RequestStatus.inReview => AppColors.statusReview,
        RequestStatus.confirmed => AppColors.statusConfirmed,
        RequestStatus.completed => AppColors.statusCompleted,
      };
}
