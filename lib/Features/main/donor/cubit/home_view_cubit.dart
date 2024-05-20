import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/sharde/dioHelper.dart';
import '../model/details_model/details_model.dart';
import '../model/home_model.dart';
import 'home_view_state.dart';

class DonorViewCubit extends Cubit<DonorViewState> {
  DonorViewCubit() : super(InitializeDonorViewState());
  DonorModel?donorModel;
  getHomeData() {
    emit(DonorViewStateLoading());
    DioHelper.getData(url: 'home')
        .then((value) {
          print('Successs');
          donorModel=DonorModel.fromJson(value.data);
          print(donorModel!.message);
          print(value.data);
      emit(DonorViewStateSuccess());
    })
        .catchError((error) {
      print('Error     ${error.toString()}');
      emit(DonorViewStateError(error.toString()));
    });
  }
  DetailsModel?detailsModel;
void getDetail({required int id}){

  emit(DetailsStateLoading());
  DioHelper.getData(url: 'get_donation/${id}')
      .then((value) {
    print('Successs');
    detailsModel=DetailsModel.fromJson(value.data);
    print( detailsModel!.message);
    print(value.data);
    emit(DetailsStateSuccess());
  })
      .catchError((error) {
    print('Error     ${error.toString()}');
    emit(DetailsStateError(error.toString()));
  });

}

int _currentPage=0;
void onPageChanged({required int index}){
  _currentPage=index;
  emit(ChangeSuccess());

}

}
