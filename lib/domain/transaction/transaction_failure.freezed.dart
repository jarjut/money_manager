// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TransactionFailure {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unexpected,
    required TResult Function() notFound,
    required TResult Function() databaseFailure,
    required TResult Function() invalidTransaction,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? unexpected,
    TResult? Function()? notFound,
    TResult? Function()? databaseFailure,
    TResult? Function()? invalidTransaction,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unexpected,
    TResult Function()? notFound,
    TResult Function()? databaseFailure,
    TResult Function()? invalidTransaction,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Unexpected value) unexpected,
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_DatabaseFailure value) databaseFailure,
    required TResult Function(_InvalidTransaction value) invalidTransaction,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Unexpected value)? unexpected,
    TResult? Function(_NotFound value)? notFound,
    TResult? Function(_DatabaseFailure value)? databaseFailure,
    TResult? Function(_InvalidTransaction value)? invalidTransaction,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Unexpected value)? unexpected,
    TResult Function(_NotFound value)? notFound,
    TResult Function(_DatabaseFailure value)? databaseFailure,
    TResult Function(_InvalidTransaction value)? invalidTransaction,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionFailureCopyWith<$Res> {
  factory $TransactionFailureCopyWith(
          TransactionFailure value, $Res Function(TransactionFailure) then) =
      _$TransactionFailureCopyWithImpl<$Res, TransactionFailure>;
}

/// @nodoc
class _$TransactionFailureCopyWithImpl<$Res, $Val extends TransactionFailure>
    implements $TransactionFailureCopyWith<$Res> {
  _$TransactionFailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_UnexpectedCopyWith<$Res> {
  factory _$$_UnexpectedCopyWith(
          _$_Unexpected value, $Res Function(_$_Unexpected) then) =
      __$$_UnexpectedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_UnexpectedCopyWithImpl<$Res>
    extends _$TransactionFailureCopyWithImpl<$Res, _$_Unexpected>
    implements _$$_UnexpectedCopyWith<$Res> {
  __$$_UnexpectedCopyWithImpl(
      _$_Unexpected _value, $Res Function(_$_Unexpected) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Unexpected implements _Unexpected {
  const _$_Unexpected();

  @override
  String toString() {
    return 'TransactionFailure.unexpected()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Unexpected);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unexpected,
    required TResult Function() notFound,
    required TResult Function() databaseFailure,
    required TResult Function() invalidTransaction,
  }) {
    return unexpected();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? unexpected,
    TResult? Function()? notFound,
    TResult? Function()? databaseFailure,
    TResult? Function()? invalidTransaction,
  }) {
    return unexpected?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unexpected,
    TResult Function()? notFound,
    TResult Function()? databaseFailure,
    TResult Function()? invalidTransaction,
    required TResult orElse(),
  }) {
    if (unexpected != null) {
      return unexpected();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Unexpected value) unexpected,
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_DatabaseFailure value) databaseFailure,
    required TResult Function(_InvalidTransaction value) invalidTransaction,
  }) {
    return unexpected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Unexpected value)? unexpected,
    TResult? Function(_NotFound value)? notFound,
    TResult? Function(_DatabaseFailure value)? databaseFailure,
    TResult? Function(_InvalidTransaction value)? invalidTransaction,
  }) {
    return unexpected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Unexpected value)? unexpected,
    TResult Function(_NotFound value)? notFound,
    TResult Function(_DatabaseFailure value)? databaseFailure,
    TResult Function(_InvalidTransaction value)? invalidTransaction,
    required TResult orElse(),
  }) {
    if (unexpected != null) {
      return unexpected(this);
    }
    return orElse();
  }
}

abstract class _Unexpected implements TransactionFailure {
  const factory _Unexpected() = _$_Unexpected;
}

/// @nodoc
abstract class _$$_NotFoundCopyWith<$Res> {
  factory _$$_NotFoundCopyWith(
          _$_NotFound value, $Res Function(_$_NotFound) then) =
      __$$_NotFoundCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_NotFoundCopyWithImpl<$Res>
    extends _$TransactionFailureCopyWithImpl<$Res, _$_NotFound>
    implements _$$_NotFoundCopyWith<$Res> {
  __$$_NotFoundCopyWithImpl(
      _$_NotFound _value, $Res Function(_$_NotFound) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_NotFound implements _NotFound {
  const _$_NotFound();

  @override
  String toString() {
    return 'TransactionFailure.notFound()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_NotFound);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unexpected,
    required TResult Function() notFound,
    required TResult Function() databaseFailure,
    required TResult Function() invalidTransaction,
  }) {
    return notFound();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? unexpected,
    TResult? Function()? notFound,
    TResult? Function()? databaseFailure,
    TResult? Function()? invalidTransaction,
  }) {
    return notFound?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unexpected,
    TResult Function()? notFound,
    TResult Function()? databaseFailure,
    TResult Function()? invalidTransaction,
    required TResult orElse(),
  }) {
    if (notFound != null) {
      return notFound();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Unexpected value) unexpected,
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_DatabaseFailure value) databaseFailure,
    required TResult Function(_InvalidTransaction value) invalidTransaction,
  }) {
    return notFound(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Unexpected value)? unexpected,
    TResult? Function(_NotFound value)? notFound,
    TResult? Function(_DatabaseFailure value)? databaseFailure,
    TResult? Function(_InvalidTransaction value)? invalidTransaction,
  }) {
    return notFound?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Unexpected value)? unexpected,
    TResult Function(_NotFound value)? notFound,
    TResult Function(_DatabaseFailure value)? databaseFailure,
    TResult Function(_InvalidTransaction value)? invalidTransaction,
    required TResult orElse(),
  }) {
    if (notFound != null) {
      return notFound(this);
    }
    return orElse();
  }
}

