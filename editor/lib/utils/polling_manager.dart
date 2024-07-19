import 'dart:async';

/// PollingManager is a class that helps to run a function periodically.
class PollingManager {
  final Duration interval;
  final void Function(PollingManager) action;
  final int? limit;
  Timer? _timer;
  int _limit = -1;

  PollingManager({
    required this.interval,
    required this.action,
    this.limit,
  }) : assert((limit ?? 1) > 0);

  void start() {
    _timer?.cancel();
    _limit = limit ?? -1;
    callAction();
    _timer = Timer.periodic(interval, (Timer t) {
      callAction();
    });
  }

  void stop() {
    if (_timer != null) {
      _timer!.cancel();
      _timer = null;
    }
  }

  void callAction() {
    action(this);
    if (_limit != -1) {
      _limit--;
      if (_limit == 0) {
        _timer?.cancel();
      }
    }
  }

  bool get isActive => _timer?.isActive ?? false;
}
