// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WeatherModel _$WeatherModelFromJson(Map<String, dynamic> json) {
  return _WeatherModel.fromJson(json);
}

/// @nodoc
mixin _$WeatherModel {
  String get lon => throw _privateConstructorUsedError;
  String get lat => throw _privateConstructorUsedError;
  String? get day => throw _privateConstructorUsedError;
  String? get hour => throw _privateConstructorUsedError;
  @JsonKey(name: 'weather')
  List<WeatherAttributeModel>? get listStatusWeather =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String? get nameLocation => throw _privateConstructorUsedError;
  @JsonKey(name: 'main')
  TemporaryModel? get temporary => throw _privateConstructorUsedError;
  @JsonKey(name: 'clouds')
  CloundModel? get clounds => throw _privateConstructorUsedError;
  @JsonKey(name: 'wind')
  WindModel? get winds => throw _privateConstructorUsedError;
  @JsonKey(name: 'sun')
  SunModel? get sun => throw _privateConstructorUsedError;
  @JsonKey(name: 'rain')
  String? get rain => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WeatherModelCopyWith<WeatherModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherModelCopyWith<$Res> {
  factory $WeatherModelCopyWith(
          WeatherModel value, $Res Function(WeatherModel) then) =
      _$WeatherModelCopyWithImpl<$Res, WeatherModel>;
  @useResult
  $Res call(
      {String lon,
      String lat,
      String? day,
      String? hour,
      @JsonKey(name: 'weather') List<WeatherAttributeModel>? listStatusWeather,
      @JsonKey(name: 'name') String? nameLocation,
      @JsonKey(name: 'main') TemporaryModel? temporary,
      @JsonKey(name: 'clouds') CloundModel? clounds,
      @JsonKey(name: 'wind') WindModel? winds,
      @JsonKey(name: 'sun') SunModel? sun,
      @JsonKey(name: 'rain') String? rain});

  $TemporaryModelCopyWith<$Res>? get temporary;
  $CloundModelCopyWith<$Res>? get clounds;
  $WindModelCopyWith<$Res>? get winds;
  $SunModelCopyWith<$Res>? get sun;
}

/// @nodoc
class _$WeatherModelCopyWithImpl<$Res, $Val extends WeatherModel>
    implements $WeatherModelCopyWith<$Res> {
  _$WeatherModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lon = null,
    Object? lat = null,
    Object? day = freezed,
    Object? hour = freezed,
    Object? listStatusWeather = freezed,
    Object? nameLocation = freezed,
    Object? temporary = freezed,
    Object? clounds = freezed,
    Object? winds = freezed,
    Object? sun = freezed,
    Object? rain = freezed,
  }) {
    return _then(_value.copyWith(
      lon: null == lon
          ? _value.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as String,
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as String,
      day: freezed == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as String?,
      hour: freezed == hour
          ? _value.hour
          : hour // ignore: cast_nullable_to_non_nullable
              as String?,
      listStatusWeather: freezed == listStatusWeather
          ? _value.listStatusWeather
          : listStatusWeather // ignore: cast_nullable_to_non_nullable
              as List<WeatherAttributeModel>?,
      nameLocation: freezed == nameLocation
          ? _value.nameLocation
          : nameLocation // ignore: cast_nullable_to_non_nullable
              as String?,
      temporary: freezed == temporary
          ? _value.temporary
          : temporary // ignore: cast_nullable_to_non_nullable
              as TemporaryModel?,
      clounds: freezed == clounds
          ? _value.clounds
          : clounds // ignore: cast_nullable_to_non_nullable
              as CloundModel?,
      winds: freezed == winds
          ? _value.winds
          : winds // ignore: cast_nullable_to_non_nullable
              as WindModel?,
      sun: freezed == sun
          ? _value.sun
          : sun // ignore: cast_nullable_to_non_nullable
              as SunModel?,
      rain: freezed == rain
          ? _value.rain
          : rain // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TemporaryModelCopyWith<$Res>? get temporary {
    if (_value.temporary == null) {
      return null;
    }

    return $TemporaryModelCopyWith<$Res>(_value.temporary!, (value) {
      return _then(_value.copyWith(temporary: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CloundModelCopyWith<$Res>? get clounds {
    if (_value.clounds == null) {
      return null;
    }

    return $CloundModelCopyWith<$Res>(_value.clounds!, (value) {
      return _then(_value.copyWith(clounds: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $WindModelCopyWith<$Res>? get winds {
    if (_value.winds == null) {
      return null;
    }

    return $WindModelCopyWith<$Res>(_value.winds!, (value) {
      return _then(_value.copyWith(winds: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SunModelCopyWith<$Res>? get sun {
    if (_value.sun == null) {
      return null;
    }

    return $SunModelCopyWith<$Res>(_value.sun!, (value) {
      return _then(_value.copyWith(sun: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WeatherModelImplCopyWith<$Res>
    implements $WeatherModelCopyWith<$Res> {
  factory _$$WeatherModelImplCopyWith(
          _$WeatherModelImpl value, $Res Function(_$WeatherModelImpl) then) =
      __$$WeatherModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String lon,
      String lat,
      String? day,
      String? hour,
      @JsonKey(name: 'weather') List<WeatherAttributeModel>? listStatusWeather,
      @JsonKey(name: 'name') String? nameLocation,
      @JsonKey(name: 'main') TemporaryModel? temporary,
      @JsonKey(name: 'clouds') CloundModel? clounds,
      @JsonKey(name: 'wind') WindModel? winds,
      @JsonKey(name: 'sun') SunModel? sun,
      @JsonKey(name: 'rain') String? rain});

  @override
  $TemporaryModelCopyWith<$Res>? get temporary;
  @override
  $CloundModelCopyWith<$Res>? get clounds;
  @override
  $WindModelCopyWith<$Res>? get winds;
  @override
  $SunModelCopyWith<$Res>? get sun;
}

/// @nodoc
class __$$WeatherModelImplCopyWithImpl<$Res>
    extends _$WeatherModelCopyWithImpl<$Res, _$WeatherModelImpl>
    implements _$$WeatherModelImplCopyWith<$Res> {
  __$$WeatherModelImplCopyWithImpl(
      _$WeatherModelImpl _value, $Res Function(_$WeatherModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lon = null,
    Object? lat = null,
    Object? day = freezed,
    Object? hour = freezed,
    Object? listStatusWeather = freezed,
    Object? nameLocation = freezed,
    Object? temporary = freezed,
    Object? clounds = freezed,
    Object? winds = freezed,
    Object? sun = freezed,
    Object? rain = freezed,
  }) {
    return _then(_$WeatherModelImpl(
      lon: null == lon
          ? _value.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as String,
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as String,
      day: freezed == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as String?,
      hour: freezed == hour
          ? _value.hour
          : hour // ignore: cast_nullable_to_non_nullable
              as String?,
      listStatusWeather: freezed == listStatusWeather
          ? _value._listStatusWeather
          : listStatusWeather // ignore: cast_nullable_to_non_nullable
              as List<WeatherAttributeModel>?,
      nameLocation: freezed == nameLocation
          ? _value.nameLocation
          : nameLocation // ignore: cast_nullable_to_non_nullable
              as String?,
      temporary: freezed == temporary
          ? _value.temporary
          : temporary // ignore: cast_nullable_to_non_nullable
              as TemporaryModel?,
      clounds: freezed == clounds
          ? _value.clounds
          : clounds // ignore: cast_nullable_to_non_nullable
              as CloundModel?,
      winds: freezed == winds
          ? _value.winds
          : winds // ignore: cast_nullable_to_non_nullable
              as WindModel?,
      sun: freezed == sun
          ? _value.sun
          : sun // ignore: cast_nullable_to_non_nullable
              as SunModel?,
      rain: freezed == rain
          ? _value.rain
          : rain // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WeatherModelImpl with DiagnosticableTreeMixin implements _WeatherModel {
  _$WeatherModelImpl(
      {required this.lon,
      required this.lat,
      this.day,
      this.hour,
      @JsonKey(name: 'weather')
      final List<WeatherAttributeModel>? listStatusWeather,
      @JsonKey(name: 'name') this.nameLocation,
      @JsonKey(name: 'main') this.temporary,
      @JsonKey(name: 'clouds') this.clounds,
      @JsonKey(name: 'wind') this.winds,
      @JsonKey(name: 'sun') this.sun,
      @JsonKey(name: 'rain') this.rain})
      : _listStatusWeather = listStatusWeather;

  factory _$WeatherModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeatherModelImplFromJson(json);

  @override
  final String lon;
  @override
  final String lat;
  @override
  final String? day;
  @override
  final String? hour;
  final List<WeatherAttributeModel>? _listStatusWeather;
  @override
  @JsonKey(name: 'weather')
  List<WeatherAttributeModel>? get listStatusWeather {
    final value = _listStatusWeather;
    if (value == null) return null;
    if (_listStatusWeather is EqualUnmodifiableListView)
      return _listStatusWeather;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'name')
  final String? nameLocation;
  @override
  @JsonKey(name: 'main')
  final TemporaryModel? temporary;
  @override
  @JsonKey(name: 'clouds')
  final CloundModel? clounds;
  @override
  @JsonKey(name: 'wind')
  final WindModel? winds;
  @override
  @JsonKey(name: 'sun')
  final SunModel? sun;
  @override
  @JsonKey(name: 'rain')
  final String? rain;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'WeatherModel(lon: $lon, lat: $lat, day: $day, hour: $hour, listStatusWeather: $listStatusWeather, nameLocation: $nameLocation, temporary: $temporary, clounds: $clounds, winds: $winds, sun: $sun, rain: $rain)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'WeatherModel'))
      ..add(DiagnosticsProperty('lon', lon))
      ..add(DiagnosticsProperty('lat', lat))
      ..add(DiagnosticsProperty('day', day))
      ..add(DiagnosticsProperty('hour', hour))
      ..add(DiagnosticsProperty('listStatusWeather', listStatusWeather))
      ..add(DiagnosticsProperty('nameLocation', nameLocation))
      ..add(DiagnosticsProperty('temporary', temporary))
      ..add(DiagnosticsProperty('clounds', clounds))
      ..add(DiagnosticsProperty('winds', winds))
      ..add(DiagnosticsProperty('sun', sun))
      ..add(DiagnosticsProperty('rain', rain));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeatherModelImpl &&
            (identical(other.lon, lon) || other.lon == lon) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.day, day) || other.day == day) &&
            (identical(other.hour, hour) || other.hour == hour) &&
            const DeepCollectionEquality()
                .equals(other._listStatusWeather, _listStatusWeather) &&
            (identical(other.nameLocation, nameLocation) ||
                other.nameLocation == nameLocation) &&
            (identical(other.temporary, temporary) ||
                other.temporary == temporary) &&
            (identical(other.clounds, clounds) || other.clounds == clounds) &&
            (identical(other.winds, winds) || other.winds == winds) &&
            (identical(other.sun, sun) || other.sun == sun) &&
            (identical(other.rain, rain) || other.rain == rain));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      lon,
      lat,
      day,
      hour,
      const DeepCollectionEquality().hash(_listStatusWeather),
      nameLocation,
      temporary,
      clounds,
      winds,
      sun,
      rain);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WeatherModelImplCopyWith<_$WeatherModelImpl> get copyWith =>
      __$$WeatherModelImplCopyWithImpl<_$WeatherModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WeatherModelImplToJson(
      this,
    );
  }
}

abstract class _WeatherModel implements WeatherModel {
  factory _WeatherModel(
      {required final String lon,
      required final String lat,
      final String? day,
      final String? hour,
      @JsonKey(name: 'weather')
      final List<WeatherAttributeModel>? listStatusWeather,
      @JsonKey(name: 'name') final String? nameLocation,
      @JsonKey(name: 'main') final TemporaryModel? temporary,
      @JsonKey(name: 'clouds') final CloundModel? clounds,
      @JsonKey(name: 'wind') final WindModel? winds,
      @JsonKey(name: 'sun') final SunModel? sun,
      @JsonKey(name: 'rain') final String? rain}) = _$WeatherModelImpl;

  factory _WeatherModel.fromJson(Map<String, dynamic> json) =
      _$WeatherModelImpl.fromJson;

  @override
  String get lon;
  @override
  String get lat;
  @override
  String? get day;
  @override
  String? get hour;
  @override
  @JsonKey(name: 'weather')
  List<WeatherAttributeModel>? get listStatusWeather;
  @override
  @JsonKey(name: 'name')
  String? get nameLocation;
  @override
  @JsonKey(name: 'main')
  TemporaryModel? get temporary;
  @override
  @JsonKey(name: 'clouds')
  CloundModel? get clounds;
  @override
  @JsonKey(name: 'wind')
  WindModel? get winds;
  @override
  @JsonKey(name: 'sun')
  SunModel? get sun;
  @override
  @JsonKey(name: 'rain')
  String? get rain;
  @override
  @JsonKey(ignore: true)
  _$$WeatherModelImplCopyWith<_$WeatherModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
