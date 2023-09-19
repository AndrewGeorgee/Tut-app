import 'package:learn_api/app/extention.dart';

import '../../app/constance.dart';
import '../../domain/entites/modelis.dart';
import '../responce/responce.dart';

extension CustomerResponseMapper on CustomerResponce? {
  Customer toDomain() {
    return Customer(
      this?.id.orEmpty() ?? Constant.empty,
      this?.name.orEmpty() ?? Constant.empty,
      this?.nameOfNotification.orZero() ?? Constant.zero,
    );
  }
}

extension ContactResponseMapper on ContactResponce? {
  Contacts toDomain() {
    return Contacts(
      this?.phone.orEmpty() ?? Constant.empty,
      this?.email.orEmpty() ?? Constant.empty,
      this?.link.orEmpty() ?? Constant.empty,
    );
  }
}

extension AuthenticationResponseMapper on AuthenticationResponce? {
  Authentication toDomain() {
    return Authentication(
      this?.customer.toDomain(),
      this?.contact.toDomain(),
    );
  }
}

extension ForgetPasswordResponseMapper on ForgetPasswordResponce? {
  String toDomain() {
    return this?.support?.orEmpty() ?? Constant.empty;
  }
}

extension ServiceResponseMapper on ServiceResponse? {
  Service toDomain() {
    return Service(
        this?.id.orZero() ?? Constant.zero,
        this?.title.orEmpty() ?? Constant.empty,
        this?.image.orEmpty() ?? Constant.empty);
  }
}

extension StoreResponseMapper on StoreResponse? {
  Store toDomain() {
    return Store(
        this?.id.orZero() ?? Constant.zero,
        this?.title.orEmpty() ?? Constant.empty,
        this?.image.orEmpty() ?? Constant.empty);
  }
}

extension BannersResponseMapper on BannersResponse? {
  BannerAd toDomain() {
    return BannerAd(
        this?.id.orZero() ?? Constant.zero,
        this?.title.orEmpty() ?? Constant.empty,
        this?.image.orEmpty() ?? Constant.empty,
        this?.link.orEmpty() ?? Constant.empty);
  }
}

extension HomeResponseMapper on HomeResponse? {
  HomeObject toDomain() {
    List<Service> services = (this
                ?.data
                ?.services
                ?.map((serviceResponse) => serviceResponse.toDomain()) ??
            const Iterable.empty())
        .cast<Service>()
        .toList();

    List<BannerAd> banners = (this
                ?.data
                ?.banners
                ?.map((bannersResponse) => bannersResponse.toDomain()) ??
            const Iterable.empty())
        .cast<BannerAd>()
        .toList();

    List<Store> stores = (this
                ?.data
                ?.stores
                ?.map((storesResponse) => storesResponse.toDomain()) ??
            const Iterable.empty())
        .cast<Store>()
        .toList();

    var data = HomeData(services, banners, stores);
    return HomeObject(data);
  }
}

extension StoreDetailsResponseMapper on StoreDetailsResponse? {
  StoreDetails toDomain() {
    return StoreDetails(
        this?.id?.orZero() ?? Constant.zero,
        this?.title?.orEmpty() ?? Constant.empty,
        this?.image?.orEmpty() ?? Constant.empty,
        this?.details?.orEmpty() ?? Constant.empty,
        this?.services?.orEmpty() ?? Constant.empty,
        this?.about?.orEmpty() ?? Constant.empty);
  }
}
