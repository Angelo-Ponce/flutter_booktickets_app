import 'package:flutter/material.dart';
import 'package:flutter_booktickets_app/utils/app_layout.dart';
import 'package:flutter_booktickets_app/utils/app_styles.dart';
import 'package:flutter_booktickets_app/widgets/app_double_text_widget.dart';
import 'package:flutter_booktickets_app/widgets/app_icon_text_widget.dart';
import 'package:flutter_booktickets_app/widgets/app_ticket_tabs.dart';
import 'package:gap/gap.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: AppLayout.getHeight(20), vertical: AppLayout.getWidth(20)),
        children: [
          Gap(AppLayout.getHeight(40)),
          Text('What are\nyou looking for?', style: Styles.headLineStyle1.copyWith(fontSize: AppLayout.getWidth(35))),
          Gap(AppLayout.getHeight(20)),
          const AppTicketTabs(firstTab: 'Airline tickets', secondTab: 'Hotels'),
          Gap(AppLayout.getHeight(25)),
          const AppIconText(icon: Icons.flight_takeoff_rounded, text: 'Departure'),
          Gap(AppLayout.getHeight(20)),
          const AppIconText(icon: Icons.flight_land_rounded, text: 'Arrival'),
          Gap(AppLayout.getHeight(25)),
          Container(
            padding: EdgeInsets.symmetric(
              vertical: AppLayout.getWidth(18),
              horizontal: AppLayout.getHeight(15)),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppLayout.getWidth(10)),
              color: const Color(0xD91130CE)
            ),
            child: Center(
              child: Text('Find tickets', style: Styles.textStyle.copyWith(color: Colors.white)),
            ),
          ),
          Gap(AppLayout.getHeight(40)),
          const AppDoubleText(bigText: 'Upcoming Flights', smallText: 'View all'),
          Gap(AppLayout.getHeight(15)),
          const BottomSection()
        ],
      ),
    );
  }
}

class BottomSection extends StatelessWidget {
  const BottomSection({super.key});

  @override
  Widget build(BuildContext context) {

    final size = AppLayout.getSize(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: AppLayout.getHeight(425),
          width: size.width * .42,
          padding: EdgeInsets.symmetric(horizontal: AppLayout.getHeight(15), vertical: AppLayout.getHeight(15)),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppLayout.getHeight(20)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade200,
                blurRadius: 1,
                spreadRadius: 1
              )
            ]
          ),
          child: Column(
            children: [
              Container(
                height: AppLayout.getHeight(180),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppLayout.getHeight(12)),
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/sit.jpg')
                  )
                ),
              ),
              Gap(AppLayout.getHeight(12)),
              Text('20% discount on the early booking of this flight. Don\'t miss.',
              style: Styles.headLineStyle2)
            ],
          ),
        ),
        Column(
          children: [
            Stack(
              children: [
                Container(
                  width: size.width * 0.44,
                  height: AppLayout.getHeight(200),
                  decoration: BoxDecoration(
                    color: const Color(0xFF3AB8B8),
                    borderRadius: BorderRadius.circular(AppLayout.getHeight(18))
                  ),
                  padding: EdgeInsets.symmetric(horizontal: AppLayout.getHeight(15), vertical: AppLayout.getHeight(15)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Discount\nfor survey',
                        style: Styles.headLineStyle2.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        )
                      ),
                      Gap(AppLayout.getHeight(10)),
                      Text(
                        'Take the survey about our services and get discount',
                        style: Styles.headLineStyle2.copyWith(
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          fontSize: 18
                        )
                      )
                    ],
                  ),
                ),
                Positioned(
                  right: -45,
                  top: -40,
                  child: Container(
                    padding: EdgeInsets.all(AppLayout.getHeight(30)),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(width: 18, color: const Color(0xFF189999)),
                      color: Colors.transparent
                    ),
                  ),
                )
              ],
            ),
            Gap(AppLayout.getHeight(15)),
            Container(
              width: size.width * 0.44,
              height: AppLayout.getHeight(210),
              padding: EdgeInsets.symmetric(horizontal: AppLayout.getHeight(15), vertical: AppLayout.getHeight(15)),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppLayout.getHeight(18)),
                color: const Color(0xFFEC6545)
              ),
              child: Column(
                children: [
                  Text(
                    'Take love',
                    style: Styles.headLineStyle2.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Gap(AppLayout.getHeight(5)),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '😍',
                          style: TextStyle(fontSize: AppLayout.getHeight(35))
                        ),
                        TextSpan(
                          text: '🥰',
                          style: TextStyle(fontSize: AppLayout.getHeight(50))
                        ),
                        TextSpan(
                          text: '😘',
                          style: TextStyle(fontSize: AppLayout.getHeight(35))
                        )
                      ]
                    )
                  )
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}