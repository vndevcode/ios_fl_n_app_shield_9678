import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ios_fl_n_app_shield_9678/models/guest_service_model.dart';
import 'package:ios_fl_n_app_shield_9678/state/app_scope.dart';
import 'package:ios_fl_n_app_shield_9678/theme/app_colors.dart';
import 'package:ios_fl_n_app_shield_9678/theme/app_text_styles.dart';
import 'package:ios_fl_n_app_shield_9678/widgets/app_modal.dart';
import 'package:ios_fl_n_app_shield_9678/widgets/app_text_field.dart';
import 'package:ios_fl_n_app_shield_9678/widgets/confirm_modal.dart';
import 'package:ios_fl_n_app_shield_9678/widgets/primary_button.dart';
import 'package:ios_fl_n_app_shield_9678/widgets/secondary_button.dart';

/// Opens the service request form. On successful submit it stores the request
/// and shows a confirmation modal.
Future<void> showServiceRequestModal(
  BuildContext context,
  GuestServiceModel service,
) {
  return showAppModal<void>(
    context: context,
    builder: (ctx) => _ServiceRequestForm(service: service),
  );
}

class _ServiceRequestForm extends StatefulWidget {
  const _ServiceRequestForm({required this.service});

  final GuestServiceModel service;

  @override
  State<_ServiceRequestForm> createState() => _ServiceRequestFormState();
}

class _ServiceRequestFormState extends State<_ServiceRequestForm> {
  final _name = TextEditingController();
  final _time = TextEditingController();
  final _guests = TextEditingController();
  final _note = TextEditingController();

  String? _nameError;
  String? _timeError;

  @override
  void dispose() {
    _name.dispose();
    _time.dispose();
    _guests.dispose();
    _note.dispose();
    super.dispose();
  }

  void _submit() {
    setState(() {
      _nameError =
          _name.text.trim().isEmpty ? 'Please enter a guest name.' : null;
      _timeError = _time.text.trim().isEmpty
          ? 'Please enter a preferred date or time.'
          : null;
    });
    if (_nameError != null || _timeError != null) return;

    final count = int.tryParse(_guests.text.trim());
    AppScope.read(context).addServiceRequest(
      serviceName: widget.service.title,
      guestName: _name.text.trim(),
      preferredTime: _time.text.trim(),
      guestCount: count,
      note: _note.text.trim(),
    );

    Navigator.of(context).pop(); // close form
    showConfirmModal(
      context,
      title: 'Request Sent',
      message: 'Your request has been sent for review.',
      buttonLabel: 'Done',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ModalTitleBar(title: 'Request Service'),
        const SizedBox(height: 16),
        // Selected service.
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: AppColors.emeraldDeep,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: AppColors.neonDim, width: 1.2),
          ),
          child: Row(
            children: [
              FaIcon(widget.service.icon, size: 18, color: AppColors.neon),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Selected Service', style: AppText.caption),
                    const SizedBox(height: 2),
                    Text(widget.service.title, style: AppText.cardTitle),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 18),
        AppTextField(
          label: 'Guest Name',
          controller: _name,
          hint: 'Enter your name',
          icon: FontAwesomeIcons.user,
          errorText: _nameError,
          onChanged: (_) {
            if (_nameError != null) setState(() => _nameError = null);
          },
        ),
        const SizedBox(height: 16),
        AppTextField(
          label: 'Preferred Date or Time',
          controller: _time,
          hint: 'e.g. Today, 7:30 PM',
          icon: FontAwesomeIcons.clock,
          errorText: _timeError,
          onChanged: (_) {
            if (_timeError != null) setState(() => _timeError = null);
          },
        ),
        const SizedBox(height: 16),
        AppTextField(
          label: 'Number of Guests (optional)',
          controller: _guests,
          hint: 'e.g. 2',
          icon: FontAwesomeIcons.userGroup,
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 16),
        AppTextField(
          label: 'Short Note (optional)',
          controller: _note,
          hint: 'Add any details for our staff',
          icon: FontAwesomeIcons.penToSquare,
          maxLines: 3,
        ),
        const SizedBox(height: 24),
        PrimaryButton(
          label: 'Submit Request',
          icon: FontAwesomeIcons.paperPlane,
          onPressed: _submit,
        ),
        const SizedBox(height: 12),
        SecondaryButton(
          label: 'Cancel',
          onPressed: () => Navigator.of(context).pop(),
        ),
      ],
    );
  }
}
