import 'package:dartz/dartz.dart';
import 'package:learn_api/data/network/failure.dart';
import 'package:learn_api/domain/repositery/repository.dart';

import '../entites/modelis.dart';
import 'base_usecase.dart';

class HomeUsecse implements BaseUseCase<void, HomeObject> {
  final Repository _repository;

  HomeUsecse(this._repository);

  @override
  Future<Either<Failure, HomeObject>> execute(void input) async {
    return await _repository.getHome();
  }
}
