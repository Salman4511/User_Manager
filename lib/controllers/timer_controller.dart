import 'dart:async';
import 'package:flutter/material.dart';

class TimerProvider with ChangeNotifier {
  Timer? _timer;
  int _seconds = 59; // Start timer at 59 seconds

  int get seconds => _seconds;
  bool get isRunning => _timer != null && _timer!.isActive;

  void startTimer() {
    if (isRunning) return;

    _seconds = 59; // Initialize to 59 seconds
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_seconds == 0) {
        timer.cancel();
        _timer = null;
      } else {
        _seconds--;
        notifyListeners();
      }
    });
  }

  void stopTimer() {
    _timer?.cancel();
    _timer = null;
  }

  String get formattedTime {
    final seconds = _seconds % 60;
    return '${seconds.toString().padLeft(2, '0')} Sec';
  }
}
