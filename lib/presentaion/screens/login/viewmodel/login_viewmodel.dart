// ignore_for_file: unused_field

import 'dart:async';

import 'package:learn_api/domain/usecase/login_usecase.dart';
import 'package:learn_api/presentaion/common/state_renderer/stete_render_impl.dart';

import '../../../common/freezd_data_classes.dart';
import '../../../common/state_renderer/state_renderer.dart';
import '../../../resouece/baseviewmodel.dart';

class LoginViewModel extends BaseViewModel
    implements LoginViewModelInputs, LoginViewModelOutputs {
  final LoginUseCase _loginUseCase;
  final StreamController _userNameStreamController =
      StreamController<String>.broadcast();
  final StreamController _passwordStreamController =
      StreamController<String>.broadcast();
  StreamController isUserLoggedInSuccessfullyStreamController =
      StreamController<bool>();
  final StreamController _areAllInputsValidStreamController =
      StreamController<void>.broadcast();
  LoginObject _loginObject = LoginObject('', '');

  LoginViewModel(this._loginUseCase);
  @override
  void start() {
    inputState.add(ContentState());
  }

  @override
  void dispose() {
    super.dispose();
    _userNameStreamController.close();
    _passwordStreamController.close();
    _areAllInputsValidStreamController.close();
    isUserLoggedInSuccessfullyStreamController.close();
  }

  @override
  Sink get inputPassword => _passwordStreamController.sink;

  @override
  Sink get inputUsename => _userNameStreamController.sink;
  @override
  Sink get inputAreAllInputsValid => _areAllInputsValidStreamController.sink;
  @override
  login() async {
    inputState.add(
        LoadingState(stateRendererType: StateRendererType.popupLoadingState));
    (await _loginUseCase.execute(
            LoginUseCaseInput(_loginObject.userName, _loginObject.password)))
        .fold(
            (l) => {
                  inputState.add(
                      ErrorState(StateRendererType.popupErrorState, l.message))
                },
            (r) => {
                  inputState.add(
                    ContentState(),
                  ),
                  isUserLoggedInSuccessfullyStreamController.add(true)
                });
  }

  @override
  setPassword(String password) {
    inputPassword.add(password);
    _loginObject = _loginObject.copyWith(password: password);
    inputAreAllInputsValid.add(null);
  }

  @override
  setUserName(String userName) {
    inputUsename.add(userName);
    _loginObject = _loginObject.copyWith(userName: userName);
    inputAreAllInputsValid.add(null);
  }

  @override
  Stream<bool> get outAreAllInputsValid =>
      _areAllInputsValidStreamController.stream
          .map((_) => _areAllInputsValid());

  @override
  Stream<bool> get outputIsPasswordvalid => _passwordStreamController.stream
      .map((password) => _isPasswordValid(password));
  bool _isPasswordValid(String password) {
    return password.isNotEmpty;
  }

  bool _areAllInputsValid() {
    return _isPasswordValid(_loginObject.password) &&
        _isUserNameValid(_loginObject.userName);
  }

  bool _isUserNameValid(String userName) {
    return userName.isNotEmpty;
  }

  @override
  Stream<bool> get outputIsUserNamevalid => _userNameStreamController.stream
      .map((userNAme) => _isUserNameValid(userNAme));
}

abstract class LoginViewModelInputs {
  setUserName(String userName);
  setPassword(String password);
  login();
  Sink get inputUsename;
  Sink get inputPassword;
  Sink get inputAreAllInputsValid;
}

abstract class LoginViewModelOutputs {
  Stream<bool> get outputIsPasswordvalid;
  Stream<bool> get outputIsUserNamevalid;
  Stream<bool> get outAreAllInputsValid;
}
