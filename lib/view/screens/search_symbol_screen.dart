
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stock/controller/constants/constant.dart';
import 'package:stock/controller/constants/sharedpreference_help.dart';
import 'package:stock/controller/cubits/search_symbol_cubit.dart';
import 'package:stock/controller/router/app_router.gr.dart';
import 'package:stock/controller/states/search_symbol_state.dart';
import 'package:stock/model/response_models/search_symbol_model.dart';
import 'package:stock/view/common_widgets/indicator_widget.dart';
import 'package:stock/view/common_widgets/row_bold_text_widget.dart';
import 'package:stock/view/common_widgets/title_app_bar_widget.dart';

import '../../controller/auth_repository/enums.dart';

@RoutePage()
class SearchSymbolScreen extends StatefulWidget {
  const SearchSymbolScreen({super.key});

  @override
  State<SearchSymbolScreen> createState() => _SearchSymbolScreenState();
}

class _SearchSymbolScreenState extends State<SearchSymbolScreen> {
  @override
  late SharedPreferenceHelper sharedPreferenceHelper;

  @override
  void initState() {
    super.initState();
    context.read<SearchSymbolCubit>().login();
  }
  Widget build(BuildContext context) {
  
    return  Scaffold(
      backgroundColor: appBackColor,
      appBar: TitleAppBarWidget(title:"Choose Stock"),
      body: SingleChildScrollView(
 child:   BlocConsumer<SearchSymbolCubit, SearchSymbolState>(
            listener: (context, state) {
           
      if (state.networkStatusEnum == NetworkStatusEnum.loaded ) {
   
      }
      
    },
     builder: (context, state) {
     if(  state.networkStatusEnum==NetworkStatusEnum.loading){
      return CircularWidgetC();
    }
    if( state.networkStatusEnum==NetworkStatusEnum.loaded){
      
     return
       Padding(padding: EdgeInsets.all(screenPadding),
       child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
      ListView.builder(
        itemCount: state.model.bestMatches?.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context,index){
        var data=state.model.bestMatches?[index];
            
        return Padding(
          padding:  EdgeInsets.all(3.sp),
          child: InkWell(
            onTap: () {
              context.router.push(AddStockScreen(stock: data??BestMatches()));
            },
            child: Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RowBoldTextWidget(title: "1. symbol", value:data?.s1Symbol ),
                           RowBoldTextWidget(title: "2. name", value: data?.s2Name),
                      ],
                    ),
                       Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RowBoldTextWidget(title: "3. type", value: data?.s3Type),
                           RowBoldTextWidget(title: "4. region", value:data?.s4Region ),
                      ],
                    ),
                      Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RowBoldTextWidget(title: "5. marketOpen", value:data?.s5MarketOpen ),
                           RowBoldTextWidget(title: "6. marketClose", value: data?.s6MarketClose),
                      ],
                    ),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RowBoldTextWidget(title: "7. timezone", value:data?.s7Timezone ),
                           RowBoldTextWidget(title: "8. currency", value:data?.s8Currency ),
                      ],
                    ),
                       RowBoldTextWidget(title: "9. matchScore", value:data?.s9MatchScore ),
                  ],
                ),
              )),
          ),
        );
      })
       ]));
}
else
return CircularWidgetC();
})));} 

}
      