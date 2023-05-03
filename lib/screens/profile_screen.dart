import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_booktickets_app/utils/app_layout.dart';
import 'package:flutter_booktickets_app/utils/app_styles.dart';
import 'package:flutter_booktickets_app/widgets/app_column_layout.dart';
import 'package:flutter_booktickets_app/widgets/layout_builder_widget.dart';
import 'package:gap/gap.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: AppLayout.getHeight(20),
          vertical: AppLayout.getHeight(20)
        ),
        children: [
          Gap(AppLayout.getHeight(40)),
          const TopContainer(),
          Gap(AppLayout.getHeight(8)),
          Divider(color: Colors.grey.shade300),
          Gap(AppLayout.getHeight(8)),
          const StackInfo(),
          Gap(AppLayout.getHeight(30)),
          Text('Accumuled miles', style: Styles.headLineStyle2),
          Gap(AppLayout.getHeight(25)),
          const ContainerMiles()
        ],
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
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: AppLayout.getHeight(86),
          width: AppLayout.getWidth(86),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppLayout.getHeight(10)),
            image: const DecorationImage(
              image: AssetImage('assets/images/img_1.png')
            )
          ),
        ),
        Gap(AppLayout.getHeight(10)),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Book Tickets', style: Styles.headLineStyle1),
            Gap(AppLayout.getHeight(2)),
            Text('New-York',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade500
              )
            ),
            Gap(AppLayout.getHeight(8)),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppLayout.getHeight(100)),
                color: const Color(0xFFFEF4F3)
              ),
              padding: EdgeInsets.all(AppLayout.getHeight(3)),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(3),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFF526799)
                    ),
                    child: const Icon(FluentSystemIcons.ic_fluent_shield_filled,
                    color: Colors.white, size: 15),
                  ),
                  Gap(AppLayout.getHeight(5)),
                  const Text('Premium status',
                    style: TextStyle(
                      color: Color(0xFF526799),
                      fontWeight: FontWeight.w600
                    )
                  ),
                  Gap(AppLayout.getHeight(5))
                ],
              ),
            )
          ],
        ),
        const Spacer(),
        Column(
          children: [
            InkWell(
              onTap: () {},
              child: Text('Edit',
                style: Styles.textStyle.copyWith(color: Styles.primaryColor, fontWeight: FontWeight.w300)
              ),
            )
          ],
        )
      ],
    );
  }
}

class StackInfo extends StatelessWidget {
  const StackInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: AppLayout.getHeight(90),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Styles.primaryColor,
            borderRadius: BorderRadius.circular(AppLayout.getHeight(18))
          ),
        ),
        Positioned(
          right: -45,
          top: -40,
          child: Container(
            padding: EdgeInsets.all(AppLayout.getHeight(30)),
            decoration: BoxDecoration(
              color: Colors.transparent,
              shape: BoxShape.circle,
              border: Border.all(width: 18, color: const Color(0xFF264CD2))
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: AppLayout.getHeight(25), vertical: AppLayout.getHeight(20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                maxRadius: 25,
                backgroundColor: Colors.white,
                child: Icon(
                  FluentSystemIcons.ic_fluent_lightbulb_filament_filled,
                  color: Styles.primaryColor,
                  size: 27
                ),
              ),
              Gap(AppLayout.getHeight(12)),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'You\'ve got a new award',
                    style: Styles.headLineStyle2.copyWith(color: Colors.white)),
                  Text(
                    'You have 150 flights in a year',
                    style: Styles.headLineStyle4.copyWith(
                      fontWeight: FontWeight.w500,
                      color: Colors.white.withOpacity(0.9),
                      fontSize: 16
                    ),
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}

class ContainerMiles extends StatelessWidget {
  const ContainerMiles({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(15)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppLayout.getWidth(18)),
        color: Styles.bgColor,
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
          Gap(AppLayout.getHeight(15)),
          Text('192802',
            style: TextStyle(
              fontSize: 45,
              color: Styles.textColor,
              fontWeight: FontWeight.w600
            )
          ),
          Gap(AppLayout.getHeight(25)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Miles accrued', style: Styles.headLineStyle4.copyWith(fontSize: 16)),
              Text('23 May 2021', style: Styles.headLineStyle4.copyWith(fontSize: 16))
            ],
          ),
          Gap(AppLayout.getHeight(4)),
          Divider(color: Colors.grey.shade300),
          Gap(AppLayout.getHeight(4)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              AppColumnLayout(
                alignment: CrossAxisAlignment.start, 
                firstText: '23 042',
                secondText: 'Miles',
                isColor: true,
              ),
              AppColumnLayout(
                alignment: CrossAxisAlignment.end, 
                firstText: 'Airline CO',
                secondText: 'Received from',
                isColor: true,
              )
            ],
          ),
          Gap(AppLayout.getHeight(12)),
          const AppLayoutBuilder(sections: 12, isColor: true),
          Gap(AppLayout.getHeight(12)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              AppColumnLayout(
                alignment: CrossAxisAlignment.start, 
                firstText: '24',
                secondText: 'Miles',
                isColor: true,
              ),
              AppColumnLayout(
                alignment: CrossAxisAlignment.end, 
                firstText: 'McDonal\'s',
                secondText: 'Received from',
                isColor: true,
              )
            ],
          ),
          Gap(AppLayout.getHeight(12)),
          const AppLayoutBuilder(sections: 12, isColor: true),
          Gap(AppLayout.getHeight(12)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              AppColumnLayout(
                alignment: CrossAxisAlignment.start, 
                firstText: '52 340',
                secondText: 'Miles',
                isColor: true,
              ),
              AppColumnLayout(
                alignment: CrossAxisAlignment.end, 
                firstText: 'Exuma',
                secondText: 'Received from',
                isColor: true,
              )
            ],
          ),
          Gap(AppLayout.getHeight(25)),
          InkWell(
            onTap: () {},
            child: Center(
              child: Text(
                'How to get more miles',
                style: Styles.textStyle.copyWith(
                  color: Styles.primaryColor,
                  fontWeight: FontWeight.w500
                )
              ),
            ),
          )
        ],
      ),
    );
  }
}
