import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Widgets.dart';

/// circular image
class CircularImage extends StatelessWidget {
  /// image url
 final String? imageUrl, assetsUrl;
  /// image size
  final double? size;

  ///constructor
  const CircularImage({super.key, this.assetsUrl, this.imageUrl,this.size});

  @override
  Widget build(BuildContext context) {
    return ViewAppImage(
      assetsUrl: assetsUrl,
      imageUrl: imageUrl,
      height: size??40.sp,
      width: size??40.sp,
      radius: size??40.sp,
    );
  }
}
