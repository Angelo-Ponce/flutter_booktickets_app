import 'package:flutter/material.dart';

class AppLayoutBuilder extends StatelessWidget {

  final int sections;
  final double width;
  final bool? isColor;

  const AppLayoutBuilder({
    super.key,
    required this.sections,
    this.width = 5,
    this.isColor,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext buildContext, BoxConstraints constraints) { 
        return Flex(
          direction: Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: List.generate(
              (constraints.constrainWidth()/sections).floor(), (index) => SizedBox(
                width: width,
                height: 1,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: isColor == null ? Colors.white : Colors.grey.shade300
                  )
                ),
              )
            ),
        );
      },
    );
  }
}