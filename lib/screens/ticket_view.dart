import 'package:flutter/material.dart';
import 'package:flutter_booktickets_app/utils/app_layout.dart';
import 'package:flutter_booktickets_app/utils/app_styles.dart';
import 'package:flutter_booktickets_app/widgets/app_column_layout.dart';
import 'package:flutter_booktickets_app/widgets/layout_builder_widget.dart';
import 'package:flutter_booktickets_app/widgets/thick_container.dart';
import 'package:gap/gap.dart';

class TicketView extends StatelessWidget {

  final Map<String,dynamic> ticket;
  final bool? isColor;

  const TicketView({super.key, required this.ticket, this.isColor});

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return SizedBox(
      width: size.width * 0.85,
      height: AppLayout.getHeight(171),
      child: Container(
        margin: EdgeInsets.only(right: AppLayout.getHeight(16)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /**
             * showing the blue part of the card/ticket
             */
            TopContainer(ticket: ticket, isColor: isColor),
            /**
             * showing the orange part of the card/ticket
             */
            RowContainer(isColor: isColor),
            /**
             * bottom part of the orange card/ticket
             */
            BottomContainer(ticket: ticket, isColor: isColor)
          ],
        ),
      ),
    );
  }
}

class TopContainer extends StatelessWidget {
  
  final Map<String,dynamic> ticket;
  final bool? isColor;

  const TopContainer({
    super.key, required this.ticket, this.isColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isColor == null ? const Color(0xFF526799) : Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(AppLayout.getHeight(21)),
          topLeft: Radius.circular(AppLayout.getHeight(21))
        )
      ),
      padding: EdgeInsets.all(AppLayout.getHeight(16)),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                ticket['from']['code'],
                style: isColor == null
                      ? Styles.headLineStyle3.copyWith(color: Colors.white)
                      : Styles.headLineStyle3
              ),
              const Spacer(),
              ThickContainer(isColor: isColor),
              Expanded(child: Stack(
                children: [
                  SizedBox(
                    height: AppLayout.getHeight(24),
                    child: LayoutBuilder(
                      builder: (BuildContext context, BoxConstraints constraints) {
                        return Flex(
                          direction: Axis.horizontal,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate((constraints.constrainWidth()/6).floor(), (index) => SizedBox(
                            width: 3,
                            height: 1,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                color: isColor == null
                                      ?Colors.white
                                      : Colors.grey.shade300
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
                      child: Icon(Icons.local_airport_rounded,
                              color: isColor == null
                              ? Colors.white
                              : const Color(0xFF8ACCF7)),
                    ),
                  )
                ],
              )),
              ThickContainer(isColor: isColor),
              const Spacer(),
              Text(ticket['to']['code'],
                style: isColor == null
                      ? Styles.headLineStyle3.copyWith(color: Colors.white)
                      : Styles.headLineStyle3)
            ],
          ),
          const Gap(3),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: AppLayout.getWidth(100),
                child: Text(ticket['from']['name'],
                        style: isColor == null
                        ? Styles.headLineStyle4.copyWith(color: Colors.white)
                        : Styles.headLineStyle4),
              ),
              Text(ticket['flying_time'],
                  style: isColor == null
                        ? Styles.headLineStyle3.copyWith(color: Colors.white)
                        : Styles.headLineStyle3),
              SizedBox(
                width: AppLayout.getWidth(100),
                child: Text(ticket['to']['name'],
                            textAlign: TextAlign.end,
                            style: isColor == null
                                  ? Styles.headLineStyle4.copyWith(color: Colors.white)
                                  : Styles.headLineStyle4),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class RowContainer extends StatelessWidget {

  final bool? isColor;

  const RowContainer({super.key, this.isColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: isColor == null ? Styles.orangeColor : Colors.white,
      child: Row(
        children: [
          SizedBox(
            height: AppLayout.getHeight(20),
            width: AppLayout.getWidth(10),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: isColor == null ? Colors.grey.shade200 : Colors.white,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10)
                )
              )
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: AppLayoutBuilder(sections: 15, isColor: isColor)
            ),
          ),
          SizedBox(
            height: 20,
            width: 10,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: isColor == null ? Colors.grey.shade200 : Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10)
                )
              )
            ),
          )
        ],
      ),
    );
  }
}

class BottomContainer extends StatelessWidget {

  final Map<String,dynamic> ticket;
  final bool? isColor;

  const BottomContainer({super.key, required this.ticket, this.isColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isColor == null ? Styles.orangeColor : Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(isColor == null ? 21 : 0),
          bottomRight: Radius.circular(isColor == null ? 21 : 0)
        )
      ),
      padding: const EdgeInsets.only(left: 16, top: 10, right: 16, bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppColumnLayout(
            alignment: CrossAxisAlignment.start,
            firstText: ticket['date'],
            secondText: 'Date',
            isColor: isColor,
          ),
          AppColumnLayout(
            alignment: CrossAxisAlignment.center,
            firstText: ticket['departure_time'],
            secondText: 'Departure time',
            isColor: isColor
          ),
          AppColumnLayout(
            alignment: CrossAxisAlignment.end,
            firstText: '${ticket['number']}',
            secondText: 'Number',
            isColor: isColor),
        ],
      )
    );
  }
}