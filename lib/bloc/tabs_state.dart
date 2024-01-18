// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'tabs_bloc.dart';

@immutable
abstract class TabsState extends Equatable {
  const TabsState();
}

class TabsStateUnitialized extends TabsState {
  const TabsStateUnitialized({required this.user});

  final User? user;

  @override
  List<Object?> get props => [user];

  TabsStateUnitialized copyWith({
    User? user,
  }) {
    return TabsStateUnitialized(
      user: user ?? this.user,
    );
  }
}

class TabsStateError extends TabsState {
  const TabsStateError({required this.user, required this.errorMessage});

  final User? user;
  final String? errorMessage;

  @override
  List<Object?> get props => [user, errorMessage];
}
