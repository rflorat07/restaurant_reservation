import 'package:flutter/material.dart';

class TFullScreenLoader {
  static void openLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      useSafeArea: false,
      builder:
          (_) => PopScope(
            canPop: false,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(76, 149, 128, 0.5),
              ),
              child: const Center(
                child: CircularProgressIndicator(color: Colors.white),
              ),
            ),
          ),
    );
  }

  static void stopLoading(BuildContext context) {
    if (ModalRoute.of(context)?.isCurrent == false) {
      Navigator.of(context).pop();
    }
  }
}
