import 'package:bloc/bloc.dart';
import 'package:soccers/blocs/select_team/select_team_state.dart';
import 'package:soccers/data/model/team.dart';

import '../../repositories/auth_repository.dart';

class SelectTeamCubit extends Cubit<SelectTeamState> {
  final AuthRepository authRepository;

  SelectTeamCubit(this.authRepository) : super(const SelectTeamState());

  Future<void> getTeams() async {
    emit(
      state.copyWith(
        teams: [
          const Team(
            name: "AC Milan",
            imageUrl:
                "https://1000logos.net/wp-content/uploads/2016/10/AC-Milan-Logo-tumb.png",
          ),
          const Team(
            name: "Ajax",
            imageUrl:
                "https://1000logos.net/wp-content/uploads/2016/10/AJAX-logo-tumb.jpg",
          ),
          const Team(
            name: "Arsenal",
            imageUrl:
                "https://1000logos.net/wp-content/uploads/2019/06/Arsenal-Logo.jpg",
          ),
          const Team(
            name: "Aston Villa",
            imageUrl:
                "https://1000logos.net/wp-content/uploads/2022/05/Aston-Villa-Logo-tumb-1.png",
          ),
          const Team(
            name: "Barcelona",
            imageUrl:
                "https://1000logos.net/wp-content/uploads/2016/10/Barcelona-logo-tumb.jpg",
          ),
          // Add more teams as needed
        ],
      ),
    );
  }

  void toggleSelection(int index) {
    final updatedTeams = List<Team>.from(state.teams);
    final team = updatedTeams[index];
    updatedTeams[index] = team.copyWith(selected: !(team.selected));
    emit(state.copyWith(teams: updatedTeams));
  }
}
