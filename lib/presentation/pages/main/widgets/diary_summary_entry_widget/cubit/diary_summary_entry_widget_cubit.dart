import 'package:dailyx/core/routing/app_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'diary_summary_entry_widget_state.dart';
part 'diary_summary_entry_widget_cubit.freezed.dart';

@injectable
class DiarySummaryEntryWidgetCubit extends Cubit<DiarySummaryEntryWidgetState>{
  DiarySummaryEntryWidgetCubit():super(const DiarySummaryEntryWidgetState.loading());
  
  void navigateToDiaryEditor() async {
    router.go('/diary_editor');
  }
}