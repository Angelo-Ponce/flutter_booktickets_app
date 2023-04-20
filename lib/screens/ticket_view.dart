import 'package:flutter/material.dart';
import 'package:flutter_booktickets_app/utils/app_layout.dart';
import 'package:flutter_booktickets_app/utils/app_styles.dart';
import 'package:flutter_booktickets_app/widgets/thick_container.dart';
import 'package:gap/gap.dart';

class TicketView extends StatelessWidget {
  const TicketView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return SizedBox(
      width: size.width,
      height: 200,
      child: Container(
        color: Colors.greenAccent,
        margin: const EdgeInsets.only(left: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            /**
             * showing the blue part of the card/ticket
             */
            TopContainer(),
            /**
             * showing the orange part of the card/ticket
             */
            BottomContainer()
          ],
        ),
      ),
    );
  }
}

class TopContainer extends StatelessWidget {
  const TopContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF526799),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(21),
          topLeft: Radius.circular(21)
        )
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            children: [
              Text('NYC', style: Styles.headLineStyle3.copyWith(color: Colors.white)),
              const Spacer(),
              const ThickContainer(),
              Expanded(child: Stack(
                children: [
                  SizedBox(
                    height: 24,
                    child: LayoutBuilder(
                      builder: (BuildContext context, BoxConstraints constraints) {
                        return Flex(
                          direction: Axis.horizontal,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate((constraints.constrainWidth()/6).floor(), (index) => const SizedBox(
                            width: 3,
                            height: 1,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                color: Colors.white
                              )
                            ),
                          )),
                        );
                      },
                    ),
                  ),
                  Center(
                    child: Transform.rotate(
                      angle: 1.5,
                      child: const Icon(Icons.local_airport_rounded, color: Colors.white,),
                    ),
                  )
                ],
              )),
              const ThickContainer(),
              const Spacer(),
              Text('LDN', style: Styles.headLineStyle3.copyWith(color: Colors.white))
            ],
          ),
          const Gap(3),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 100,
                child: Text('New-York', style: Styles.headLineStyle4.copyWith(color: Colors.white)),
              ),
              Text('8H 30M', style: Styles.headLineStyle3.copyWith(color: Colors.white)),
              SizedBox(
                width: 100,
                child: Text('London', textAlign: TextAlign.end, style: Styles.headLineStyle4.copyWith(color: Colors.white)),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class BottomContainer extends StatelessWidget {
  const BottomContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}