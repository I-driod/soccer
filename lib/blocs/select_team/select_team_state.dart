import 'package:equatable/equatable.dart';
import 'package:soccers/data/model/team.dart';

class SelectTeamState extends Equatable {
  final String? errorMessage;
  final List<Team> teams;

  const SelectTeamState({this.errorMessage, this.teams = const []});

  SelectTeamState copyWith({String? errorMessage, List<Team>? teams}) {
    return SelectTeamState(
      errorMessage: errorMessage ?? this.errorMessage,
      teams: teams ?? this.teams,
    );
  }

  @override
  List<Object?> get props => [teams, errorMessage];
}
