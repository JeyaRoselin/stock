import 'package:equatable/equatable.dart';
import 'package:stock/controller/auth_repository/enums.dart';
import 'package:stock/model/response_models/search_symbol_model.dart';

class SearchSymbolState extends Equatable {
  final NetworkStatusEnum networkStatusEnum;
  final SearchSymbolModel model;



  const SearchSymbolState({
    required this.networkStatusEnum,
    required this.model
  });

  factory SearchSymbolState.initial() => SearchSymbolState(
        networkStatusEnum: NetworkStatusEnum.initial,
       model: SearchSymbolModel(),
      );

  @override
  List<Object?> get props => [networkStatusEnum,model];

 SearchSymbolState copyWith(
      {NetworkStatusEnum? networkStatusEnum,
      NetworkStatusEnum? childNetworkStatusEnum,
      int? currentPage,
     SearchSymbolModel? model}) {
    return SearchSymbolState(
     model: model??this.model,
        networkStatusEnum: networkStatusEnum ?? this.networkStatusEnum);
        
  }
}
