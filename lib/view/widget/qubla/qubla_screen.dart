import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:my_islamy/view/widget/qubla/qiblah_compass.dart';
import 'package:my_islamy/view/widget/qubla/qiblah_maps.dart';

import 'loading_indicator.dart';

class QublaScreen extends StatefulWidget {
  @override
  State<QublaScreen> createState() => _QublaScreenState();
}

class _QublaScreenState extends State<QublaScreen> {
  final _deviceSupport = FlutterQiblah.androidDeviceSensorSupport();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: _deviceSupport,
        builder: (_, AsyncSnapshot<bool?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return LoadingIndicator();
          if (snapshot.hasError)
            return Center(
              child: Text("Error: ${snapshot.error.toString()}"),
            );

          if (snapshot.data!)
            return QiblahCompass();
          else
            return QiblahMaps();
        },
      ),
    );
  }
}
