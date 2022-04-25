import 'package:flutter/material.dart';

class ChannelPage extends StatefulWidget {
  const ChannelPage({
    Key? key,
  }) : super(key: key);

  @override
  State<ChannelPage> createState() => _ChannelPageState();
}

class _ChannelPageState extends State<ChannelPage> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Channel Page'),
      ),
    );
  }
}
