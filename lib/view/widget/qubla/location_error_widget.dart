import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_islamy/consts/color_manager.dart';
import 'package:my_islamy/consts/string_manager.dart';

class LocationErrorWidget extends StatelessWidget {
  final String? error;
  final Function? callback;

  const LocationErrorWidget({Key? key, this.error, this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const box = SizedBox(height: 32);
    const errorColor = Color(0xffb00020);

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const Icon(
            Icons.location_off,
            size: 150,
            color: errorColor,
          ),
          box,
          Text(
            error!,
            style:
                const TextStyle(color: errorColor, fontWeight: FontWeight.bold),
          ),
          box,
          ElevatedButton(
            child: Text(StringManager.retry.tr),
            style: ElevatedButton.styleFrom(
              primary: ColorsManager.mainColor,
            ),
            onPressed: () {
              if (callback != null) callback!();
            },
          )
        ],
      ),
    );
  }
}
