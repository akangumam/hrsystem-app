import 'package:flutter/foundation.dart';

class AttendanceState extends ChangeNotifier {
  bool _isClockedIn = false;
  DateTime? _lastClockInTime;
  DateTime? _lastClockOutTime;

  bool get isClockedIn => _isClockedIn;
  DateTime? get lastClockInTime => _lastClockInTime;
  DateTime? get lastClockOutTime => _lastClockOutTime;

  void clockIn() {
    _isClockedIn = true;
    _lastClockInTime = DateTime.now();
    notifyListeners();
  }

  void clockOut() {
    _isClockedIn = false;
    _lastClockOutTime = DateTime.now();
    notifyListeners();
  }

  // Method untuk mengecek apakah user sudah clock in hari ini
  bool isClockInToday() {
    if (_lastClockInTime == null) return false;
    final now = DateTime.now();
    return _lastClockInTime!.year == now.year &&
        _lastClockInTime!.month == now.month &&
        _lastClockInTime!.day == now.day;
  }

  // Method untuk mendapatkan durasi kerja hari ini
  Duration? getWorkingDuration() {
    if (_lastClockInTime == null) return null;
    if (!_isClockedIn) {
      if (_lastClockOutTime == null) return null;
      return _lastClockOutTime!.difference(_lastClockInTime!);
    }
    return DateTime.now().difference(_lastClockInTime!);
  }
}
