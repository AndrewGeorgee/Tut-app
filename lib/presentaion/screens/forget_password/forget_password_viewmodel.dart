import 'dart:async';
import 'dart:developer';

import 'package:learn_api/presentaion/resouece/baseviewmodel.dart';

import '../../../domain/usecase/forget_password_usecase.dart';
import '../../common/state_renderer/state_renderer.dart';
import '../../common/state_renderer/stete_render_impl.dart';

class ForgetPasswordViewModel extends BaseViewModel
    implements ForgetPasswordInput, ForgetPasswordOutput {
  final StreamController _emailStreamController =
      StreamController<String>.broadcast();
  final StreamController _isAllInputValidStreamController =
      StreamController<void>.broadcast();
  final ForgotPasswordUseCase _forgotPasswordUseCase;
  ForgetPasswordViewModel(this._forgotPasswordUseCase);
  @override
  void start() {
    inputState.add(ContentState());
  }

  var email = "";
  @override
  forgotPassword() async {
    inputState.add(
        LoadingState(stateRendererType: StateRendererType.popupLoadingState));
    (await _forgotPasswordUseCase.execute(email)).fold((l) {
    
       inputState.add(ErrorState(StateRendererType.popupErrorState, l.message));
    }, (supportMessage) {
      log('SuccessState');
      inputState.add(SuccessState(supportMessage));
    });
  }

  @override
  Sink get inputEmail => _emailStreamController.sink;

  @override
  Sink get inputIsAllInputValid => _isAllInputValidStreamController.sink;

  @override
  Stream<bool> get outputIsAllInputValid =>
      _isAllInputValidStreamController.stream
          .map((isAllInputValid) => _isAllInputValid());

  _isAllInputValid() {
    return isEmailValid(email);
  }

  @override
  Stream<bool> get outputIsEmailValid =>
      _emailStreamController.stream.map((email) => isEmailValid(email));

  @override
  setEmail(String email) {
    inputEmail.add(email);
    this.email = email;
    _validate();
  }

  _validate() {
    inputIsAllInputValid.add(null);
  }

  @override
  void dispose() {
    _emailStreamController.close();
    _isAllInputValidStreamController.close();
  }
}

abstract class ForgetPasswordInput {
  forgotPassword();
  Sink get inputEmail;
  setEmail(String email);

  Sink get inputIsAllInputValid;
}

abstract class ForgetPasswordOutput {
  Stream<bool> get outputIsEmailValid;

  Stream<bool> get outputIsAllInputValid;
}

bool isEmailValid(String email) {
  return RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
}
