import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ios_fl_n_app_shield_9678/models/resort_event_model.dart';
import 'package:ios_fl_n_app_shield_9678/state/app_scope.dart';
import 'package:ios_fl_n_app_shield_9678/theme/app_colors.dart';
import 'package:ios_fl_n_app_shield_9678/theme/app_text_styles.dart';
import 'package:ios_fl_n_app_shield_9678/widgets/app_modal.dart';
import 'package:ios_fl_n_app_shield_9678/widgets/app_text_field.dart';
import 'package:ios_fl_n_app_shield_9678/widgets/confirm_modal.dart';
import 'package:ios_fl_n_app_shield_9678/widgets/primary_button.dart';
import 'package:ios_fl_n_app_shield_9678/widgets/secondary_button.dart';

Future<void> showEventRequestModal(
  BuildContext context,
  ResortEventModel event,
) {
  return showAppModal<void>(
    context: context,
    builder: (ctx) => _EventRequestForm(event: event),
  );
}

class _EventRequestForm extends StatefulWidget {
  const _EventRequestForm({required this.event});

  final ResortEventModel event;

  @override
  State<_EventRequestForm> createState() => _EventRequestFormState();
}

class _EventRequestFormState extends State<_EventRequestForm> {
  final _name = TextEditingController();
  final _guests = TextEditingController();
  final _note = TextEditingController();

  String? _nameError;
  String? _guestsError;

  @override
  void dispose() {
    _name.dispose();
    _guests.dispose();
    _note.dispose();
    super.dispose();
  }

  void _submit() {
    final count = int.tryParse(_guests.text.trim());
    setState(() {
      _nameError =
          _name.text.trim().isEmpty ? 'Please enter a guest name.' : null;
      _guestsError = (count == null || count <= 0)
          ? 'Enter the number of guests.'
          : null;
    });
    if (_nameError != null || _guestsError != null) return;

    AppScope.read(context).addEventRequest(
      eventTitle: widget.event.title,
      eventDate: widget.event.date,
      eventTime: widget.event.time,
      guestName: _name.text.trim(),
      guestCount: count!,
      contactNote: _note.text.trim(),
    );

    Navigator.of(context).pop();
    showConfirmModal(
      context,
      title: 'Request Sent',
      message: 'Your event request has been sent for review.',
      buttonLabel: 'Done',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ModalTitleBar(title: 'Send Event Request'),
        const SizedBox(height: 16),
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
              const FaIcon(FontAwesomeIcons.calendarDay,
                  size: 18, color: AppColors.neon),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.event.title, style: AppText.cardTitle),
                    const SizedBox(height: 2),
                    Text('${widget.event.date}  •  ${widget.event.time}',
                        style: AppText.caption),
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
          label: 'Number of Guests',
          controller: _guests,
          hint: 'e.g. 2',
          icon: FontAwesomeIcons.userGroup,
          keyboardType: TextInputType.number,
          errorText: _guestsError,
          onChanged: (_) {
            if (_guestsError != null) setState(() => _guestsError = null);
          },
        ),
        const SizedBox(height: 16),
        AppTextField(
          label: 'Preferred Contact Note (optional)',
          controller: _note,
          hint: 'How should staff reach you?',
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
