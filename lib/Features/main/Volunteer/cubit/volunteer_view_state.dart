abstract class VolunteerViewState {}

class InitializeVolunteerViewState extends VolunteerViewState {}

class VolunteerViewStateLoading extends VolunteerViewState {}

class VolunteerViewStateSuccess extends VolunteerViewState {}

class VolunteerViewStateError extends VolunteerViewState  {
  final String error;
  VolunteerViewStateError(this.error);
}

class AddVolunteerViewStateLoading extends VolunteerViewState {}

class AddVolunteerViewStateSuccess extends VolunteerViewState {}

class AddVolunteerViewStateError extends VolunteerViewState  {
  final String error;
  AddVolunteerViewStateError(this.error);
}

