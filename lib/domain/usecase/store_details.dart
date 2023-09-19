
import 'package:dartz/dartz.dart';

import '../../data/network/failure.dart';
import '../entites/modelis.dart';
import '../repositery/repository.dart';
import 'base_usecase.dart';

class StoreDetailsUseCase extends BaseUseCase<void, StoreDetails> {
  Repository repository;

  StoreDetailsUseCase(this.repository);

  @override
  Future<Either<Failure, StoreDetails>> execute(void input) {
    return repository.getStoreDetails();
  }
}