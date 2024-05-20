abstract class DonorViewState {}

class InitializeDonorViewState extends DonorViewState {}

class DonorViewStateLoading extends DonorViewState {}

class DonorViewStateSuccess extends DonorViewState {}

class DonorViewStateError extends DonorViewState {
  final String error;
  DonorViewStateError(this.error);
}




class DetailsStateLoading extends DonorViewState {}

class DetailsStateSuccess extends DonorViewState {}

class DetailsStateError extends DonorViewState  {
  final String error;
  DetailsStateError(this.error);
}



class ChangeSuccess extends DonorViewState {}