// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather_attribute.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WeatherAttributeModel _$WeatherAttributeModelFromJson(
    Map<String, dynamic> json) {
  return _WeatherAttributeModel.fromJson(json);
}

/// @nodoc
mixin _$WeatherAttributeModel {
  @JsonKey(name: 'id')
  int? get idWeatherAttribute => throw _privateConstructorUsedError;
  @JsonKey(name: 'main')
  String? get mainWeatherAttribute => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  String? get desWeatherAttribute => throw _privateConstructorUsedError;
  @JsonKey(name: 'icon')
  String? get urlStatusIcon => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WeatherAttributeModelCopyWith<WeatherAttributeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherAttributeModelCopyWith<$Res> {
  factory $WeatherAttributeModelCopyWith(WeatherAttributeModel value,
          $Res Function(WeatherAttributeModel) then) =
      _$WeatherAttributeModelCopyWithImpl<$Res, WeatherAttributeModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? idWeatherAttribute,
      @JsonKey(name: 'main') String? mainWeatherAttribute,
      @JsonKey(name: 'description') String? desWeatherAttribute,
      @JsonKey(name: 'icon') String? urlStatusIcon});
}

/// @nodoc
class _$WeatherAttributeModelCopyWithImpl<$Res,
        $Val extends WeatherAttributeModel>
    implements $WeatherAttributeModelCopyWith<$Res> {
  _$WeatherAttributeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idWeatherAttribute = freezed,
    Object? mainWeatherAttribute = freezed,
    Object? desWeatherAttribute = freezed,
    Object? urlStatusIcon = freezed,
  }) {
    return _then(_value.copyWith(
      idWeatherAttribute: freezed == idWeatherAttribute
          ? _value.idWeatherAttribute
          : idWeatherAttribute // ignore: cast_nullable_to_non_nullable
              as int?,
      mainWeatherAttribute: freezed == mainWeatherAttribute
          ? _value.mainWeatherAttribute
          : mainWeatherAttribute // ignore: cast_nullable_to_non_nullable
              as String?,
      desWeatherAttribute: freezed == desWeatherAttribute
          ? _value.desWeatherAttribute
          : desWeatherAttribute // ignore: cast_nullable_to_non_nullable
              as String?,
      urlStatusIcon: freezed == urlStatusIcon
          ? _value.urlStatusIcon
          : urlStatusIcon // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WeatherAttributeModelImplCopyWith<$Res>
    implements $WeatherAttributeModelCopyWith<$Res> {
  factory _$$WeatherAttributeModelImplCopyWith(
          _$WeatherAttributeModelImpl value,
          $Res Function(_$WeatherAttributeModelImpl) then) =
      __$$WeatherAttributeModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? idWeatherAttribute,
      @JsonKey(name: 'main') String? mainWeatherAttribute,
      @JsonKey(name: 'description') String? desWeatherAttribute,
      @JsonKey(name: 'icon') String? urlStatusIcon});
}

/// @nodoc
class __$$WeatherAttributeModelImplCopyWithImpl<$Res>
    extends _$WeatherAttributeModelCopyWithImpl<$Res,
        _$WeatherAttributeModelImpl>
    implements _$$WeatherAttributeModelImplCopyWith<$Res> {
  __$$WeatherAttributeModelImplCopyWithImpl(_$WeatherAttributeModelImpl _value,
      $Res Function(_$WeatherAttributeModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idWeatherAttribute = freezed,
    Object? mainWeatherAttribute = freezed,
    Object? desWeatherAttribute = freezed,
    Object? urlStatusIcon = freezed,
  }) {
    return _then(_$WeatherAttributeModelImpl(
      idWeatherAttribute: freezed == idWeatherAttribute
          ? _value.idWeatherAttribute
          : idWeatherAttribute // ignore: cast_nullable_to_non_nullable
              as int?,
      mainWeatherAttribute: freezed == mainWeatherAttribute
          ? _value.mainWeatherAttribute
          : mainWeatherAttribute // ignore: cast_nullable_to_non_nullable
              as String?,
      desWeatherAttribute: freezed == desWeatherAttribute
          ? _value.desWeatherAttribute
          : desWeatherAttribute // ignore: cast_nullable_to_non_nullable
              as String?,
      urlStatusIcon: freezed == urlStatusIcon
          ? _value.urlStatusIcon
          : urlStatusIcon // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WeatherAttributeModelImpl
    with DiagnosticableTreeMixin
    implements _WeatherAttributeModel {
  _$WeatherAttributeModelImpl(
      {@JsonKey(name: 'id') this.idWeatherAttribute,
      @JsonKey(name: 'main') this.mainWeatherAttribute,
      @JsonKey(name: 'description') this.desWeatherAttribute,
      @JsonKey(name: 'icon') this.urlStatusIcon});

  factory _$WeatherAttributeModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeatherAttributeModelImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? idWeatherAttribute;
  @override
  @JsonKey(name: 'main')
  final String? mainWeatherAttribute;
  @override
  @JsonKey(name: 'description')
  final String? desWeatherAttribute;
  @override
  @JsonKey(name: 'icon')
  final String? urlStatusIcon;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'WeatherAttributeModel(idWeatherAttribute: $idWeatherAttribute, mainWeatherAttribute: $mainWeatherAttribute, desWeatherAttribute: $desWeatherAttribute, urlStatusIcon: $urlStatusIcon)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'WeatherAttributeModel'))
      ..add(DiagnosticsProperty('idWeatherAttribute', idWeatherAttribute))
      ..add(DiagnosticsProperty('mainWeatherAttribute', mainWeatherAttribute))
      ..add(DiagnosticsProperty('desWeatherAttribute', desWeatherAttribute))
      ..add(DiagnosticsProperty('urlStatusIcon', urlStatusIcon));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeatherAttributeModelImpl &&
            (identical(other.idWeatherAttribute, idWeatherAttribute) ||
                other.idWeatherAttribute == idWeatherAttribute) &&
            (identical(other.mainWeatherAttribute, mainWeatherAttribute) ||
                other.mainWeatherAttribute == mainWeatherAttribute) &&
            (identical(other.desWeatherAttribute, desWeatherAttribute) ||
                other.desWeatherAttribute == desWeatherAttribute) &&
            (identical(other.urlStatusIcon, urlStatusIcon) ||
                other.urlStatusIcon == urlStatusIcon));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, idWeatherAttribute,
      mainWeatherAttribute, desWeatherAttribute, urlStatusIcon);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WeatherAttributeModelImplCopyWith<_$WeatherAttributeModelImpl>
      get copyWith => __$$WeatherAttributeModelImplCopyWithImpl<
          _$WeatherAttributeModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WeatherAttributeModelImplToJson(
      this,
    );
  }
}

abstract class _WeatherAttributeModel implements WeatherAttributeModel {
  factory _WeatherAttributeModel(
          {@JsonKey(name: 'id') final int? idWeatherAttribute,
          @JsonKey(name: 'main') final String? mainWeatherAttribute,
          @JsonKey(name: 'description') final String? desWeatherAttribute,
          @JsonKey(name: 'icon') final String? urlStatusIcon}) =
      _$WeatherAttributeModelImpl;

  factory _WeatherAttributeModel.fromJson(Map<String, dynamic> json) =
      _$WeatherAttributeModelImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get idWeatherAttribute;
  @override
  @JsonKey(name: 'main')
  String? get mainWeatherAttribute;
  @override
  @JsonKey(name: 'description')
  String? get desWeatherAttribute;
  @override
  @JsonKey(name: 'icon')
  String? get urlStatusIcon;
  @override
  @JsonKey(ignore: true)
  _$$WeatherAttributeModelImplCopyWith<_$WeatherAttributeModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
