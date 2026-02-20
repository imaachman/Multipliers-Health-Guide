import 'package:flutter/material.dart';

class IframeScreen extends StatefulWidget {
  const IframeScreen({super.key});

  @override
  State<IframeScreen> createState() => _IframeScreenState();
}

class _IframeScreenState extends State<IframeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Iframe not supported on this platform',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
