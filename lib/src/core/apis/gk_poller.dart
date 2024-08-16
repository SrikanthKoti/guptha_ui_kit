import 'dart:async';

class GkPoller {
  Timer? _timer;

  DateTime? startTime;

  void startPolling(
      {required Duration interval,
      required Duration timeout,
      required Function callback,
      required Function timeoutCallback}) {
    startTime = DateTime.now();
    _timer = Timer.periodic(interval, (timer) {
      if (startTime != null) {
        if (DateTime.now().difference(startTime!).inMinutes >= timeout.inMinutes) {
          cancel();
          timeoutCallback();
          return;
        }
      }

      callback();
    });
  }

  void cancel() {
    _timer?.cancel();
  }
}
