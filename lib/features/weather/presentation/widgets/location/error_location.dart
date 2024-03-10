import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import '../../../../../config/app_colors.dart';

class ErrorLocation extends StatelessWidget {
  const ErrorLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height / 3,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: AppColors.stroColor),
          child: GestureDetector(
            onTap: ()=>ZoomDrawer.of(context)!.open(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.error_outline,
                  size: 100,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text('No matching location found.'),
                const SizedBox(height: 5),
                Text('tap to search again',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Colors.white54))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