abstract class _NotFound implements TransactionFailure {
  const factory _NotFound() = _$_NotFound;
}

/// @nodoc
abstract class _$$_DatabaseFailureCopyWith<$Res> {
  factory _$$_DatabaseFailureCopyWith(
          _$_DatabaseFailure value, $Res Function(_$_DatabaseFailure) then) =
      __$$_DatabaseFailureCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_DatabaseFailureCopyWithImpl<$Res>
    extends _$TransactionFailureCopyWithImpl<$Res, _$_DatabaseFailure>
    implements _$$_DatabaseFailureCopyWith<$Res> {
  __$$_DatabaseFailureCopyWithImpl(
      _$_DatabaseFailure _value, $Res Function(_$_DatabaseFailure) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_DatabaseFailure implements _DatabaseFailure {
  const _$_DatabaseFailure();

  @override
  String toString() {
    return 'TransactionFailure.databaseFailure()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_DatabaseFailure);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unexpected,
    required TResult Function() notFound,
    required TResult Function() databaseFailure,
    required TResult Function() invalidTransaction,
  }) {
    return databaseFailure();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? unexpected,
    TResult? Function()? notFound,
    TResult? Function()? databaseFailure,
    TResult? Function()? invalidTransaction,
  }) {
    return databaseFailure?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unexpected,
    TResult Function()? notFound,
    TResult Function()? databaseFailure,
    TResult Function()? invalidTransaction,
    required TResult orElse(),
  }) {
    if (databaseFailure != null) {
      return databaseFailure();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Unexpected value) unexpected,
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_DatabaseFailure value) databaseFailure,
    required TResult Function(_InvalidTransaction value) invalidTransaction,
  }) {
    return databaseFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Unexpected value)? unexpected,
    TResult? Function(_NotFound value)? notFound,
    TResult? Function(_DatabaseFailure value)? databaseFailure,
    TResult? Function(_InvalidTransaction value)? invalidTransaction,
  }) {
    return databaseFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Unexpected value)? unexpected,
    TResult Function(_NotFound value)? notFound,
    TResult Function(_DatabaseFailure value)? databaseFailure,
    TResult Function(_InvalidTransaction value)? invalidTransaction,
    required TResult orElse(),
  }) {
    if (databaseFailure != null) {
      return databaseFailure(this);
    }
    return orElse();
  }
}

abstract class _DatabaseFailure implements TransactionFailure {
  const factory _DatabaseFailure() = _$_DatabaseFailure;
}

/// @nodoc
abstract class _$$_InvalidTransactionCopyWith<$Res> {
  factory _$$_InvalidTransactionCopyWith(_$_InvalidTransaction value,
          $Res Function(_$_InvalidTransaction) then) =
      __$$_InvalidTransactionCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InvalidTransactionCopyWithImpl<$Res>
    extends _$TransactionFailureCopyWithImpl<$Res, _$_InvalidTransaction>
    implements _$$_InvalidTransactionCopyWith<$Res> {
  __$$_InvalidTransactionCopyWithImpl(
      _$_InvalidTransaction _value, $Res Function(_$_InvalidTransaction) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_InvalidTransaction implements _InvalidTransaction {
  const _$_InvalidTransaction();

  @override
  String toString() {
    return 'TransactionFailure.invalidTransaction()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_InvalidTransaction);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unexpected,
    required TResult Function() notFound,
    required TResult Function() databaseFailure,
    required TResult Function() invalidTransaction,
  }) {
    return invalidTransaction();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? unexpected,
    TResult? Function()? notFound,
    TResult? Function()? databaseFailure,
    TResult? Function()? invalidTransaction,
  }) {
    return invalidTransaction?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unexpected,
    TResult Function()? notFound,
    TResult Function()? databaseFailure,
    TResult Function()? invalidTransaction,
    required TResult orElse(),
  }) {
    if (invalidTransaction != null) {
      return invalidTransaction();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Unexpected value) unexpected,
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_DatabaseFailure value) databaseFailure,
    required TResult Function(_InvalidTransaction value) invalidTransaction,
  }) {
    return invalidTransaction(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Unexpected value)? unexpected,
    TResult? Function(_NotFound value)? notFound,
    TResult? Function(_DatabaseFailure value)? databaseFailure,
    TResult? Function(_InvalidTransaction value)? invalidTransaction,
  }) {
    return invalidTransaction?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Unexpected value)? unexpected,
    TResult Function(_NotFound value)? notFound,
    TResult Function(_DatabaseFailure value)? databaseFailure,
    TResult Function(_InvalidTransaction value)? invalidTransaction,
    required TResult orElse(),
  }) {
    if (invalidTransaction != null) {
      return invalidTransaction(this);
    }
    return orElse();
  }
}

abstract class _InvalidTransaction implements TransactionFailure {
  const factory _InvalidTransaction() = _$_InvalidTransaction;
}
