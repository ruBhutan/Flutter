import 'package:athang_expense_tracker/base/style/text_styles.dart';
import 'package:flutter/material.dart';

import '../../screens/common/account_card.dart';

class SummaryAccounts extends StatelessWidget {
  const SummaryAccounts({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      margin: EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Current balances',
              style: TypoStyles().kSectionHeader,
            ),
          ),
          Container(
            height: 200,
            margin: EdgeInsets.only(bottom: 8),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  AccountCard(),
                  AccountCard(),
                  AccountCard(),
                  AccountCard(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
