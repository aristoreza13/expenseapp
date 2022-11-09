import 'package:expenseapp/app/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InfoBalance extends StatelessWidget {
  const InfoBalance({
    Key? key,
    required this.isIncome,
    required this.balance,
  }) : super(key: key);

  final bool isIncome;
  final int balance;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      width: Get.width * 0.4,
      decoration: BoxDecoration(
        color: isIncome == true ? appGreen : appRed,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: appWhite,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Image.asset(isIncome == true
                ? "assets/icons/in.png"
                : "assets/icons/out.png"),
          ),
          const SizedBox(width: 5),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  isIncome == true ? "Income" : "Outcome",
                  style: const TextStyle(color: appWhite),
                ),
                const SizedBox(height: 5),
                FittedBox(
                  child: Text(
                    // balance.toString(),
                    "\$$balance",
                    style: const TextStyle(
                      color: appWhite,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
