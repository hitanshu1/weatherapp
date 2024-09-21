import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constants/constants.dart';

/// horizontal slider
class HorizontalSlider extends StatefulWidget {
  /// total item
  final int itemCount;

  /// item builder
  final Widget? Function(int index) item;

  /// auto play
  final bool? autoPlay;

  /// on image indicator

  final bool onImageIndicator;

  /// height
  final double? height;

  /// enlarge center page
  final bool enlargeCenterPage;
/// bottom pedding of item
  final bool bottomPedding;

  /// constructor
  const HorizontalSlider(
      {super.key,
      required this.item,
      required this.itemCount,
      this.autoPlay,
      this.onImageIndicator = true,
      this.bottomPedding=false,
      this.height,
      this.enlargeCenterPage = true});

  @override
  State<HorizontalSlider> createState() => _HorizontalSliderState();
}

class _HorizontalSliderState extends State<HorizontalSlider> {
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    if (widget.onImageIndicator) {
      return Stack(
        children: [
          slider(),
          Positioned.fill(
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: buildIndicator(
                    activeColor: Colors.white,
                    inactiveColor: Colors.white54,
                  )))
        ],
      );
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        slider(),
        buildIndicator(),
      ],
    );
  }

  Widget slider() {
    return CarouselSlider.builder(
        options: CarouselOptions(
            autoPlay: widget.autoPlay ?? true,
            height: widget.height ?? 180.sp,
            viewportFraction: 1,
            enlargeCenterPage: widget.enlargeCenterPage,
            onPageChanged: (int index, CarouselPageChangedReason reason) {
              setState(() {
                activeIndex = index;
              });
            }),
        itemCount: widget.itemCount > 0 ? widget.itemCount : 0,
        itemBuilder: (BuildContext context, int index, int realIndex) {
          if (widget.itemCount > 0 && index < widget.itemCount + 1) {
            return Padding(
              padding:  EdgeInsets.only(bottom: widget.bottomPedding?5.sp:0),
              child: widget.item(index) ?? Container(),
            );
          } else {
            return Container();
          }
        });
  }

  // Builds the widget for the indicator row based on the itemCount.
  Widget buildIndicator(
      {Color activeColor = Colors.black,
      Color inactiveColor = Colors.black45}) {
    return Padding(
      padding:  EdgeInsets.all(SizeConfig.spaceBetween),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.start,
        children: List.generate(widget.itemCount, (index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                activeIndex = index;
              });
            },
            child: Container(
              width:  activeIndex == index?20.sp:10.sp,
              height: 10.sp,
              margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.sp),
                color: activeIndex == index ? activeColor : inactiveColor,
              ),
            ),
          );
        }),
      ),
    );
  }
}
