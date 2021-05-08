import 'package:oktoast/oktoast.dart';

class Toast {
  static show(String msg, {duration = 2000}) {
    if (msg.isNotEmpty) {
      showToast(msg, duration: Duration(milliseconds: duration));
    }
  }

  static cancelToast() {
    dismissAllToast();
  }
}

class GetToast {}
