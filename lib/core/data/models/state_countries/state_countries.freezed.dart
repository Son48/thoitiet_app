// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'state_countries.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StateCountriesModel _$StateCountriesModelFromJson(Map<String, dynamic> json) {
  return _StateCountriesModel.fromJson(json);
}

/// @nodoc
mixin _$StateCountriesModel {
  @JsonKey(name: 'stateCountry')
  String? get stateContries => throw _privateConstructorUsedError;
  @JsonKey(name: 'locations')
  List<LocationJSONModel>? get locations => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StateCountriesModelCopyWith<StateCountriesModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StateCountriesModelCopyWith<$Res> {
  factory $StateCountriesModelCopyWith(
          StateCountriesModel value, $Res Function(StateCountriesModel) then) =
      _$StateCountriesModelCopyWithImpl<$Res, StateCountriesModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'stateCountry') String? stateContries,
      @JsonKey(name: 'locations') List<LocationJSONModel>? locations});
}

/// @nodoc
class _$StateCountriesModelCopyWithImpl<$Res, $Val extends StateCountriesModel>
    implements $StateCountriesModelCopyWith<$Res> {
  _$StateCountriesModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stateContries = freezed,
    Object? locations = freezed,
  }) {
    return _then(_value.copyWith(
      stateContries: freezed == stateContries
          ? _value.stateContries
          : stateContries // ignore: cast_nullable_to_non_nullable
              as String?,
      locations: freezed == locations
          ? _value.locations
          : locations // ignore: cast_nullable_to_non_nullable
              as List<LocationJSONModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StateCountriesModelImplCopyWith<$Res>
    implements $StateCountriesModelCopyWith<$Res> {
  factory _$$StateCountriesModelImplCopyWith(_$StateCountriesModelImpl value,
          $Res Function(_$StateCountriesModelImpl) then) =
      __$$StateCountriesModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'stateCountry') String? stateContries,
      @JsonKey(name: 'locations') List<LocationJSONModel>? locations});
}

/// @nodoc
class __$$StateCountriesModelImplCopyWithImpl<$Res>
    extends _$StateCountriesModelCopyWithImpl<$Res, _$StateCountriesModelImpl>
    implements _$$StateCountriesModelImplCopyWith<$Res> {
  __$$StateCountriesModelImplCopyWithImpl(_$StateCountriesModelImpl _value,
      $Res Function(_$StateCountriesModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stateContries = freezed,
    Object? locations = freezed,
  }) {
    return _then(_$StateCountriesModelImpl(
      stateContries: freezed == stateContries
          ? _value.stateContries
          : stateContries // ignore: cast_nullable_to_non_nullable
              as String?,
      locations: freezed == locations
          ? _value._locations
          : locations // ignore: cast_nullable_to_non_nullable
              as List<LocationJSONModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StateCountriesModelImpl
    with DiagnosticableTreeMixin
    implements _StateCountriesModel {
  _$StateCountriesModelImpl(
      {@JsonKey(name: 'stateCountry') this.stateContries,
      @JsonKey(name: 'locations') final List<LocationJSONModel>? locations})
      : _locations = locations;

  factory _$StateCountriesModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$StateCountriesModelImplFromJson(json);

  @override
  @JsonKey(name: 'stateCountry')
  final String? stateContries;
  final List<LocationJSONModel>? _locations;
  @override
  @JsonKey(name: 'locations')
  List<LocationJSONModel>? get locations {
    final value = _locations;
    if (value == null) return null;
    if (_locations is EqualUnmodifiableListView) return _locations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'StateCountriesModel(stateContries: $stateContries, locations: $locations)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'StateCountriesModel'))
      ..add(DiagnosticsProperty('stateContries', stateContries))
      ..add(DiagnosticsProperty('locations', locations));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StateCountriesModelImpl &&
            (identical(other.stateContries, stateContries) ||
                other.stateContries == stateContries) &&
            const DeepCollectionEquality()
                .equals(other._locations, _locations));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, stateContries,
      const DeepCollectionEquality().hash(_locations));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StateCountriesModelImplCopyWith<_$StateCountriesModelImpl> get copyWith =>
      __$$StateCountriesModelImplCopyWithImpl<_$StateCountriesModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StateCountriesModelImplToJson(
      this,
    );
  }
}

abstract class _StateCountriesModel implements StateCountriesModel {
  factory _StateCountriesModel(
      {@JsonKey(name: 'stateCountry') final String? stateContries,
      @JsonKey(name: 'locations')
      final List<LocationJSONModel>? locations}) = _$StateCountriesModelImpl;

  factory _StateCountriesModel.fromJson(Map<String, dynamic> json) =
      _$StateCountriesModelImpl.fromJson;

  @override
  @JsonKey(name: 'stateCountry')
  String? get stateContries;
  @override
  @JsonKey(name: 'locations')
  List<LocationJSONModel>? get locations;
  @override
  @JsonKey(ignore: true)
  _$$StateCountriesModelImplCopyWith<_$StateCountriesModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
