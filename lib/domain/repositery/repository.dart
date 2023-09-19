import 'package:dartz/dartz.dart';
import 'package:learn_api/domain/entites/modelis.dart';

import '../../data/network/failure.dart';
import '../../data/network/requests.dart';

abstract class Repository {
  Future<Either<Failure, Authentication>> login(LodinRequests lodinRequests);
  Future<Either<Failure, String>> forgotPassword(String email);
  Future<Either<Failure, Authentication>> register(
      RegisterRequest registerRequest);

  Future<Either<Failure, HomeObject>> getHome();
  Future<Either<Failure, StoreDetails>> getStoreDetails();
}
