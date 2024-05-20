import 'package:flutter/material.dart';
import 'package:test_task_kanban/core/extensions.dart';
import 'package:test_task_kanban/feature/home/domain/entity/state_entity.dart';

class StateHeader extends StatelessWidget {
  const StateHeader({
    super.key,
    required this.state,
  });

  final StateEntity state;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.screenWidth * .75,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF009EDF),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Text(
              state.title,
              overflow: TextOverflow.ellipsis,
              style: context.textTheme.h4,
            ),
          ),
          Text(
            "${state.id}",
            style: const TextStyle(
              color: Colors.white,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
