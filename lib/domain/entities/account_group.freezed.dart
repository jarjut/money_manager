// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'account_group.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AccountGroup {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  bool get origin => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AccountGroupCopyWith<AccountGroup> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountGroupCopyWith<$Res> {
  factory $AccountGroupCopyWith(
          AccountGroup value, $Res Function(AccountGroup) then) =
      _$AccountGroupCopyWithImpl<$Res, AccountGroup>;
  @useResult
  $Res call({int id, String name, bool origin});
}

/// @nodoc
class _$AccountGroupCopyWithImpl<$Res, $Val extends AccountGroup>
    implements $AccountGroupCopyWith<$Res> {
  _$AccountGroupCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? origin = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      origin: null == origin
          ? _value.origin
          : origin // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AccountGroupCopyWith<$Res>
    implements $AccountGroupCopyWith<$Res> {
  factory _$$_AccountGroupCopyWith(
          _$_AccountGroup value, $Res Function(_$_AccountGroup) then) =
      __$$_AccountGroupCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, bool origin});
}

/// @nodoc
class __$$_AccountGroupCopyWithImpl<$Res>
    extends _$AccountGroupCopyWithImpl<$Res, _$_AccountGroup>
    implements _$$_AccountGroupCopyWith<$Res> {
  __$$_AccountGroupCopyWithImpl(
      _$_AccountGroup _value, $Res Function(_$_AccountGroup) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? origin = null,
  }) {
    return _then(_$_AccountGroup(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      origin: null == origin
          ? _value.origin
          : origin // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_AccountGroup implements _AccountGroup {
  const _$_AccountGroup(
      {required this.id, required this.name, this.origin = false});

  @override
  final int id;
  @override
  final String name;
  @override
  @JsonKey()
  final bool origin;

  @override
  String toString() {
    return 'AccountGroup(id: $id, name: $name, origin: $origin)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AccountGroup &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.origin, origin) || other.origin == origin));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, origin);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AccountGroupCopyWith<_$_AccountGroup> get copyWith =>
      __$$_AccountGroupCopyWithImpl<_$_AccountGroup>(this, _$identity);
}

abstract class _AccountGroup implements AccountGroup {
  const factory _AccountGroup(
      {required final int id,
      required final String name,
      final bool origin}) = _$_AccountGroup;

  @override
  int get id;
  @override
  String get name;
  @override
  bool get origin;
  @override
  @JsonKey(ignore: true)
  _$$_AccountGroupCopyWith<_$_AccountGroup> get copyWith =>
      throw _privateConstructorUsedError;
}
