// ignore_for_file: deprecated_member_use, constant_identifier_names

import 'package:dio/dio.dart';

import 'failure.dart';

class ErrorHandler implements Exception {
  late Failure failure;

  ErrorHandler.handle(dynamic error) {
    if (error is DioException) {
      // dio error so its an error from response of the API or from dio itself
      failure = _handleError(error);
    } else {
      // default error
      failure = DataSource.DEFAULT.getFailure();
    }
  }
}

Failure _handleError(DioError error) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
      return DataSource.CONNECT_TIMEOUT.getFailure();
    case DioExceptionType.sendTimeout:
      return DataSource.SEND_TIMEOUT.getFailure();
    case DioExceptionType.receiveTimeout:
      return DataSource.RECIEVE_TIMEOUT.getFailure();
    case DioErrorType.unknown:
      if (error.response != null &&
          error.response?.statusCode != null &&
          error.response?.statusMessage != null) {
        return Failure(
          error.response?.statusCode ?? 0,
          error.response?.statusMessage ?? "",
        );
      } else {
        return DataSource.DEFAULT.getFailure();
      }
    case DioExceptionType.cancel:
      return DataSource.CANCEL.getFailure();

    default:
      return DataSource.DEFAULT.getFailure();
  }
}

enum DataSource {
  SUCCESS,
  NO_CONTENT,
  BAD_REQUEST,
  FORBIDDEN,
  UNAUTORISED,
  NOT_FOUND,
  INTERNAL_SERVER_ERROR,
  CONNECT_TIMEOUT,
  CANCEL,
  RECIEVE_TIMEOUT,
  SEND_TIMEOUT,
  CACHE_ERROR,
  NO_INTERNET_CONNECTION,
  DEFAULT
}

extension DataSourceExtension on DataSource {
  Failure getFailure() {
    switch (this) {
      case DataSource.SUCCESS:
        return Failure(ResponseCode.SUCCESS, ResponseMessage.SUCCESS);
      case DataSource.NO_CONTENT:
        return Failure(ResponseCode.NO_CONTENT, ResponseMessage.NO_CONTENT);
      case DataSource.BAD_REQUEST:
        return Failure(ResponseCode.BAD_REQUEST, ResponseMessage.BAD_REQUEST);
      case DataSource.FORBIDDEN:
        return Failure(ResponseCode.FORBIDDEN, ResponseMessage.FORBIDDEN);
      case DataSource.UNAUTORISED:
        return Failure(ResponseCode.UNAUTORISED, ResponseMessage.UNAUTORISED);
      case DataSource.NOT_FOUND:
        return Failure(ResponseCode.NOT_FOUND, ResponseMessage.NOT_FOUND);
      case DataSource.INTERNAL_SERVER_ERROR:
        return Failure(ResponseCode.INTERNAL_SERVER_ERROR,
            ResponseMessage.INTERNAL_SERVER_ERROR);
      case DataSource.CONNECT_TIMEOUT:
        return Failure(
            ResponseCode.CONNECT_TIMEOUT, ResponseMessage.CONNECT_TIMEOUT);
      case DataSource.CANCEL:
        return Failure(ResponseCode.CANCEL, ResponseMessage.CANCEL);
      case DataSource.RECIEVE_TIMEOUT:
        return Failure(
            ResponseCode.RECIEVE_TIMEOUT, ResponseMessage.RECIEVE_TIMEOUT);
      case DataSource.SEND_TIMEOUT:
        return Failure(ResponseCode.SEND_TIMEOUT, ResponseMessage.SEND_TIMEOUT);
      case DataSource.CACHE_ERROR:
        return Failure(ResponseCode.CACHE_ERROR, ResponseMessage.CACHE_ERROR);
      case DataSource.NO_INTERNET_CONNECTION:
        return Failure(ResponseCode.NO_INTERNET_CONNECTION,
            ResponseMessage.NO_INTERNET_CONNECTION);
      case DataSource.DEFAULT:
        return Failure(ResponseCode.DEFAULT, ResponseMessage.DEFAULT);
    }
  }
}

class ResponseCode {
  static const int SUCCESS = 200; // success with data
  static const int NO_CONTENT = 201; // success with no data (no content)
  static const int BAD_REQUEST = 400; // failure, API rejected request
  static const int UNAUTORISED = 401; // failure, user is not authorised
  static const int FORBIDDEN = 403; //  failure, API rejected request
  static const int INTERNAL_SERVER_ERROR = 500; // failure, crash in server side
  static const int NOT_FOUND = 404; // failure, not found

