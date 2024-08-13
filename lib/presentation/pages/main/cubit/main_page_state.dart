part of 'main_page_cubit.dart';

@freezed
class MainPageState with _$MainPageState {
  const factory MainPageState.created() = _Created;
  const factory MainPageState.loading() = _Loading;
  const factory MainPageState.tasksLoaded(List<Task> tasks) = _TasksLoaded;
  const factory MainPageState.error(String errorMessage) = _Error;
}