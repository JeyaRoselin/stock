import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock/controller/auth_repository/auth_repository.dart';
import 'package:stock/controller/auth_repository/enums.dart';
import 'package:stock/controller/states/historical_data_state.dart';

class HistoricalDataCubit extends Cubit<HistoricalDataState> {
  AuthRepository authRepository;

 HistoricalDataCubit({required this.authRepository})
      : super(HistoricalDataState.initial());

  Future<void >login() async {
    emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.loading));

    (bool,dynamic) response = await authRepository.userHistoricalData();

    if (response.$1 == true) {
      emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.loaded,model: response.$2,));
    } else {
      emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.failed,model: response.$2));
    }
  }
  
}