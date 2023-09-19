// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'responce.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponse _$BaseResponseFromJson(Map<String, dynamic> json) => BaseResponse()
  ..statuse = json['statuse'] as int?
  ..message = json['message'] as String?;

Map<String, dynamic> _$BaseResponseToJson(BaseResponse instance) =>
    <String, dynamic>{
      'statuse': instance.statuse,
      'message': instance.message,
    };

CustomerResponce _$CustomerResponceFromJson(Map<String, dynamic> json) =>
    CustomerResponce(
      json['id'] as String?,
      json['name'] as String?,
      json['nameOfNotification'] as int?,
    );

Map<String, dynamic> _$CustomerResponceToJson(CustomerResponce instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'nameOfNotification': instance.nameOfNotification,
    };

ContactResponce _$ContactResponceFromJson(Map<String, dynamic> json) =>
    ContactResponce(
      json['email'] as String?,
      json['link'] as String?,
      json['phone'] as String?,
    );

Map<String, dynamic> _$ContactResponceToJson(ContactResponce instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'email': instance.email,
      'link': instance.link,
    };

AuthenticationResponce _$AuthenticationResponceFromJson(
        Map<String, dynamic> json) =>
    AuthenticationResponce(
      json['contact'] == null
          ? null
          : ContactResponce.fromJson(json['contact'] as Map<String, dynamic>),
      json['customer'] == null
          ? null
          : CustomerResponce.fromJson(json['customer'] as Map<String, dynamic>),
    )
      ..statuse = json['statuse'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$AuthenticationResponceToJson(
        AuthenticationResponce instance) =>
    <String, dynamic>{
      'statuse': instance.statuse,
      'message': instance.message,
      'customer': instance.customer,
      'contact': instance.contact,
    };

ForgetPasswordResponce _$ForgetPasswordResponceFromJson(
        Map<String, dynamic> json) =>
    ForgetPasswordResponce(
      json['support'] as String?,
    )
      ..statuse = json['statuse'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$ForgetPasswordResponceToJson(
        ForgetPasswordResponce instance) =>
    <String, dynamic>{
      'statuse': instance.statuse,
      'message': instance.message,
      'support': instance.support,
    };

ServiceResponse _$ServiceResponseFromJson(Map<String, dynamic> json) =>
    ServiceResponse(
      json['id'] as int?,
      json['title'] as String?,
      json['image'] as String?,
    );

Map<String, dynamic> _$ServiceResponseToJson(ServiceResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'image': instance.image,
    };

BannersResponse _$BannersResponseFromJson(Map<String, dynamic> json) =>
    BannersResponse(
      json['id'] as int?,
      json['title'] as String?,
      json['image'] as String?,
      json['link'] as String?,
    );

Map<String, dynamic> _$BannersResponseToJson(BannersResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'image': instance.image,
      'link': instance.link,
    };

StoreResponse _$StoreResponseFromJson(Map<String, dynamic> json) =>
    StoreResponse(
      json['id'] as int?,
      json['title'] as String?,
      json['image'] as String?,
    );

Map<String, dynamic> _$StoreResponseToJson(StoreResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'image': instance.image,
    };

HomeDataResponse _$HomeDataResponseFromJson(Map<String, dynamic> json) =>
    HomeDataResponse(
      (json['services'] as List<dynamic>?)
          ?.map((e) => ServiceResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['banners'] as List<dynamic>?)
          ?.map((e) => BannersResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['stores'] as List<dynamic>?)
          ?.map((e) => StoreResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HomeDataResponseToJson(HomeDataResponse instance) =>
    <String, dynamic>{
      'services': instance.services,
      'banners': instance.banners,
      'stores': instance.stores,
    };

HomeResponse _$HomeResponseFromJson(Map<String, dynamic> json) => HomeResponse(
      json['data'] == null
          ? null
          : HomeDataResponse.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..statuse = json['statuse'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$HomeResponseToJson(HomeResponse instance) =>
    <String, dynamic>{
      'statuse': instance.statuse,
      'message': instance.message,
      'data': instance.data,
    };

CatImageResponse _$CatImageResponseFromJson(Map<String, dynamic> json) =>
    CatImageResponse(
      json['id'] as String?,
      (json['width'] as num?)?.toDouble(),
      (json['height'] as num?)?.toDouble(),
      json['image'] as String?,
    );

Map<String, dynamic> _$CatImageResponseToJson(CatImageResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'width': instance.width,
      'height': instance.height,
      'image': instance.image,
    };

StoreDetailsResponse _$StoreDetailsResponseFromJson(
        Map<String, dynamic> json) =>
    StoreDetailsResponse(
      json['id'] as int?,
      json['title'] as String?,
      json['image'] as String?,
      json['details'] as String?,
      json['services'] as String?,
      json['about'] as String?,
    )
      ..statuse = json['statuse'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$StoreDetailsResponseToJson(
        StoreDetailsResponse instance) =>
    <String, dynamic>{
      'statuse': instance.statuse,
      'message': instance.message,
      'id': instance.id,
      'title': instance.title,
      'image': instance.image,
      'details': instance.details,
      'services': instance.services,
      'about': instance.about,
    };
