import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gaith/Features/main/Volunteer/cubit/volunteer_view_state.dart';
import '../../../../core/sharde/dioHelper.dart';
import '../model/volunteer_model.dart';


class VolunteerViewCubit extends Cubit<VolunteerViewState> {
  VolunteerViewCubit() : super(InitializeVolunteerViewState());
  VolunteerModel?volunteerModel;
  void getVolunteerData() {
    emit(VolunteerViewStateLoading());
    DioHelper.getData(url: 'get_volunteer')
        .then((value) {
          print('Successs');
          volunteerModel=VolunteerModel.fromJson(value.data);
          print( volunteerModel!.message);
          print(value.data);
      emit(VolunteerViewStateSuccess());
    })
        .catchError((error) {
      print('Error     ${error.toString()}');
      emit(VolunteerViewStateError(error.toString()));
    });
  }



}