  // local status code
  static const int CONNECT_TIMEOUT = -1;
  static const int CANCEL = -2;
  static const int RECIEVE_TIMEOUT = -3;
  static const int SEND_TIMEOUT = -4;
  static const int CACHE_ERROR = -5;
  static const int NO_INTERNET_CONNECTION = -6;
  static const int DEFAULT = -7;
}

class ResponseMessage {
  static const SUCCESS = AppStrings.success; // success with data
  static const NO_CONTENT =
      AppStrings.success; // success with no data (no content)
  static const BAD_REQUEST =
      AppStrings.badRequestError; // failure, API rejected request
  static const UNAUTORISED =
      AppStrings.unauthorizedError; // failure, user is not authorised
  static const FORBIDDEN =
      AppStrings.forbiddenError; //  failure, API rejected request
  static const INTERNAL_SERVER_ERROR =
      AppStrings.internalServerError; // failure, crash in server side
  static const String NOT_FOUND =
      AppStrings.notFoundError; // failure, crash in server side
  // local status code
  static const CONNECT_TIMEOUT = AppStrings.timeoutError;
  static const CANCEL = AppStrings.defaultError;
  static const String RECIEVE_TIMEOUT = AppStrings.timeoutError;
  static const String SEND_TIMEOUT = AppStrings.timeoutError;
  static const CACHE_ERROR = AppStrings.cacheError;
  static const NO_INTERNET_CONNECTION = AppStrings.noInternetError;
  static const DEFAULT = AppStrings.defaultError;
}

class ApiInternalStatus {
  static const int SUCCESS = 0;
  static const int FAILURE = 1;
}

class AppStrings {
  static const noRouteFound = "noRouteFound";
  static const onBoardingTitle1 = "on_boarding_title1";
  static const onBoardingTitle2 = "on_boarding_title2";
  static const onBoardingTitle3 = "on_boarding_title3";
  static const onBoardingTitle4 = "on_boarding_title4";

  static const onBoardingSubTitle1 = "on_boarding_desc1";
  static const onBoardingSubTitle2 = "on_boarding_desc2";
  static const onBoardingSubTitle3 = "on_boarding_desc3";
  static const onBoardingSubTitle4 = "on_boarding_desc4";
  static const skip = "skip";
  static const username = "usernameHint";
  static const password = "password_hint";
  static const usernameError = "username_error";
  static const passwordError = "password_error";
  static const login = "login Button";
  static const forgetPassword = "forgot_password_text";
  static const registerText = "register_text";
  static const loading = "loading";
  static const retryAgain = "retry_again";
  static const ok = "ok";
  static const String emailHint = 'email_hint';
  static const String invalidEmail = "email_error";
  static const String resetPassword = "reset_password";
  static const String success = "success";
  static const String userNameInvalid = "username_hint_message";
  static const String mobileNumberInvalid = "mobile_number_hint_message";
  static const String passwordInvalid = "password_hint_message";
  static const String alreadyHaveAccount = "already_have_account";
  static const register = "register";
  static const mobileNumber = "mobile_number_hint";
  static const profilePicture = "upload_profile_picture";
  static const photoGallery = "photo_from_galley";
  static const photoCamera = "photo_from_camera";
  static const home = "home";
  static const notifications = "notification";
  static const search = "search";
  static const settings = "settings";
  static const services = "services";
  static const stores = "stores";
  static const String details = "details";
  static const String about = "about";
  static const String storeDetails = "store_details";
  static const String changeLanguage = "change_language";
  static const String contactUs = "contact_us";
  static const String inviteYourFriends = "invite_your_friends";
  static const String logout = "logout";

  // error handler
  static const String badRequestError = "bad_request_error";
  static const String noContent = "no_content";
  static const String forbiddenError = "forbidden_error";
  static const String unauthorizedError = "unauthorized_error";
  static const String notFoundError = "not_found_error";
  static const String conflictError = "conflict_error";
  static const String internalServerError = "internal_server_error";
  static const String unknownError = "unknown_error";
  static const String timeoutError = "timeout_error";
  static const String defaultError = "default_error";
  static const String cacheError = "cache_error";
  static const String noInternetError = "no_internet_error";
}
