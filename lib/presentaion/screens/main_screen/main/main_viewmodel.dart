import 'dart:ffi';

import 'package:learn_api/domain/usecase/home_usecase.dart';
import 'package:learn_api/presentaion/resouece/baseviewmodel.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../domain/entites/modelis.dart';
import '../../../common/state_renderer/state_renderer.dart';
import '../../../common/state_renderer/stete_render_impl.dart';

class HomeViewModel extends BaseViewModel
    implements HomeViewModelOutput, HomeViewModelInput {
  final HomeUsecse _homeUsecase;
  HomeViewModel(this._homeUsecase);

  final _dataStreamController = BehaviorSubject<HomeViewObject>();
  @override
  void dispose() {
    _dataStreamController.close();
    super.dispose();
  }

  _getHomeData() async {
    inputState.add(LoadingState(
        stateRendererType: StateRendererType.fullScreenLoadingState));
    (await _homeUsecase.execute(Void)).fold(
        (failure) => {
              // left -> failure
              inputState.add(ErrorState(
                  StateRendererType.fullScreenErrorState, failure.message))
            }, (homeObject) {
      // right -> data (success)
      // content
      inputState.add(ContentState());
      inputHomeData.add(HomeViewObject(
        homeObject.data.stores,
        homeObject.data.services,
        homeObject.data.banners,
      ));
      // navigate to main screen
    });
  }

  @override
  void start() {
    _getHomeData();
  }

  @override
  Sink get inputHomeData => _dataStreamController.sink;

  @override
  Stream<HomeViewObject> get outputHomeData =>
      _dataStreamController.stream.map((data) => data);
}

abstract class HomeViewModelInput {
  Sink get inputHomeData;
}

abstract class HomeViewModelOutput {
  Stream<HomeViewObject> get outputHomeData;
}

class HomeViewObject {
  List<Store> stores;
  List<Service> services;
  List<BannerAd> banners;

  HomeViewObject(this.stores, this.services, this.banners);
}
