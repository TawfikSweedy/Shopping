


import 'package:flutter/material.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

import 'layout_widgets/condition_widget.dart';

class InternetCheckerWidget extends StatefulWidget {
  final Widget child;
  const InternetCheckerWidget({super.key, required this.child});

  @override
  State<InternetCheckerWidget> createState() => _InternetCheckerWidgetState();
}

class _InternetCheckerWidgetState extends State<InternetCheckerWidget> {
  bool isConnected = true;

  @override
  void initState() {
    InternetConnection().onStatusChange.listen((status) {
      setState(() {
        switch (status) {
          case InternetStatus.connected:
            isConnected = true;
            break;
          case InternetStatus.disconnected:
            isConnected = false;
            break;
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ConditionWidget(
      conditionWidget: const CheckerWidget(),
      condition: !isConnected,
      child: widget.child,
    );
  }
}

class CheckerWidget extends StatelessWidget {
  const CheckerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const  Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.wifi_off,
            color: Colors.red,
            size: 100.0,
          ),
          SizedBox(height: 20),
          Text(
            "No Internet Connection",
            style: TextStyle(fontSize: 24),
          ),
        ],
      ),

    );
  }
}
