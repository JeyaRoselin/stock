import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stock/controller/constants/constant.dart';
import 'package:stock/controller/constants/sharedpreference_help.dart';
import 'package:stock/controller/router/router_path.dart';
import 'package:stock/model/response_models/search_symbol_model.dart';
import 'package:stock/view/common_widgets/row_bold_text_widget.dart';
import 'package:stock/view/common_widgets/text_form_widget.dart';
import 'package:stock/view/common_widgets/text_view_large.dart';
import 'package:stock/view/common_widgets/text_view_medium.dart';
import 'package:stock/view/common_widgets/title_app_bar_widget.dart';
@RoutePage()
class AddStockScreen extends StatefulWidget {
  final BestMatches stock;

  const AddStockScreen({super.key, required this.stock});

  @override
  State<AddStockScreen> createState() => _AddStockScreenState();
}

class _AddStockScreenState extends State<AddStockScreen> {
  final TextEditingController amountController = TextEditingController();
  final SharedPreferenceHelper pref = SharedPreferenceHelper();

  void saveStock() async {
    if (amountController.text.isEmpty) return;

    double enteredAmount = double.parse(amountController.text);

    List<BestMatches> stocks = pref.getUserStocks();

    bool exists = stocks.any(
        (element) => element.s1Symbol == widget.stock.s1Symbol);

    if (exists) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Stock already added")),
      );
      return;
    }

    widget.stock.amount = enteredAmount;

    stocks.add(widget.stock);
    await pref.saveUserStocks(stocks);
 context.router.replaceNamed(RouterPath.dashboard_path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBackColor,
      appBar:TitleAppBarWidget(title:  "Add Stock"),
      
      body: Padding(
        padding: EdgeInsets.all(screenPadding),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
          
              TextViewLarge(
                title: widget.stock.s1Symbol,
                textcolor: appColor,
                fontWeight: headingWeight,
              ),
          
              vericalSpaceSmall,
          
              TextViewMedium(
                name: widget.stock.s2Name,
                textColors: greyColor,
              ),
          
              vericalSpaceLarge,
          Card(
            color: whiteColor,
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RowBoldTextWidget(title: "1. symbol", value:widget.stock.s1Symbol ),
                             RowBoldTextWidget(title: "2. name", value: widget.stock.s2Name),
                        ],
                      ),
                      vericalSpaceMedium,
                         Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RowBoldTextWidget(title: "3. type", value: widget.stock.s3Type),
                             RowBoldTextWidget(title: "4. region", value:widget.stock.s4Region ),
                        ],
                      ),
                       vericalSpaceMedium,
                        Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RowBoldTextWidget(title: "5. marketOpen", value:widget.stock.s5MarketOpen ),
                             RowBoldTextWidget(title: "6. marketClose", value: widget.stock.s6MarketClose),
                        ],
                      ),
                       vericalSpaceMedium,
                       Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RowBoldTextWidget(title: "7. timezone", value:widget.stock.s7Timezone ),
                             RowBoldTextWidget(title: "8. currency", value:widget.stock.s8Currency ),
                        ],
                      ),
                       vericalSpaceMedium,
                         RowBoldTextWidget(title: "9. matchScore", value:widget.stock.s9MatchScore ),
                    ],
                  ),
                )),
                vericalSpaceLarge,
              TextForm(
                controller: amountController,
                keyboardType: TextInputType.number,
                labelText: "Investment Amount",
                hintText: "Enter amount",
                type: 'ruppee',
              ),
          
              vericalSpaceLarge,
          
              SizedBox(
                width: double.infinity,
                height: 50.h,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: appColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(borderRadius),
                    ),
                  ),
                  onPressed: saveStock,
                  child:  TextViewLarge(
                    title: "Add Stock",
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
