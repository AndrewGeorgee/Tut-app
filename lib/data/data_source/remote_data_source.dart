import 'package:learn_api/data/responce/responce.dart';

import '../network/app_api.dart';
import '../network/requests.dart';

abstract class RemoteDataSource {
  Future<AuthenticationResponce> login(LodinRequests lodinRequests);
  Future<AuthenticationResponce> register(RegisterRequest registerRequest);
  Future<ForgetPasswordResponce> forgetPassword(String email);
  Future<HomeResponse> geyHomeData();
  Future<StoreDetailsResponse> getStoreDetails();
}

class RemoteDataSourceImp implements RemoteDataSource {
  final AppServiceClient _appServiceClient;

  RemoteDataSourceImp(this._appServiceClient);

  @override
  Future<AuthenticationResponce> login(LodinRequests lodinRequests) async {
    return await _appServiceClient.login(
        lodinRequests.email, lodinRequests.password);
  }

  @override
  Future<ForgetPasswordResponce> forgetPassword(String email) async {
    return await _appServiceClient.forgetPassword(email);
  }

  @override
  Future<AuthenticationResponce> register(
      RegisterRequest registerRequest) async {
    return await _appServiceClient.register(
        registerRequest.userName,
        registerRequest.countryMobileCode,
        registerRequest.mobileNumber,
        registerRequest.email,
        registerRequest.password,
        registerRequest.profilePicture);
  }

  @override
  Future<HomeResponse> geyHomeData() async {
    return await _appServiceClient.getHomeData();
  }

  @override
  Future<StoreDetailsResponse> getStoreDetails() async {
    return await _appServiceClient.getStoreDetails();
  }
}
