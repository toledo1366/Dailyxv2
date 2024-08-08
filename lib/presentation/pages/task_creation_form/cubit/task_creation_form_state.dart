part of 'task_creation_form_cubit.dart';

@freezed
class TaskCreationFormState with _$TaskCreationFormState{
  const factory TaskCreationFormState.initialized() = _Initialized;
  const factory TaskCreationFormState.taskCreated() = _TaskCreated;
  const factory TaskCreationFormState.error(String error) = _Error;
}