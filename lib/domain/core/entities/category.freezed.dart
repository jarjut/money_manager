// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TransactionCategory {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  TransactionType get type => throw _privateConstructorUsedError;
  String get iconName => throw _privateConstructorUsedError;
  String get iconColorName => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  int? get categoryId => throw _privateConstructorUsedError;
  TransactionCategory? get parentCategory => throw _privateConstructorUsedError;
  bool get hidden => throw _privateConstructorUsedError;
  DateTime? get deletedAt => throw _privateConstructorUsedError;

  /// Create a copy of TransactionCategory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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
      String name,
      TransactionType type,
      String iconName,
      String iconColorName,
      DateTime createdAt,
      DateTime updatedAt,
      int? categoryId,
      TransactionCategory? parentCategory,
      bool hidden,
      DateTime? deletedAt});

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

  /// Create a copy of TransactionCategory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? type = null,
    Object? iconName = null,
    Object? iconColorName = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? categoryId = freezed,
    Object? parentCategory = freezed,
    Object? hidden = null,
    Object? deletedAt = freezed,
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
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      parentCategory: freezed == parentCategory
          ? _value.parentCategory
          : parentCategory // ignore: cast_nullable_to_non_nullable
              as TransactionCategory?,
      hidden: null == hidden
          ? _value.hidden
          : hidden // ignore: cast_nullable_to_non_nullable
              as bool,
      deletedAt: freezed == deletedAt
          ? _value.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  /// Create a copy of TransactionCategory
  /// with the given fields replaced by the non-null parameter values.
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
abstract class _$$TransactionCategoryImplCopyWith<$Res>
    implements $TransactionCategoryCopyWith<$Res> {
  factory _$$TransactionCategoryImplCopyWith(_$TransactionCategoryImpl value,
          $Res Function(_$TransactionCategoryImpl) then) =
      __$$TransactionCategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      TransactionType type,
      String iconName,
      String iconColorName,
      DateTime createdAt,
      DateTime updatedAt,
      int? categoryId,
      TransactionCategory? parentCategory,
      bool hidden,
      DateTime? deletedAt});

  @override
  $TransactionCategoryCopyWith<$Res>? get parentCategory;
}

/// @nodoc
class __$$TransactionCategoryImplCopyWithImpl<$Res>
    extends _$TransactionCategoryCopyWithImpl<$Res, _$TransactionCategoryImpl>
    implements _$$TransactionCategoryImplCopyWith<$Res> {
  __$$TransactionCategoryImplCopyWithImpl(_$TransactionCategoryImpl _value,
      $Res Function(_$TransactionCategoryImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransactionCategory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? type = null,
    Object? iconName = null,
    Object? iconColorName = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? categoryId = freezed,
    Object? parentCategory = freezed,
    Object? hidden = null,
    Object? deletedAt = freezed,
  }) {
    return _then(_$TransactionCategoryImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
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
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      parentCategory: freezed == parentCategory
          ? _value.parentCategory
          : parentCategory // ignore: cast_nullable_to_non_nullable
              as TransactionCategory?,
      hidden: null == hidden
          ? _value.hidden
          : hidden // ignore: cast_nullable_to_non_nullable
              as bool,
      deletedAt: freezed == deletedAt
          ? _value.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$TransactionCategoryImpl extends _TransactionCategory {
  const _$TransactionCategoryImpl(
      {required this.id,
      required this.name,
      required this.type,
      required this.iconName,
      required this.iconColorName,
      required this.createdAt,
      required this.updatedAt,
      this.categoryId,
      this.parentCategory,
      this.hidden = false,
      this.deletedAt})
      : super._();

  @override
  final int id;
  @override
  final String name;
  @override
  final TransactionType type;
  @override
  final String iconName;
  @override
  final String iconColorName;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final int? categoryId;
  @override
  final TransactionCategory? parentCategory;
  @override
  @JsonKey()
  final bool hidden;
  @override
  final DateTime? deletedAt;

  @override
  String toString() {
    return 'TransactionCategory(id: $id, name: $name, type: $type, iconName: $iconName, iconColorName: $iconColorName, createdAt: $createdAt, updatedAt: $updatedAt, categoryId: $categoryId, parentCategory: $parentCategory, hidden: $hidden, deletedAt: $deletedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionCategoryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.iconName, iconName) ||
                other.iconName == iconName) &&
            (identical(other.iconColorName, iconColorName) ||
                other.iconColorName == iconColorName) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.parentCategory, parentCategory) ||
                other.parentCategory == parentCategory) &&
            (identical(other.hidden, hidden) || other.hidden == hidden) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      type,
      iconName,
      iconColorName,
      createdAt,
      updatedAt,
      categoryId,
      parentCategory,
      hidden,
      deletedAt);

  /// Create a copy of TransactionCategory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionCategoryImplCopyWith<_$TransactionCategoryImpl> get copyWith =>
      __$$TransactionCategoryImplCopyWithImpl<_$TransactionCategoryImpl>(
          this, _$identity);
}

abstract class _TransactionCategory extends TransactionCategory {
  const factory _TransactionCategory(
      {required final int id,
      required final String name,
      required final TransactionType type,
      required final String iconName,
      required final String iconColorName,
      required final DateTime createdAt,
      required final DateTime updatedAt,
      final int? categoryId,
      final TransactionCategory? parentCategory,
      final bool hidden,
      final DateTime? deletedAt}) = _$TransactionCategoryImpl;
  const _TransactionCategory._() : super._();

  @override
  int get id;
  @override
  String get name;
  @override
  TransactionType get type;
  @override
  String get iconName;
  @override
  String get iconColorName;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  int? get categoryId;
  @override
  TransactionCategory? get parentCategory;
  @override
  bool get hidden;
  @override
  DateTime? get deletedAt;

  /// Create a copy of TransactionCategory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TransactionCategoryImplCopyWith<_$TransactionCategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
