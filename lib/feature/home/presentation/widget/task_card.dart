import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:test_task_kanban/core/extensions.dart';
import 'package:test_task_kanban/feature/home/domain/entity/task_entity.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key,
    required this.task,
  });

  final TaskEntity task;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: context.screenWidth * .75,
        height: 181,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Text(
                "${task.id}",
                style: context.textTheme.h3,
              ),
            ),
            Text(
              DateFormat('dd MMMM', 'RU').format(task.date),
              style: context.textTheme.h5,
            ),
            Text(
              "Менеджер: ${task.manager}",
              style: context.textTheme.h5,
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                Text(
                  'Дела',
                  style: context.textTheme.h5,
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Запланировать'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
