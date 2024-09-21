
import 'package:flutter_bloc/flutter_bloc.dart';

import 'event.dart';
import 'state.dart';

/// dashboard bloc
class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  /// constructor
  DashboardBloc() : super(const DashboardState()) {
    on<OnChangeCurrentIndex>(_changeCurrentIndex);
  }

  /// on change current index
  /// for navigation between tabs
  Future<void> _changeCurrentIndex(
      OnChangeCurrentIndex event, Emitter<DashboardState> emit) async {
    emit(state.copyWith(currentIndex: event.index));
  }
}
