import 'package:flutter/material.dart';
import 'package:ios_fl_n_app_shield_9678/theme/app_colors.dart';
import 'package:ios_fl_n_app_shield_9678/theme/app_text_styles.dart';

class WeekDay {
  const WeekDay({
    required this.weekday,
    required this.dayNumber,
    required this.shortLabel,
    required this.isToday,
    required this.count,
  });

  final int weekday; // 1..7
  final int dayNumber; // calendar day-of-month
  final String shortLabel; // Mon, Tue…
  final bool isToday;
  final int count; // number of events that day
}

/// Horizontal current-week calendar with selectable days.
class WeekCalendar extends StatelessWidget {
  const WeekCalendar({
    super.key,
    required this.days,
    required this.selectedWeekday,
    required this.onSelect,
  });

  final List<WeekDay> days;
  final int selectedWeekday;
  final ValueChanged<int> onSelect;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (final d in days)
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3),
              child: _DayCell(
                day: d,
                selected: d.weekday == selectedWeekday,
                onTap: () => onSelect(d.weekday),
              ),
            ),
          ),
      ],
    );
  }
}

class _DayCell extends StatelessWidget {
  const _DayCell({
    required this.day,
    required this.selected,
    required this.onTap,
  });

  final WeekDay day;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final baseColor = selected ? AppColors.emerald : AppColors.surface;
    return Material(
      color: baseColor,
      borderRadius: BorderRadius.circular(14),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: selected
                  ? AppColors.neon
                  : (day.isToday ? AppColors.neonDim : AppColors.border),
              width: selected ? 1.6 : 1.1,
            ),
          ),
          child: Column(
            children: [
              Text(
                day.shortLabel,
                style: AppText.caption.copyWith(
                  color: selected ? AppColors.neon : AppColors.textMuted,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                '${day.dayNumber}',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: selected ? AppColors.textCream : AppColors.textCream,
                ),
              ),
              const SizedBox(height: 7),
              Container(
                width: 6,
                height: 6,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: day.count > 0
                      ? (selected ? AppColors.neon : AppColors.gold)
                      : Colors.transparent,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
