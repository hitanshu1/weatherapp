import 'package:equatable/equatable.dart';

/// dashboard state
class DashboardState extends Equatable {
  /// current index of dashboard tab
  final int currentIndex;

  /// constructor
  const DashboardState({this.currentIndex = 0});

  @override
  List<Object> get props => [currentIndex];
  /// copy with
  DashboardState copyWith({int? currentIndex}) {
    return DashboardState(
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }
}
