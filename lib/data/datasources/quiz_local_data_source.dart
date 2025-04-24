import 'package:objectbox/objectbox.dart';
import 'package:space_scutum_quiz_test/data/models/result_model.dart';

abstract interface class QuizLocalDataSource {
  List<ResultModel> getResult();

  int addResult(ResultModel result);
}

class QuizLocalDataSourceImpl implements QuizLocalDataSource {
  final Box<ResultModel> _box;

  QuizLocalDataSourceImpl({required Box<ResultModel> box}) : _box = box;

  @override
  int addResult(ResultModel result) {
    return _box.put(result);
  }

  @override
  List<ResultModel> getResult() {
    return _box.getAll();
  }
}
