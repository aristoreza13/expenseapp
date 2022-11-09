import 'dart:math';

import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:expenseapp/app/constant/color.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../controllers/home_controller.dart';
import 'widgets/info_balance.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);
  final List<SalesData> chartData = [
    SalesData(DateTime(2010), 35),
    SalesData(DateTime(2011), 28),
    SalesData(DateTime(2012), 34),
    SalesData(DateTime(2013), 32),
    SalesData(DateTime(2014), 40)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            // Background
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    appYellowSoft,
                    appVioletSoft,
                  ],
                ),
              ),
            ),
            // PageView
            SafeArea(
              child: Column(
                children: [
                  // Nonscroll
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const CircleAvatar(
                          backgroundColor: appPrimary,
                        ),
                        Row(
                          children: const [
                            Icon(Icons.keyboard_arrow_down_outlined),
                            Text("November"),
                          ],
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.notifications_active,
                            color: appPrimary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text("Account Balance"),
                  const SizedBox(height: 10),
                  const Text(
                    "\$9400",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      InfoBalance(
                        isIncome: true,
                        balance: 5000,
                      ),
                      InfoBalance(
                        isIncome: false,
                        balance: 2500,
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  // Scrollable
                  Expanded(
                    child: ListView(
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            "Spend Frequency",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        // Grafik
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: SizedBox(
                            height: 200,
                            width: chartData.length *
                                100, // setiap chart dikalikan 100
                            child: SfCartesianChart(
                              primaryXAxis: DateTimeAxis(),
                              series: <ChartSeries>[
                                // Renders line chart
                                SplineSeries<SalesData, DateTime>(
                                  color: appPrimary,
                                  width: 4,
                                  dataSource: chartData,
                                  xValueMapper: (SalesData sales, _) =>
                                      sales.year,
                                  yValueMapper: (SalesData sales, _) =>
                                      sales.sales,
                                ),
                                SplineSeries<SalesData, DateTime>(
                                  color: appRed,
                                  width: 4,
                                  dataSource: chartData,
                                  xValueMapper: (SalesData sales, _) =>
                                      sales.year,
                                  yValueMapper: (SalesData sales, _) =>
                                      30, // sebagai pembatas
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(
                                color: appYellowSoft,
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: const Text(
                                "Today",
                                style: TextStyle(
                                  color: appYellow,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const Text(
                              "Weeks",
                              style: TextStyle(color: appTextSoft),
                            ),
                            const Text(
                              "Month",
                              style: TextStyle(color: appTextSoft),
                            ),
                            const Text(
                              "Year",
                              style: TextStyle(color: appTextSoft),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Recent Transaction",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 10,
                                ),
                                decoration: BoxDecoration(
                                  color: appVioletSoft,
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: const Text(
                                  "See All",
                                  style: TextStyle(
                                    color: appPrimary,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        // Buat list view yang berjarak
                        ListView.separated(
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 15),
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return ListTile(
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 40),
                              title: Row(
                                children: [
                                  Container(
                                    width: 80,
                                    height: 80,
                                    margin: EdgeInsets.only(right: 15),
                                    decoration: BoxDecoration(
                                      color: appYellowSoft,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Image.asset("assets/icons/shop.png"),
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Shopping",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              "- \$120",
                                              style: TextStyle(
                                                color: appRed,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 10),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Buy some groceries",
                                              style: TextStyle(
                                                color: appTextSoft,
                                              ),
                                            ),
                                            Text(
                                              "10:00 AM",
                                              style: TextStyle(
                                                color: appTextSoft,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: ConvexAppBar(
          backgroundColor: appWhite,
          color: appPrimary,
          activeColor: appPrimary,
          initialActiveIndex: 0,
          items: [
            TabItem(icon: Icons.home, title: 'Home'),
            TabItem(icon: Icons.map, title: 'Transaction'),
            TabItem(icon: Icons.add, title: 'Add'),
            TabItem(icon: Icons.message, title: 'Budget'),
            TabItem(icon: Icons.people, title: 'Profile'),
          ],
          onTap: (int i) => print('click index=$i'),
        ));
  }
}

class SalesData {
  SalesData(this.year, this.sales);
  final DateTime year;
  final double sales;
}
