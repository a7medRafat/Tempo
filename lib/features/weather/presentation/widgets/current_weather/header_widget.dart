import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/leading_btn.dart';
import '../../../data/models/SevenWeatherModel.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget(
      {super.key,
      required this.model,
      required this.title,
      required this.fun,
      required this.icon});

  final SevenWeatherModel model;
  final String title;
  final IconData icon;
  final fun;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        LeadingIcon(icon: icon, fun: fun),
        Flexible(
          child: Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(CupertinoIcons.map, color: Colors.white),
                Text(
                  " $title",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(10.0),
          child: Icon(CupertinoIcons.arrow_merge),
        )
      ],
    );
  }
}
