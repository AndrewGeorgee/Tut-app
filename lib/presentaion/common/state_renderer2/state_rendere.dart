// ignore_for_file: constant_pattern_never_matches_value_type

import 'package:flutter/material.dart';
import 'package:learn_api/data/network/error_handler.dart';
import 'package:learn_api/presentaion/resouece/values_manager.dart';
import 'package:lottie/lottie.dart';

import '../../resouece/assets_manager.dart';
import '../../resouece/color_manager.dart';
import '../../resouece/font_manager.dart';
import '../../resouece/styles_manager.dart';

enum StateRendereType {
  // POPUP STATES (DIALOG)
  popupLoadingState,
  popupErrorState,
  popupSuccess,
  // FULL SCREEN STATED (FULL SCREEN)
  fullScreenLoadingState,
  fullScreenErrorState,
  fullScreenEmptyState,
  // general
  contentState
}

class StateRenderer extends StatelessWidget {
  StateRendereType stateRendereType;
  String message;
  String title;
  Function retryActionFunction;
  StateRenderer(
      {this.message = AppStrings.loading,
      required this.retryActionFunction,
      required this.stateRendereType,
      this.title = '',
      super.key});

  @override
  Widget build(BuildContext context) {
    return _getStateWidget(context);
  }

  Widget _getStateWidget(BuildContext context) {
    switch (StateRendereType) {
      case StateRendereType.popupLoadingState:
        return _getPopUpDialog(
            context, [_getAnimationImage(JsonAssets.loading)]);
      case StateRendereType.popupSuccess:
        return _getPopUpDialog(context, [
          _getAnimationImage(JsonAssets.success),
          _getMessage(title),
          _getMessage(message),
          _getRetyButtom(AppStrings.ok, context),
        ]);
      case StateRendereType.popupErrorState:
        return _getPopUpDialog(context, [
          _getAnimationImage(JsonAssets.error),
          _getMessage(message),
          _getRetyButtom(AppStrings.ok, context)
        ]);

      case StateRendereType.fullScreenLoadingState:
        return _getIteamColum([
          _getAnimationImage(JsonAssets.loading),
          _getMessage(message),
        ]);
      case StateRendereType.fullScreenErrorState:
        return _getIteamColum([
          _getAnimationImage(JsonAssets.error),
          _getMessage(message),
          _getRetyButtom(AppStrings.retryAgain, context),
        ]);
      case StateRendereType.fullScreenEmptyState:
        return _getIteamColum(
          [
            _getAnimationImage(JsonAssets.empty),
            _getMessage(message),
          ],
        );
      case StateRendereType.contentState:
        return Container();

      default:
        return Container();
    }
  }

  Widget _getIteamColum(List<Widget> childern) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: childern,
    );
  }

  Widget _getAnimationImage(animationName) {
    return SizedBox(
      height: AppSize.s100,
      width: AppSize.s100,
      child: Lottie.asset(animationName),
    );
  }

  Widget _getMessage(String message) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p8),
        child: Text(
          message,
          style: getRegularStyle(
              color: ColorManager.black, fontSize: FontSize.s18),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _getRetyButtom(String buttonTitle, BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p8),
        child: ElevatedButton(
          onPressed: () {
            if (stateRendereType == StateRendereType.fullScreenErrorState) {
              retryActionFunction.call();
            } else {
              Navigator.of(context).pop();
            }
          },
          child: Text(buttonTitle),
        ),
      ),
    );
  }

  Widget _getPopUpDialog(BuildContext context, List<Widget> children) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      elevation: 1.5,
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          color: ColorManager.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: ColorManager.darkGrey,
            ),
          ],
        ),
        child: _getDiologContaint(context, children),
      ),
    );
  }

  Widget _getDiologContaint(context, List<Widget> children) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    );
  }
}
