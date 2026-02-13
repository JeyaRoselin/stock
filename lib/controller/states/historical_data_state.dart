import 'package:equatable/equatable.dart';
import 'package:stock/controller/auth_repository/enums.dart';
import 'package:stock/model/response_models/historical_data_model.dart';

class HistoricalDataState extends Equatable {
  final NetworkStatusEnum networkStatusEnum;
  final HistoricalDataModel model;



  const HistoricalDataState({
    required this.networkStatusEnum,
    required this.model
  });

  factory HistoricalDataState.initial() => HistoricalDataState(
        networkStatusEnum: NetworkStatusEnum.initial,
       model: HistoricalDataModel(),
      );

  @override
  List<Object?> get props => [networkStatusEnum,model];

 HistoricalDataState copyWith(
      {NetworkStatusEnum? networkStatusEnum,
      NetworkStatusEnum? childNetworkStatusEnum,
      int? currentPage,
     HistoricalDataModel? model}) {
    return HistoricalDataState(
     model: model??this.model,
        networkStatusEnum: networkStatusEnum ?? this.networkStatusEnum);
        
  }
}