import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:stock/controller/auth_repository/enums.dart';
import 'package:stock/controller/constants/constant.dart';
import 'package:stock/controller/constants/sharedpreference_help.dart';
import 'package:stock/controller/cubits/historical_data_cubit.dart';
import 'package:stock/controller/router/router_path.dart';
import 'package:stock/controller/states/historical_data_state.dart';
import 'package:stock/model/response_models/search_symbol_model.dart';
import 'package:stock/view/common_widgets/text_view_large.dart';
import 'package:stock/view/common_widgets/text_view_medium.dart';
import 'package:stock/view/common_widgets/text_view_small.dart';
import 'package:stock/view/common_widgets/title_app_bar_widget.dart';

@RoutePage()
class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final SharedPreferenceHelper pref = SharedPreferenceHelper();

  List<BestMatches> stocks = [];
  double totalAmount = 0;
  BestMatches? latestStock;

  @override
  void initState() {
    super.initState();
    loadPortfolio();
  }

  void loadPortfolio() {
    stocks = pref.getUserStocks();
    totalAmount = stocks.fold(0, (sum, item) => sum + (item.amount ?? 0));

    if (stocks.isNotEmpty) {
      latestStock = stocks.last;
      context.read<HistoricalDataCubit>().login();
    }

    setState(() {});
  }

  List<FlSpot> generateSpots(HistoricalDataState state) {
    List<FlSpot> spots = [];
    int index = 0;

    state.model.timeSeriesDaily?.dailyData?.forEach((date, value) {
      if (index >= 20) return;

      spots.add(
        FlSpot(index.toDouble(), double.tryParse(value.s4Close ?? "0") ?? 0),
      );
      index++;
    });

    return spots.reversed.toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBackColor,
      appBar: TitleAppBarWidget(title: "Dashboard"),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(screenPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 150.sp,
                    height: 50.h,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: appColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(borderRadius),
                        ),
                      ),
                      onPressed: () {
                        context.router.pushNamed(RouterPath.search_symbol_path);
                      },
                      child: TextViewSmall(
                        title: "Add Stock",
                        textcolor: whiteColor,
                      ),
                    ),
                  ),
                ],
              ),

              vericalSpaceMedium,

              Container(
                width: double.infinity,
                padding: EdgeInsets.all(boxPadding),
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [appColor, violetColor]),
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextViewSmall(title: "My Portfolio", textcolor: whiteColor),

                    vericalSpaceSmall,

                    TextViewLarge(
                      title: "₹ ${totalAmount.toStringAsFixed(2)}",

                      fontWeight: headingWeight,
                    ),

                    vericalSpaceMedium,

                    if (latestStock != null)
                      TextViewSmall(
                        title: "Last Added: ${latestStock!.s1Symbol}",
                        textcolor: whiteColor,
                      ),

                    TextViewSmall(
                      title: "Total Stocks: ${stocks.length}",
                    
                      textcolor: whiteColor,
                    ),
                  ],
                ),
              ),

              vericalSpaceLarge,

              TextViewMedium(name: "Price Trend", fontWeight: FontWeight.bold),

              vericalSpaceMedium,

              BlocConsumer<HistoricalDataCubit, HistoricalDataState>(
                listener: (context, state) {
                  if (state.networkStatusEnum == NetworkStatusEnum.failed) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Failed to load historical data"),
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  if (state.networkStatusEnum == NetworkStatusEnum.loading) {
                    return SizedBox(
                      height: 250.h,
                      child: const Center(child: CircularProgressIndicator()),
                    );
                  }

                  if (state.networkStatusEnum == NetworkStatusEnum.loaded) {
                    final spots = generateSpots(state);

                    if (spots.isEmpty) {
                      return SizedBox(
                        height: 250.h,
                        child: const Center(child: Text("No Data Available")),
                      );
                    }

                    return SizedBox(
                      height: 250.h,
                      child: LineChart(
                        LineChartData(
                          minY: spots
                              .map((e) => e.y)
                              .reduce((a, b) => a < b ? a : b),
                          maxY: spots
                              .map((e) => e.y)
                              .reduce((a, b) => a > b ? a : b),

                          gridData: FlGridData(show: false),

                          borderData: FlBorderData(
                            show: true,
                            border: Border(
                              left: BorderSide(color: greyColor),
                              bottom: BorderSide(color: greyColor),
                              right: BorderSide.none,
                              top: BorderSide.none,
                            ),
                          ),

                          titlesData: FlTitlesData(
                            topTitles: AxisTitles(
                              sideTitles: SideTitles(showTitles: false),
                            ),
                            rightTitles: AxisTitles(
                              sideTitles: SideTitles(showTitles: false),
                            ),
                            leftTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                reservedSize: 35,
                                getTitlesWidget: (value, meta) {
                                  return Text(
                                    value.toStringAsFixed(0),
                                    style: TextStyle(
                                      fontSize: 10.sp,
                                      color: greyColor,
                                    ),
                                  );
                                },
                              ),
                            ),
                            bottomTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                interval: 5,
                                getTitlesWidget: (value, meta) {
                                  return Text(
                                    value.toInt().toString(),
                                    style: TextStyle(
                                      fontSize: 10.sp,
                                      color: greyColor,
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),

                          lineBarsData: [
                            LineChartBarData(
                              spots: spots,
                              isCurved: true,
                              barWidth: 3,
                              color: appColor,
                              dotData: const FlDotData(show: false),
                              belowBarData: BarAreaData(
                                show: true,
                                color: appColor.withOpacity(0.1),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }

                  return SizedBox(height: 250.h);
                },
              ),

              vericalSpaceLarge,

              const TextViewMedium(
                name: "My Stocks",
                fontWeight: FontWeight.bold,
              ),

              vericalSpaceMedium,

              ListView.builder(
                itemCount: stocks.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final stock = stocks[index];

                  return Card(
                    elevation: 5,
                    child: Padding(
                      padding: EdgeInsets.all(screenPadding),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextViewMedium(
                                name: stock.s1Symbol,
                                fontWeight: headingWeight,
                              ),
                              TextViewSmall(
                                title: stock.s2Name,
                                textcolor: greyColor,
                              ),
                            ],
                          ),

                          TextViewMedium(
                            name:
                                "₹ ${stock.amount?.toStringAsFixed(2) ?? "0"}",
                            fontWeight: headingWeight,
                            textColors: appColor,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
