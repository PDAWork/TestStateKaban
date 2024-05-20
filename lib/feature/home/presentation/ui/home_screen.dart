import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task_kanban/core/extensions.dart';
import 'package:test_task_kanban/feature/home/domain/entity/drag_task_entity.dart';
import 'package:test_task_kanban/feature/home/presentation/state/bloc/home_bloc.dart';
import 'package:test_task_kanban/feature/home/presentation/widget/custom_liner_progress_indicator.dart';
import 'package:test_task_kanban/feature/home/presentation/widget/header_state.dart';
import 'package:test_task_kanban/feature/home/presentation/widget/task_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _contoller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return switch (state) {
              HomeLoading() => const Center(
                  child: CircularProgressIndicator(),
                ),
              HomeSuccess(:final states) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 16,
                      ),
                      child: Text(
                        'Сделки',
                        style: context.textTheme.h1,
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        controller: _contoller,
                        itemCount: states.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, indexSate) {
                          final state = states[indexSate];
                          return Container(
                            margin: const EdgeInsets.only(right: 20),
                            padding: const EdgeInsets.only(left: 16),
                            width: context.screenWidth * .75,
                            child: Column(
                              children: [
                                StateHeader(state: state),
                                const SizedBox(height: 12),
                                Expanded(
                                  child: DragTarget<DragTaskEntity>(
                                    onAcceptWithDetails: (value) {
                                      if (value.data.indexOldState ==
                                          indexSate) {
                                        return;
                                      }
                                      context.read<HomeBloc>().add(
                                            HomeDragTask(
                                              task: value.data.task,
                                              indexTast: value.data.indexTask,
                                              indexNewState: indexSate,
                                              indexOldState:
                                                  value.data.indexOldState,
                                            ),
                                          );
                                    },
                                    builder:
                                        (context, candidateData, rejectedData) {
                                      return ListView.separated(
                                        itemCount:
                                            states[indexSate].tasks.length,
                                        separatorBuilder: (_, __) =>
                                            const SizedBox(
                                          height: 12,
                                        ),
                                        itemBuilder: (context, indexTask) {
                                          final task = states[indexSate]
                                              .tasks[indexTask];
                                          return LongPressDraggable<
                                              DragTaskEntity>(
                                            dragAnchorStrategy:
                                                pointerDragAnchorStrategy,
                                            data: DragTaskEntity(
                                              task: task,
                                              indexTask: indexTask,
                                              indexOldState: indexSate,
                                            ),
                                            feedback: TaskCard(task: task),
                                            child: TaskCard(task: task),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    CustomLinerProgressIndicator(contollerListView: _contoller),
                  ],
                ),
              HomeError(:final message) => Center(
                  child: Text(message),
                ),
            };
          },
        ),
      ),
    );
  }
}
