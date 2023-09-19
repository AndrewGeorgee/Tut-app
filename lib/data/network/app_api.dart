import 'package:dio/dio.dart';
import 'package:learn_api/data/responce/responce.dart';
import 'package:retrofit/http.dart';

import '../../app/constance.dart';

part 'app_api.g.dart';

@RestApi(baseUrl: Constant.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;
  @POST('/customers/login')
  Future<AuthenticationResponce> login(
    @Field('email') String email,
    @Field('password') String password,
  );

  @POST('/customers/forgetPassword')
  Future<ForgetPasswordResponce> forgetPassword(
    @Field('email') String email,
  );

  @POST("/customers/register")
  Future<AuthenticationResponce> register(
      @Field("user_name") String userName,
      @Field("country_mobile_code") String countryMobileCode,
      @Field("mobile_number") String mobileNumber,
      @Field("email") String email,
      @Field("password") String password,
      @Field("profile_picture") String profilePicture);
  @GET("/home")
  Future<HomeResponse> getHomeData();

  @GET("/storeDetails/1")
  Future<StoreDetailsResponse> getStoreDetails();
}