abstract class VolunteerViewState {}

class InitializeVolunteerViewState extends VolunteerViewState {}

class VolunteerViewStateLoading extends VolunteerViewState {}

class VolunteerViewStateSuccess extends VolunteerViewState {}

class VolunteerViewStateError extends VolunteerViewState  {
  final String error;
  VolunteerViewStateError(this.error);
}



