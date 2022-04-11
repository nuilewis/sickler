import 'package:flutter/material.dart';
import 'package:sickler/constants.dart';
import 'package:sickler/size_config.dart';

class RecommendationCard extends StatelessWidget {
  final String title;
  final String description;
  final String? iconLink;
  const RecommendationCard(
      {Key? key, required this.title, required this.description, this.iconLink})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
    padding: const EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
        color: kOrange80,
        borderRadius: BorderRadius.circular(34),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(color: Colors.white),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2!
                      .copyWith(color: Colors.white),
                )
              ],
            ),
          ),
          const SizedBox(
            width: kDefaultPadding,
          ),
          Expanded(
            flex: 1,
            child: Container(
              width: relWidth(130 - kDefaultPadding, context),
              height: relWidth(130 - kDefaultPadding, context),
              decoration: BoxDecoration(
                  color: kOrange, borderRadius: BorderRadius.circular(24)),
              // child: SvgPicture.asset(iconLink),
            ),
          )
        ],
      ),
    );
  }
}
