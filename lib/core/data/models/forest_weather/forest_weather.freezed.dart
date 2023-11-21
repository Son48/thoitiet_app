// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forest_weather.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ForestWeatherModel _$ForestWeatherModelFromJson(Map<String, dynamic> json) {
  return _ForestWeatherModel.fromJson(json);
}

/// @nodoc
mixin _$ForestWeatherModel {
  @JsonKey(name: 'daily')
  List<WeatherDailyModel>? get daily => throw _privateConstructorUsedError;
  @JsonKey(name: 'hourly')
  List<WeatherHourlyModel>? get hourly => throw _privateConstructorUsedError;
  @JsonKey(name: 'current')
  CurrentWeather? get currentWeather => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ForestWeatherModelCopyWith<ForestWeatherModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForestWeatherModelCopyWith<$Res> {
  factory $ForestWeatherModelCopyWith(
          ForestWeatherModel value, $Res Function(ForestWeatherModel) then) =
      _$ForestWeatherModelCopyWithImpl<$Res, ForestWeatherModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'daily') List<WeatherDailyModel>? daily,
      @JsonKey(name: 'hourly') List<WeatherHourlyModel>? hourly,
      @JsonKey(name: 'current') CurrentWeather? currentWeather});

  $CurrentWeatherCopyWith<$Res>? get currentWeather;
}

/// @nodoc
class _$ForestWeatherModelCopyWithImpl<$Res, $Val extends ForestWeatherModel>
    implements $ForestWeatherModelCopyWith<$Res> {
  _$ForestWeatherModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? daily = freezed,
    Object? hourly = freezed,
    Object? currentWeather = freezed,
  }) {
    return _then(_value.copyWith(
      daily: freezed == daily
          ? _value.daily
          : daily // ignore: cast_nullable_to_non_nullable
              as List<WeatherDailyModel>?,
      hourly: freezed == hourly
          ? _value.hourly
          : hourly // ignore: cast_nullable_to_non_nullable
              as List<WeatherHourlyModel>?,
      currentWeather: freezed == currentWeather
          ? _value.currentWeather
          : currentWeather // ignore: cast_nullable_to_non_nullable
              as CurrentWeather?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CurrentWeatherCopyWith<$Res>? get currentWeather {
    if (_value.currentWeather == null) {
      return null;
    }

    return $CurrentWeatherCopyWith<$Res>(_value.currentWeather!, (value) {
      return _then(_value.copyWith(currentWeather: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ForestWeatherModelImplCopyWith<$Res>
    implements $ForestWeatherModelCopyWith<$Res> {
  factory _$$ForestWeatherModelImplCopyWith(_$ForestWeatherModelImpl value,
          $Res Function(_$ForestWeatherModelImpl) then) =
      __$$ForestWeatherModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'daily') List<WeatherDailyModel>? daily,
      @JsonKey(name: 'hourly') List<WeatherHourlyModel>? hourly,
      @JsonKey(name: 'current') CurrentWeather? currentWeather});

  @override
  $CurrentWeatherCopyWith<$Res>? get currentWeather;
}

/// @nodoc
class __$$ForestWeatherModelImplCopyWithImpl<$Res>
    extends _$ForestWeatherModelCopyWithImpl<$Res, _$ForestWeatherModelImpl>
    implements _$$ForestWeatherModelImplCopyWith<$Res> {
  __$$ForestWeatherModelImplCopyWithImpl(_$ForestWeatherModelImpl _value,
      $Res Function(_$ForestWeatherModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? daily = freezed,
    Object? hourly = freezed,
    Object? currentWeather = freezed,
  }) {
    return _then(_$ForestWeatherModelImpl(
      daily: freezed == daily
          ? _value._daily
          : daily // ignore: cast_nullable_to_non_nullable
              as List<WeatherDailyModel>?,
      hourly: freezed == hourly
          ? _value._hourly
          : hourly // ignore: cast_nullable_to_non_nullable
              as List<WeatherHourlyModel>?,
      currentWeather: freezed == currentWeather
          ? _value.currentWeather
          : currentWeather // ignore: cast_nullable_to_non_nullable
              as CurrentWeather?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ForestWeatherModelImpl
    with DiagnosticableTreeMixin
    implements _ForestWeatherModel {
  _$ForestWeatherModelImpl(
      {@JsonKey(name: 'daily') final List<WeatherDailyModel>? daily,
      @JsonKey(name: 'hourly') final List<WeatherHourlyModel>? hourly,
      @JsonKey(name: 'current') this.currentWeather})
      : _daily = daily,
        _hourly = hourly;

  factory _$ForestWeatherModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ForestWeatherModelImplFromJson(json);

  final List<WeatherDailyModel>? _daily;
  @override
  @JsonKey(name: 'daily')
  List<WeatherDailyModel>? get daily {
    final value = _daily;
    if (value == null) return null;
    if (_daily is EqualUnmodifiableListView) return _daily;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<WeatherHourlyModel>? _hourly;
  @override
  @JsonKey(name: 'hourly')
  List<WeatherHourlyModel>? get hourly {
    final value = _hourly;
    if (value == null) return null;
    if (_hourly is EqualUnmodifiableListView) return _hourly;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'current')
  final CurrentWeather? currentWeather;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ForestWeatherModel(daily: $daily, hourly: $hourly, currentWeather: $currentWeather)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ForestWeatherModel'))
      ..add(DiagnosticsProperty('daily', daily))
      ..add(DiagnosticsProperty('hourly', hourly))
      ..add(DiagnosticsProperty('currentWeather', currentWeather));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForestWeatherModelImpl &&
            const DeepCollectionEquality().equals(other._daily, _daily) &&
            const DeepCollectionEquality().equals(other._hourly, _hourly) &&
            (identical(other.currentWeather, currentWeather) ||
                other.currentWeather == currentWeather));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_daily),
      const DeepCollectionEquality().hash(_hourly),
      currentWeather);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ForestWeatherModelImplCopyWith<_$ForestWeatherModelImpl> get copyWith =>
      __$$ForestWeatherModelImplCopyWithImpl<_$ForestWeatherModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ForestWeatherModelImplToJson(
      this,
    );
  }
}

abstract class _ForestWeatherModel implements ForestWeatherModel {
  factory _ForestWeatherModel(
          {@JsonKey(name: 'daily') final List<WeatherDailyModel>? daily,
          @JsonKey(name: 'hourly') final List<WeatherHourlyModel>? hourly,
          @JsonKey(name: 'current') final CurrentWeather? currentWeather}) =
      _$ForestWeatherModelImpl;

  factory _ForestWeatherModel.fromJson(Map<String, dynamic> json) =
      _$ForestWeatherModelImpl.fromJson;

  @override
  @JsonKey(name: 'daily')
  List<WeatherDailyModel>? get daily;
  @override
  @JsonKey(name: 'hourly')
  List<WeatherHourlyModel>? get hourly;
  @override
  @JsonKey(name: 'current')
  CurrentWeather? get currentWeather;
  @override
  @JsonKey(ignore: true)
  _$$ForestWeatherModelImplCopyWith<_$ForestWeatherModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
