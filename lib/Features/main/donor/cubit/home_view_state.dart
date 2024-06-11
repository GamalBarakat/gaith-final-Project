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




class ShareViewStateLoading extends DonorViewState {}

class ShareViewStateSuccess extends DonorViewState {}

class ShareViewStateError extends DonorViewState {
  final String error;
  ShareViewStateError(this.error);
}




class ChangeItemStateSuccess extends DonorViewState {}


class DonationsByCategoryStateLoading extends DonorViewState {}

class DonationsByCategoryStateSuccess extends DonorViewState {}

class DonationsByCategoryStateError extends DonorViewState {
  final String error;
  DonationsByCategoryStateError(this.error);
}









class AddCartStateLoading extends DonorViewState {}

class AddCartStateSuccess extends DonorViewState {}


class AddCartStateError extends DonorViewState {
final String error;
AddCartStateError(this.error);
}



class GetCartAllStateLoading extends DonorViewState {}

class GetCartAllStateSuccess extends DonorViewState {}


class GetCartAllStateError extends DonorViewState {
  final String error;
  GetCartAllStateError(this.error);
}



class deleteItemCartStateLoading extends DonorViewState {}

class deleteItemCartStateSuccess extends DonorViewState {}


class deleteItemCartStateError extends DonorViewState {
  final String error;
  deleteItemCartStateError(this.error);
}