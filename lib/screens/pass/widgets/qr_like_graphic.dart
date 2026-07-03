import 'package:flutter/material.dart';

/// A decorative QR-like graphic. It is not a real scannable code — it renders
/// a deterministic module pattern seeded from [seed] with finder squares in
/// the corners, purely as a clean digital-pass visual.
class QrLikeGraphic extends StatelessWidget {
  const QrLikeGraphic({
    super.key,
    required this.seed,
    this.size = 150,
    this.foreground = const Color(0xFF081210),
    this.background = const Color(0xFFF3EFE3),
  });

  final String seed;
  final double size;
  final Color foreground;
  final Color background;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      padding: EdgeInsets.all(size * 0.08),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(size * 0.12),
      ),
      child: CustomPaint(
        painter: _QrPainter(seed: seed, fg: foreground, bg: background),
      ),
    );
  }
}

class _QrPainter extends CustomPainter {
  _QrPainter({required this.seed, required this.fg, required this.bg});

  final String seed;
  final Color fg;
  final Color bg;

  static const int _grid = 21;

  @override
  void paint(Canvas canvas, Size size) {
    final cell = size.width / _grid;
    final paint = Paint()..color = fg;

    // Deterministic pseudo-random bits from the seed.
    var h = 2166136261;
    for (final code in seed.codeUnits) {
      h = (h ^ code) * 16777619;
      h &= 0x7fffffff;
    }
    bool bit(int x, int y) {
      var v = h ^ (x * 73856093) ^ (y * 19349663);
      v &= 0x7fffffff;
      return (v % 100) < 46;
    }

    bool inFinder(int x, int y) {
      bool corner(int ox, int oy) =>
          x >= ox && x < ox + 7 && y >= oy && y < oy + 7;
      return corner(0, 0) || corner(_grid - 7, 0) || corner(0, _grid - 7);
    }

    for (var y = 0; y < _grid; y++) {
      for (var x = 0; x < _grid; x++) {
        if (inFinder(x, y)) continue;
        if (bit(x, y)) {
          final r = Rect.fromLTWH(
            x * cell + cell * 0.08,
            y * cell + cell * 0.08,
            cell * 0.84,
            cell * 0.84,
          );
          canvas.drawRRect(
            RRect.fromRectAndRadius(r, Radius.circular(cell * 0.22)),
            paint,
          );
        }
      }
    }

    // Finder patterns in three corners.
    void finder(int ox, int oy) {
      final outer = Rect.fromLTWH(ox * cell, oy * cell, cell * 7, cell * 7);
      canvas.drawRRect(
        RRect.fromRectAndRadius(outer, Radius.circular(cell * 1.4)),
        paint,
      );
      final inner = Rect.fromLTWH(
        (ox + 1) * cell,
        (oy + 1) * cell,
        cell * 5,
        cell * 5,
      );
      canvas.drawRRect(
        RRect.fromRectAndRadius(inner, Radius.circular(cell * 1.0)),
        Paint()..color = bg,
      );
      final dot = Rect.fromLTWH(
        (ox + 2) * cell,
        (oy + 2) * cell,
        cell * 3,
        cell * 3,
      );
      canvas.drawRRect(
        RRect.fromRectAndRadius(dot, Radius.circular(cell * 0.7)),
        paint,
      );
    }

    finder(0, 0);
    finder(_grid - 7, 0);
    finder(0, _grid - 7);
  }

  @override
  bool shouldRepaint(covariant _QrPainter old) =>
      old.seed != seed || old.fg != fg || old.bg != bg;
}
