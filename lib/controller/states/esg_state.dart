
import 'package:equatable/equatable.dart';
import 'package:stock/controller/auth_repository/enums.dart';
import 'package:stock/model/response_models/esg_model.dart';



class EsgState extends Equatable {
  final NetworkStatusEnum networkStatusEnum;
  final EsgModel model;



  const EsgState({
    required this.networkStatusEnum,
    required this.model
  });

  factory EsgState.initial() => EsgState(
        networkStatusEnum: NetworkStatusEnum.initial,
       model: EsgModel(),
      );

  @override
  List<Object?> get props => [networkStatusEnum,model];

 EsgState copyWith(
      {NetworkStatusEnum? networkStatusEnum,
      NetworkStatusEnum? childNetworkStatusEnum,
      int? currentPage,
     EsgModel? model}) {
    return EsgState(
     model: model??this.model,
        networkStatusEnum: networkStatusEnum ?? this.networkStatusEnum);
        
  }
}