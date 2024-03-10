import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/leading_btn.dart';

class TomorrowHeader extends StatelessWidget {
  const TomorrowHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 5, right: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          LeadingIcon(icon: Icons.close_rounded,
              fun: () => Navigator.pop(context)),
          Row(
            children: [
              const Icon(CupertinoIcons.calendar),
              const SizedBox(width: 5),
              Text(
                '7 days',
                style: Theme.of(context).textTheme.bodyLarge,
              )
            ],
          ),
          IconButton(
              onPressed: () {}, icon: Container(child: Icon(Icons.more_vert))),
        ],
      ),
    );
  }
}
