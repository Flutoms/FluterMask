import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:metamask/models/transaction_model.dart';
import 'package:metamask/service/transaction_api.dart';
import 'package:metamask/utils/assets.dart';
import 'package:metamask/utils/colors.dart';
import 'package:metamask/utils/ether_service.dart';
import 'package:metamask/utils/size_config.dart';
import 'package:metamask/utils/text_styles.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'cupertino_transction_details_component.dart';

class TransactionsComponent extends StatefulWidget {
  const TransactionsComponent({
    Key? key,
  }) : super(key: key);

  @override
  State<TransactionsComponent> createState() => _TransactionsComponentState();
}

class _TransactionsComponentState extends State<TransactionsComponent> {
  @override
  Widget build(BuildContext context) {
    TransactionApi().transactions();
    return ValueListenableBuilder(
        valueListenable: listenableTransactions,
        builder: (context, List<Transactions> values, child) {
          return Expanded(
            child: Container(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.only(
                    left: SizeConfig.heightAdjusted(3),
                    right: SizeConfig.heightAdjusted(3),
                    top: SizeConfig.heightAdjusted(3)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Transactions',
                        style: GlobalTextStyles.regularText(
                            fontSize: 14, color: GlobalColors.green)),
                    SizedBox(height: SizeConfig.heightAdjusted(3)),
                    MediaQuery.removeViewPadding(
                        context: context,
                        removeTop: true,
                        child: Flexible(
                            child: RefreshIndicator(
                              onRefresh: () =>  TransactionApi().transactions(),
                              child: ListView.builder(
                                  itemCount: values.length,
                                  itemBuilder: (context, index) =>
                                      TransactionItem(
                                          transaction: values[index])),
                            )))
                  ],
                ),
              ),
            ),
          );
        });
  }
}

class TransactionItem extends StatelessWidget {
  const TransactionItem({Key? key, required this.transaction})
      : super(key: key);

  final Transactions transaction;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showCupertinoModalBottomSheet(
          context: context,
          builder: (context) =>
              TransactionDetailsSheetIos(transaction: transaction)),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.heightAdjusted(2),
            vertical: SizeConfig.heightAdjusted(4)),
        margin: EdgeInsets.only(bottom: SizeConfig.heightAdjusted(2)),
        decoration: BoxDecoration(
            color: GlobalColors.white,
            borderRadius: BorderRadius.circular(SizeConfig.heightAdjusted(3))),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(SizeConfig.heightAdjusted(2)),
              decoration: BoxDecoration(
                color: GlobalColors.greenAccent,
                shape: BoxShape.circle,
              ),
              child: SvgPicture.asset(
                GlobalAssets.polygonLogo,
                height: SizeConfig.heightAdjusted(3),
                width: SizeConfig.heightAdjusted(3),
              ),
            ),
            SizedBox(width: SizeConfig.heightAdjusted(3)),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text('From: ',
                              style: GlobalTextStyles.medium(
                                  color: GlobalColors.black, fontSize: 12)),
                          Text(EtherService()
                              .truncateString(text: transaction.from)),
                        ],
                      ),
                      SizedBox(height: SizeConfig.heightAdjusted(1.5)),
                      Row(
                        children: [
                          Text('To: ',
                              style: GlobalTextStyles.medium(
                                  color: GlobalColors.black, fontSize: 12)),
                          Text(EtherService()
                              .truncateString(text: transaction.to)),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(transaction.timeStamp,
                          style: GlobalTextStyles.medium(
                              color: GlobalColors.black.withAlpha(100),
                              fontSize: 12)),
                      SizedBox(height: SizeConfig.heightAdjusted(1.5)),
                      Row(
                        children: [
                          Text('Block: ',
                              style: GlobalTextStyles.medium(
                                  color: GlobalColors.black, fontSize: 12)),
                          Text(transaction.blockNumber),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
