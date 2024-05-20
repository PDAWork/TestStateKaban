import 'package:flutter/material.dart';
import 'package:test_task_kanban/common/app_color.dart';

class CustomLinerProgressIndicator extends StatefulWidget {
  const CustomLinerProgressIndicator({
    super.key,
    required this.contollerListView,
  });

  final ScrollController contollerListView;

  @override
  State<CustomLinerProgressIndicator> createState() =>
      _CustomLinerProgressIndicatorState();
}

class _CustomLinerProgressIndicatorState
    extends State<CustomLinerProgressIndicator> {
  double _value = 0;

  @override
  void didChangeDependencies() {
    widget.contollerListView.addListener(() {
      setState(() {
        double test = widget.contollerListView.position.maxScrollExtent / 10;
        _value = widget.contollerListView.position.pixels / test / 10;
      });
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: LinearProgressIndicator(
        color: AppColor.progressIndicatorColor,
        value: _value,
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }
}
