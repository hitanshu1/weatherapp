
import 'package:flutter/material.dart';

import '../../../core/constants/constants.dart';


/// Weather Info Tile
class WeatherInfoTile extends StatelessWidget {
  /// constructor
  const WeatherInfoTile({
    super.key,
    required this.title,
    required this.value,
  }) : super();
/// title
  final String title;
  /// value
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
    
      children: [
        // Title
        Text(
          title,
          style: AppTextstyle.subtitleText,
        ),
        const SizedBox(height: 10),
        Text(
          value,
          style: AppTextstyle.smallHeader,
        )
      ],
    );
  }
}
