abstract class DonationNeedViewState {}

class InitializeDonationNeedViewState extends DonationNeedViewState {}

class RequestADonationForMeStateLoading extends DonationNeedViewState {}

class RequestADonationForMeStateSuccess extends DonationNeedViewState {}

class RequestADonationForMeStateError extends DonationNeedViewState {
  final String error;
  RequestADonationForMeStateError(this.error);
}


class PhotoDonationLoadingState extends DonationNeedViewState {}
class PhotoDonationSuccessState extends DonationNeedViewState {}
class PhotoDonationErrorState extends DonationNeedViewState {}







class RequestADonationToAnotherPersonStateLoading extends DonationNeedViewState {}

class RequestADonationToAnotherPersonStateSuccess extends DonationNeedViewState {}

class RequestADonationToAnotherPersonStateError extends DonationNeedViewState {
  final String error;
  RequestADonationToAnotherPersonStateError(this.error);
}