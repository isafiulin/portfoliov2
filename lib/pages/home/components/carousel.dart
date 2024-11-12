import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../core/utils/constants.dart';
import '../../../core/utils/screen_helper.dart';
import 'carousel_items.dart';

class Carousel extends StatelessWidget {
  final CarouselSliderController carouselController =
      CarouselSliderController();

  Carousel({super.key});
  @override
  Widget build(BuildContext context) {
    double carouselContainerHeight = MediaQuery.of(context).size.height *
        (ScreenHelper.isMobile(context) ? .7 : .85);
    return SizedBox(
      height: carouselContainerHeight,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            child: CarouselSlider(
              carouselController: carouselController,
              options: CarouselOptions(
                // autoPlay: true,
                viewportFraction: 1,
                scrollPhysics: const NeverScrollableScrollPhysics(),
                height: carouselContainerHeight,
              ),
              items: List.generate(
                carouselItems(carouselContainerHeight, context).length,
                (index) => Builder(
                  builder: (BuildContext context) {
                    return Container(
                      constraints: BoxConstraints(
                        minHeight: carouselContainerHeight,
                      ),
                      child: ScreenHelper(
                        // Responsive views
                        desktop: _buildDesktop(
                          context,
                          carouselItems(carouselContainerHeight, context)[index]
                              .text,
                          carouselItems(carouselContainerHeight, context)[index]
                              .image,
                        ),
                        tablet: _buildTablet(
                          context,
                          carouselItems(carouselContainerHeight, context)[index]
                              .text,
                          carouselItems(carouselContainerHeight, context)[index]
                              .image,
                        ),
                        mobile: _buildMobile(
                          context,
                          carouselItems(carouselContainerHeight, context)[index]
                              .text,
                          carouselItems(carouselContainerHeight, context)[index]
                              .image,
                        ),
                      ),
                    );
                  },
                ),
              ).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

// Big screens
Widget _buildDesktop(BuildContext context, Widget text, Widget image) {
  return Center(
    child: ResponsiveBreakpoints(
      breakpoints: const [
        Breakpoint(start: 0, end: 450, name: MOBILE),
        Breakpoint(start: 451, end: 800, name: TABLET),
        Breakpoint(start: 801, end: 1920, name: DESKTOP),
        Breakpoint(start: 1921, end: double.infinity, name: '4K'),
      ],
      child: Row(
        children: [
          Expanded(
            child: text,
          ),
          Expanded(
            child: image,
          )
        ],
      ),
    ),
  );
}

// Mid screens
Widget _buildTablet(BuildContext context, Widget text, Widget image) {
  return Center(
    child: ResponsiveBreakpoints(
      breakpoints: const [
        Breakpoint(start: 0, end: 450, name: MOBILE),
        Breakpoint(start: 451, end: 800, name: TABLET),
        Breakpoint(start: 801, end: 1920, name: DESKTOP),
        Breakpoint(start: 1921, end: double.infinity, name: '4K'),
      ],
      child: Row(
        children: [
          Expanded(
            child: text,
          ),
          Expanded(
            child: image,
          )
        ],
      ),
    ),
  );
}

// SMall Screens

Widget _buildMobile(BuildContext context, Widget text, Widget image) {
  return Container(
    constraints: BoxConstraints(
      maxWidth: getMobileMaxWidth(context),
    ),
    width: double.infinity,
    child: text,
  );
}
