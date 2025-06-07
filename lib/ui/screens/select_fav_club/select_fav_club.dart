import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/select_team/select_team_cubit.dart';
import '../../../blocs/select_team/select_team_state.dart';

class SelectTeam extends StatefulWidget {
  const SelectTeam({super.key});

  @override
  State<SelectTeam> createState() => _SelectTeamState();
}

class _SelectTeamState extends State<SelectTeam> {
  @override
  void initState() {
    super.initState();
    context.read<SelectTeamCubit>().getTeams();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SelectTeamCubit, SelectTeamState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            children: [
              Column(
                children: [
                  Image.asset(
                    "assets/football.jpg",
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    height: 5,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFFFFCE00), Color(0xFF5B44F0)],
                        stops: [0.3, 0.5],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                  padding: EdgeInsets.all(9),
                  decoration: BoxDecoration(
                    color: Color(0xFFF8F9F9),
                    border: Border.all(color: Color(0xFFE8EAEC), width: 10),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              "Select Teams",
                              style: Theme.of(context).textTheme.headlineMedium
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Choose your favorite team, so as to see related news, articles and updates contents to your favorite team",
                              style: Theme.of(context).textTheme.bodyLarge
                                  ?.copyWith(color: Color(0xFF070511)),
                              textAlign: TextAlign.center,
                            ),
                            Expanded(
                              child: ListView.separated(
                                itemCount: state.teams.length,
                                itemBuilder: (context, index) {
                                  final team = state.teams[index];
                                  return Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border(
                                        bottom: BorderSide(
                                          color: team.selected
                                              ? Color(0xFF5B44F0)
                                              : Colors.transparent,
                                          width: 2,
                                        ),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                height: 30,
                                                width: 30,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.grey.shade100,
                                                ),

                                                child: Image.network(
                                                  team.imageUrl,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              const SizedBox(width: 10),
                                              Text(
                                                team.name,
                                                style: Theme.of(
                                                  context,
                                                ).textTheme.bodyLarge,
                                              ),
                                            ],
                                          ),
                                          Checkbox(
                                            shape: const CircleBorder(),
                                            activeColor: Color(0xFF5B44F0),
                                            value: team.selected,
                                            onChanged: (_) {
                                              context
                                                  .read<SelectTeamCubit>()
                                                  .toggleSelection(index);
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                      return SizedBox(height: 10);
                                    },
                              ),
                            ),
                            SizedBox(),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(8),
                        width: double.infinity,
                        child: FilledButton(
                          style: ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(
                              Color(0xFF5B44F0),
                            ),
                            shape: WidgetStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                          onPressed: () {},
                          child: Text('Continue'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
