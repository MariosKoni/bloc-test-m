part of 'tabs_bloc.dart';

@immutable
abstract class TabsEvent extends Equatable {
  const TabsEvent();
}

class Fetch extends TabsEvent {
  @override
  List<Object?> get props => [];
}
