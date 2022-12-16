// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TransactionCategory {
  int get id => throw _privateConstructorUsedError;
  int? get categoryId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  TransactionType get type => throw _privateConstructorUsedError;
  String get iconName => throw _privateConstructorUsedError;
  String get iconColorName => throw _privateConstructorUsedError;
  TransactionCategory? get parentCategory => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TransactionCategoryCopyWith<TransactionCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionCategoryCopyWith<$Res> {
  factory $TransactionCategoryCopyWith(
          TransactionCategory value, $Res Function(TransactionCategory) then) =
      _$TransactionCategoryCopyWithImpl<$Res, TransactionCategory>;
  @useResult
  $Res call(
      {int id,
      int? categoryId,
      String name,
      TransactionType type,
      String iconName,
      String iconColorName,
      TransactionCategory? parentCategory});

  $TransactionCategoryCopyWith<$Res>? get parentCategory;
}

/// @nodoc
class _$TransactionCategoryCopyWithImpl<$Res, $Val extends TransactionCategory>
    implements $TransactionCategoryCopyWith<$Res> {
  _$TransactionCategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? categoryId = freezed,
    Object? name = null,
    Object? type = null,
    Object? iconName = null,
    Object? iconColorName = null,
    Object? parentCategory = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TransactionType,
      iconName: null == iconName
          ? _value.iconName
          : iconName // ignore: cast_nullable_to_non_nullable
              as String,
      iconColorName: null == iconColorName
          ? _value.iconColorName
          : iconColorName // ignore: cast_nullable_to_non_nullable
              as String,
      parentCategory: freezed == parentCategory
          ? _value.parentCategory
          : parentCategory // ignore: cast_nullable_to_non_nullable
              as TransactionCategory?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TransactionCategoryCopyWith<$Res>? get parentCategory {
    if (_value.parentCategory == null) {
      return null;
    }

    return $TransactionCategoryCopyWith<$Res>(_value.parentCategory!, (value) {
      return _then(_value.copyWith(parentCategory: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_TransactionCategoryCopyWith<$Res>
    implements $TransactionCategoryCopyWith<$Res> {
  factory _$$_TransactionCategoryCopyWith(_$_TransactionCategory value,
          $Res Function(_$_TransactionCategory) then) =
      __$$_TransactionCategoryCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int? categoryId,
      String name,
      TransactionType type,
      String iconName,
      String iconColorName,
      TransactionCategory? parentCategory});

  @override
  $TransactionCategoryCopyWith<$Res>? get parentCategory;
}

/// @nodoc
class __$$_TransactionCategoryCopyWithImpl<$Res>
    extends _$TransactionCategoryCopyWithImpl<$Res, _$_TransactionCategory>
    implements _$$_TransactionCategoryCopyWith<$Res> {
  __$$_TransactionCategoryCopyWithImpl(_$_TransactionCategory _value,
      $Res Function(_$_TransactionCategory) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? categoryId = freezed,
    Object? name = null,
    Object? type = null,
    Object? iconName = null,
    Object? iconColorName = null,
    Object? parentCategory = freezed,
  }) {
    return _then(_$_TransactionCategory(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TransactionType,
      iconName: null == iconName
          ? _value.iconName
          : iconName // ignore: cast_nullable_to_non_nullable
              as String,
      iconColorName: null == iconColorName
          ? _value.iconColorName
          : iconColorName // ignore: cast_nullable_to_non_nullable
              as String,
      parentCategory: freezed == parentCategory
          ? _value.parentCategory
          : parentCategory // ignore: cast_nullable_to_non_nullable
              as TransactionCategory?,
    ));
  }
}

/// @nodoc

class _$_TransactionCategory extends _TransactionCategory {
  const _$_TransactionCategory(
      {required this.id,
      this.categoryId,
      required this.name,
      required this.type,
      required this.iconName,
      required this.iconColorName,
      this.parentCategory})
      : super._();

  @override
  final int id;
  @override
  final int? categoryId;
  @override
  final String name;
  @override
  final TransactionType type;
  @override
  final String iconName;
  @override
  final String iconColorName;
  @override
  final TransactionCategory? parentCategory;

  @override
  String toString() {
    return 'TransactionCategory(id: $id, categoryId: $categoryId, name: $name, type: $type, iconName: $iconName, iconColorName: $iconColorName, parentCategory: $parentCategory)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TransactionCategory &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.iconName, iconName) ||
                other.iconName == iconName) &&
            (identical(other.iconColorName, iconColorName) ||
                other.iconColorName == iconColorName) &&
            (identical(other.parentCategory, parentCategory) ||
                other.parentCategory == parentCategory));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, categoryId, name, type,
      iconName, iconColorName, parentCategory);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TransactionCategoryCopyWith<_$_TransactionCategory> get copyWith =>
      __$$_TransactionCategoryCopyWithImpl<_$_TransactionCategory>(
          this, _$identity);
}

abstract class _TransactionCategory extends TransactionCategory {
  const factory _TransactionCategory(
      {required final int id,
      final int? categoryId,
      required final String name,
      required final TransactionType type,
      required final String iconName,
      required final String iconColorName,
      final TransactionCategory? parentCategory}) = _$_TransactionCategory;
  const _TransactionCategory._() : super._();

  @override
  int get id;
  @override
  int? get categoryId;
  @override
  String get name;
  @override
  TransactionType get type;
  @override
  String get iconName;
  @override
  String get iconColorName;
  @override
  TransactionCategory? get parentCategory;
  @override
  @JsonKey(ignore: true)
  _$$_TransactionCategoryCopyWith<_$_TransactionCategory> get copyWith =>
      throw _privateConstructorUsedError;
}
