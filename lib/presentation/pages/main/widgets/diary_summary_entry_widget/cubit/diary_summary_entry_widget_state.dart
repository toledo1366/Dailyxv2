part of 'diary_summary_entry_widget_cubit.dart';

@freezed
class DiarySummaryEntryWidgetState with _$DiarySummaryEntryWidgetState{
  const factory DiarySummaryEntryWidgetState.loading() = _Loading;
  const factory DiarySummaryEntryWidgetState.success() = _Success;
  const factory DiarySummaryEntryWidgetState.noEntry() = _NoEntry;
  const factory DiarySummaryEntryWidgetState.error() = _Error;
}