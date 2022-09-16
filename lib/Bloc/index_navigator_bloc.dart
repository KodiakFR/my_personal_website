import 'package:bloc/bloc.dart';

class IndexCubit extends Cubit<int>{
  IndexCubit(int initialState) : super(initialState);

  void onChangeIndex(int newIndex){
    emit(newIndex);
  }

}