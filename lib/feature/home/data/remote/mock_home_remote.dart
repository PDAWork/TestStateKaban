import 'package:test_task_kanban/core/failuer/exception.dart';
import 'package:test_task_kanban/feature/home/data/model/state_model.dart';

abstract interface class MockHomeRemote {
  Future<List<StateModel>> getData();
}

final _data = {
  "stages": [
    {
      "id": 1,
      "title": "Стадия 1",
      "deals": [
        {
          "id": 1,
          "title": "Сделка 1",
"date": "2024-23-04",
          "manager": "Иванов И.И."
        },
        {
          "id": 1,
          "title": "Сделка 1",
"date": "2024-23-04",
          "manager": "Иванов И.И."
        },
        {
          "id": 1,
          "title": "Сделка 1",
"date": "2024-23-04",
          "manager": "Иванов И.И."
        },
        // {
        //   "id": 2,
        //   "title": "Сделка 2",
        //   "date": "23 апреля 2024 г.",
        //   "manager": "Петров П.П."
        // },
        // {
        //   "id": 3,
        //   "title": "Сделка 3",
        //   "date": "01 июня 2024 г.",
        //   "manager": "Сидоров С.С."
        // }
      ]
    },
    {
      "id": 2,
      "title": "Стадия 2",
      "deals": [
        {
          "id": 4,
          "title": "Сделка 4",
          "date": "2024-23-04",
          "manager": "Кузнецов К.К."
        }
      ]
    }
  ]
};

class MockHomeRemoteImpl extends MockHomeRemote {
  @override
  Future<List<StateModel>> getData() async {
    try {
      await Future.delayed(const Duration(seconds: 2));
      return List<StateModel>.from(
        _data["stages"]!.map(
          (value) => StateModel.fromJson(value),
        ),
      );
    } on Object catch (_) {
      throw ServerException();
    }
  }
}
