
import 'package:equatable/equatable.dart';

/// dashboard event
abstract class DashboardEvent extends Equatable {
/// constructor
  const DashboardEvent();

  @override
  List<Object> get props => [];
}
/// on change current index
/// for navigation between tabs
class OnChangeCurrentIndex extends DashboardEvent {
  /// constructor
  const OnChangeCurrentIndex(this.index);
  /// index
  final int index;
  @override
  List<Object> get props => [index];
}
