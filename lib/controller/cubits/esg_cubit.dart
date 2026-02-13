
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock/controller/auth_repository/auth_repository.dart';
import 'package:stock/controller/auth_repository/enums.dart';
import 'package:stock/controller/states/esg_state.dart';

class EsgCubit extends Cubit<EsgState> {
  AuthRepository authRepository;

 EsgCubit({required this.authRepository})
      : super(EsgState.initial());

  Future<void >login() async {
    emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.loading));

    (bool,dynamic) response = await authRepository.userEsg();

    if (response.$1 == true) {
      emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.loaded,model: response.$2,));
    } else {
      emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.failed,model: response.$2));
    }
  }
  
}