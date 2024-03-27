import 'package:flutter/material.dart';

import 'package:get/get.dart';

class RePasswordView extends GetView {
  const RePasswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RePasswordView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'RePasswordView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
