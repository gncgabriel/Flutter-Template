import 'package:flutter_template/src/cubits/home_cubit/home_state.dart';
import 'package:bloc/bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  void initHome() async {
    emit(HomeInProgress());

    try{

      await Future.delayed(Duration(seconds: 3));

      emit(HomeSuccess(mensagem: "Home carregada com sucesso"));

    }catch(e){
      emit(HomeError());
    }
  }

  void reset() {
    emit(HomeInitial());
  }

}
