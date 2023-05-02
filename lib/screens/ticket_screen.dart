import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_booktickets_app/screens/ticket_view.dart';
import 'package:flutter_booktickets_app/utils/app_info_list.dart';
import 'package:flutter_booktickets_app/utils/app_layout.dart';
import 'package:flutter_booktickets_app/utils/app_styles.dart';
import 'package:flutter_booktickets_app/widgets/app_column_layout.dart';
import 'package:flutter_booktickets_app/widgets/app_ticket_tabs.dart';
import 'package:flutter_booktickets_app/widgets/layout_builder_widget.dart';
import 'package:gap/gap.dart';

class TicketScreen extends StatelessWidget {
  const TicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: Stack(
        children: [
          ListView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: AppLayout.getHeight(20), vertical: AppLayout.getWidth(20)),
            children: [
              Gap(AppLayout.getHeight(40)),
              Text('Tickets', style: Styles.headLineStyle1),
              Gap(AppLayout.getHeight(20)),
              const AppTicketTabs(firstTab: 'Upcoming', secondTab: 'Previous'),
              Gap(AppLayout.getHeight(20)),
              Container(
                padding: EdgeInsets.only(left: AppLayout.getHeight(15)),
                child: TicketView(ticket: ticketList[0], isColor: true),
              ),
              const SizedBox(height: 1),
              Container(
                color: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: AppLayout.getHeight(15), vertical: AppLayout.getHeight(20)),
                margin: EdgeInsets.symmetric(horizontal: AppLayout.getHeight(15)),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        AppColumnLayout(alignment: CrossAxisAlignment.start, firstText: 'Flutter DB', secondText: 'Passenger', isColor: false),
                        AppColumnLayout(alignment: CrossAxisAlignment.end, firstText: '5871 587452', secondText: 'Passport', isColor: false)
                      ],
                    ),
                    Gap(AppLayout.getHeight(20)),
                    const AppLayoutBuilder(sections: 20, width: 10, isColor: false),
                    Gap(AppLayout.getHeight(20)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        AppColumnLayout(alignment: CrossAxisAlignment.start, firstText: '0055 444 77147', secondText: 'Number of E-ticket', isColor: false),
                        AppColumnLayout(alignment: CrossAxisAlignment.end, firstText: 'B2SG28', secondText: 'Booking code', isColor: false)
                      ],
                    ),
                    Gap(AppLayout.getHeight(20)),
                    const AppLayoutBuilder(sections: 20, width: 10, isColor: false),
                    Gap(AppLayout.getHeight(20)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                Image.asset('assets/images/visa.png', scale: 11),
                                Text(' *** 2462',style: Styles.headLineStyle3)
                              ],
                            ),
                            const Gap(5),
                            Text('Payment method', style: Styles.headLineStyle4)
                          ],
                        ),
                        const AppColumnLayout(
                          alignment: CrossAxisAlignment.end,
                          firstText: '\$249.99',
                          secondText: 'Price',
                          isColor: false
                        ),
                      ],
                    )
                  ],
                ),
              ),
              /**
               * bar code
               */
              Container(
                padding: EdgeInsets.symmetric(horizontal: AppLayout.getHeight(15)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(AppLayout.getHeight(15)),
                  child: BarcodeWidget(
                    data: 'https://github.com/Angelo-Ponce',
                    barcode: Barcode.code128(),
                    drawText: false,
                    color: Styles.textColor,
                    width: double.infinity,
                    height: 70
                  ),
                ),
              )
            ],
          ),
        ],
      )
    );
  }
}