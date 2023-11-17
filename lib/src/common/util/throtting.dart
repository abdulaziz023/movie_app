import 'dart:async';

class Throttling {
  Timer? _timer;
  final Duration duration;

  Throttling(this.duration);

  void call(void Function() onChange) {
    _timer?.cancel();

    _timer = Timer(duration, onChange);
  }

  void dispose() {
    _timer?.cancel();
    _timer = null;
  }
}