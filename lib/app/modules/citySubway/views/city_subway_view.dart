import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/city_subway_controller.dart';

class CitySubwayView extends GetView<CitySubwayController> {
  const CitySubwayView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CitySubwayView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'CitySubwayView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
