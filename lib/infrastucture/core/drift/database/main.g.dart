// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main.dart';

// **************************************************************************
// DriftDatabaseGenerator
// **************************************************************************

// ignore_for_file: type=lint
class TCategory extends DataClass implements Insertable<TCategory> {
  final int id;
  final int? categoryId;
  final String name;
  final String iconName;
  final String iconColorName;
  final TransactionType type;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  const TCategory(
      {required this.id,
      this.categoryId,
      required this.name,
      required this.iconName,
      required this.iconColorName,
      required this.type,
      required this.createdAt,
      required this.updatedAt,
      this.deletedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || categoryId != null) {
      map['category_id'] = Variable<int>(categoryId);
    }
    map['name'] = Variable<String>(name);
    map['icon_name'] = Variable<String>(iconName);
    map['icon_color_name'] = Variable<String>(iconColorName);
    {
      final converter = $TCategoriesTable.$converter0;
      map['type'] = Variable<int>(converter.toSql(type));
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    return map;
  }

  TCategoriesCompanion toCompanion(bool nullToAbsent) {
    return TCategoriesCompanion(
      id: Value(id),
      categoryId: categoryId == null && nullToAbsent
          ? const Value.absent()
          : Value(categoryId),
      name: Value(name),
      iconName: Value(iconName),
      iconColorName: Value(iconColorName),
      type: Value(type),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory TCategory.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TCategory(
      id: serializer.fromJson<int>(json['id']),
      categoryId: serializer.fromJson<int?>(json['categoryId']),
      name: serializer.fromJson<String>(json['name']),
      iconName: serializer.fromJson<String>(json['iconName']),
      iconColorName: serializer.fromJson<String>(json['iconColorName']),
      type: serializer.fromJson<TransactionType>(json['type']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'categoryId': serializer.toJson<int?>(categoryId),
      'name': serializer.toJson<String>(name),
      'iconName': serializer.toJson<String>(iconName),
      'iconColorName': serializer.toJson<String>(iconColorName),
      'type': serializer.toJson<TransactionType>(type),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
    };
  }

  TCategory copyWith(
          {int? id,
          Value<int?> categoryId = const Value.absent(),
          String? name,
          String? iconName,
          String? iconColorName,
          TransactionType? type,
          DateTime? createdAt,
          DateTime? updatedAt,
          Value<DateTime?> deletedAt = const Value.absent()}) =>
      TCategory(
        id: id ?? this.id,
        categoryId: categoryId.present ? categoryId.value : this.categoryId,
        name: name ?? this.name,
        iconName: iconName ?? this.iconName,
        iconColorName: iconColorName ?? this.iconColorName,
        type: type ?? this.type,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
      );
  @override
  String toString() {
    return (StringBuffer('TCategory(')
          ..write('id: $id, ')
          ..write('categoryId: $categoryId, ')
          ..write('name: $name, ')
          ..write('iconName: $iconName, ')
          ..write('iconColorName: $iconColorName, ')
          ..write('type: $type, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, categoryId, name, iconName, iconColorName,
      type, createdAt, updatedAt, deletedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TCategory &&
          other.id == this.id &&
          other.categoryId == this.categoryId &&
          other.name == this.name &&
          other.iconName == this.iconName &&
          other.iconColorName == this.iconColorName &&
          other.type == this.type &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt);
}

class TCategoriesCompanion extends UpdateCompanion<TCategory> {
  final Value<int> id;
  final Value<int?> categoryId;
  final Value<String> name;
  final Value<String> iconName;
  final Value<String> iconColorName;
  final Value<TransactionType> type;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  const TCategoriesCompanion({
    this.id = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.name = const Value.absent(),
    this.iconName = const Value.absent(),
    this.iconColorName = const Value.absent(),
    this.type = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
  });
  TCategoriesCompanion.insert({
    this.id = const Value.absent(),
    this.categoryId = const Value.absent(),
    required String name,
    required String iconName,
    required String iconColorName,
    required TransactionType type,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
  })  : name = Value(name),
        iconName = Value(iconName),
        iconColorName = Value(iconColorName),
        type = Value(type);
  static Insertable<TCategory> custom({
    Expression<int>? id,
    Expression<int>? categoryId,
    Expression<String>? name,
    Expression<String>? iconName,
    Expression<String>? iconColorName,
    Expression<int>? type,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (categoryId != null) 'category_id': categoryId,
      if (name != null) 'name': name,
      if (iconName != null) 'icon_name': iconName,
      if (iconColorName != null) 'icon_color_name': iconColorName,
      if (type != null) 'type': type,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
    });
  }

  TCategoriesCompanion copyWith(
      {Value<int>? id,
      Value<int?>? categoryId,
      Value<String>? name,
      Value<String>? iconName,
      Value<String>? iconColorName,
      Value<TransactionType>? type,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<DateTime?>? deletedAt}) {
    return TCategoriesCompanion(
      id: id ?? this.id,
      categoryId: categoryId ?? this.categoryId,
      name: name ?? this.name,
      iconName: iconName ?? this.iconName,
      iconColorName: iconColorName ?? this.iconColorName,
      type: type ?? this.type,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<int>(categoryId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (iconName.present) {
      map['icon_name'] = Variable<String>(iconName.value);
    }
    if (iconColorName.present) {
      map['icon_color_name'] = Variable<String>(iconColorName.value);
    }
    if (type.present) {
      final converter = $TCategoriesTable.$converter0;
      map['type'] = Variable<int>(converter.toSql(type.value));
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TCategoriesCompanion(')
          ..write('id: $id, ')
          ..write('categoryId: $categoryId, ')
          ..write('name: $name, ')
          ..write('iconName: $iconName, ')
          ..write('iconColorName: $iconColorName, ')
          ..write('type: $type, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }
}

class $TCategoriesTable extends TCategories
    with TableInfo<$TCategoriesTable, TCategory> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TCategoriesTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _categoryIdMeta = const VerificationMeta('categoryId');
  @override
  late final GeneratedColumn<int> categoryId = GeneratedColumn<int>(
      'category_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: 'REFERENCES t_categories (id) ON DELETE SET NULL');
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _iconNameMeta = const VerificationMeta('iconName');
  @override
  late final GeneratedColumn<String> iconName = GeneratedColumn<String>(
      'icon_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _iconColorNameMeta =
      const VerificationMeta('iconColorName');
  @override
  late final GeneratedColumn<String> iconColorName = GeneratedColumn<String>(
      'icon_color_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumnWithTypeConverter<TransactionType, int> type =
      GeneratedColumn<int>('type', aliasedName, false,
              type: DriftSqlType.int, requiredDuringInsert: true)
          .withConverter<TransactionType>($TCategoriesTable.$converter0);
  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  final VerificationMeta _updatedAtMeta = const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  final VerificationMeta _deletedAtMeta = const VerificationMeta('deletedAt');
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        categoryId,
        name,
        iconName,
        iconColorName,
        type,
        createdAt,
        updatedAt,
        deletedAt
      ];
  @override
  String get aliasedName => _alias ?? 't_categories';
  @override
  String get actualTableName => 't_categories';
  @override
  VerificationContext validateIntegrity(Insertable<TCategory> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('category_id')) {
      context.handle(
          _categoryIdMeta,
          categoryId.isAcceptableOrUnknown(
              data['category_id']!, _categoryIdMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('icon_name')) {
      context.handle(_iconNameMeta,
          iconName.isAcceptableOrUnknown(data['icon_name']!, _iconNameMeta));
    } else if (isInserting) {
      context.missing(_iconNameMeta);
    }
    if (data.containsKey('icon_color_name')) {
      context.handle(
          _iconColorNameMeta,
          iconColorName.isAcceptableOrUnknown(
              data['icon_color_name']!, _iconColorNameMeta));
    } else if (isInserting) {
      context.missing(_iconColorNameMeta);
    }
    context.handle(_typeMeta, const VerificationResult.success());
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TCategory map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TCategory(
      id: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      categoryId: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}category_id']),
      name: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      iconName: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}icon_name'])!,
      iconColorName: attachedDatabase.options.types.read(
          DriftSqlType.string, data['${effectivePrefix}icon_color_name'])!,
      type: $TCategoriesTable.$converter0.fromSql(attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}type'])!),
      createdAt: attachedDatabase.options.types
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.options.types
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      deletedAt: attachedDatabase.options.types
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
    );
  }

  @override
  $TCategoriesTable createAlias(String alias) {
    return $TCategoriesTable(attachedDatabase, alias);
  }

  static TypeConverter<TransactionType, int> $converter0 =
      const EnumIndexConverter<TransactionType>(TransactionType.values);
}

class TAccountGroup extends DataClass implements Insertable<TAccountGroup> {
  final int id;
  final String name;
  final bool origin;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  const TAccountGroup(
      {required this.id,
      required this.name,
      required this.origin,
      required this.createdAt,
      required this.updatedAt,
      this.deletedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['origin'] = Variable<bool>(origin);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    return map;
  }

  TAccountGroupsCompanion toCompanion(bool nullToAbsent) {
    return TAccountGroupsCompanion(
      id: Value(id),
      name: Value(name),
      origin: Value(origin),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory TAccountGroup.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TAccountGroup(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      origin: serializer.fromJson<bool>(json['origin']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'origin': serializer.toJson<bool>(origin),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
    };
  }

  TAccountGroup copyWith(
          {int? id,
          String? name,
          bool? origin,
          DateTime? createdAt,
          DateTime? updatedAt,
          Value<DateTime?> deletedAt = const Value.absent()}) =>
      TAccountGroup(
        id: id ?? this.id,
        name: name ?? this.name,
        origin: origin ?? this.origin,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
      );
  @override
  String toString() {
    return (StringBuffer('TAccountGroup(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('origin: $origin, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, origin, createdAt, updatedAt, deletedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TAccountGroup &&
          other.id == this.id &&
          other.name == this.name &&
          other.origin == this.origin &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt);
}

class TAccountGroupsCompanion extends UpdateCompanion<TAccountGroup> {
  final Value<int> id;
  final Value<String> name;
  final Value<bool> origin;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  const TAccountGroupsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.origin = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
  });
  TAccountGroupsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.origin = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
  }) : name = Value(name);
  static Insertable<TAccountGroup> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<bool>? origin,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (origin != null) 'origin': origin,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
    });
  }

  TAccountGroupsCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<bool>? origin,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<DateTime?>? deletedAt}) {
    return TAccountGroupsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      origin: origin ?? this.origin,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (origin.present) {
      map['origin'] = Variable<bool>(origin.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TAccountGroupsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('origin: $origin, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }
}

class $TAccountGroupsTable extends TAccountGroups
    with TableInfo<$TAccountGroupsTable, TAccountGroup> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TAccountGroupsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _originMeta = const VerificationMeta('origin');
  @override
  late final GeneratedColumn<bool> origin = GeneratedColumn<bool>(
      'origin', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (origin IN (0, 1))',
      defaultValue: const Constant(false));
  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  final VerificationMeta _updatedAtMeta = const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  final VerificationMeta _deletedAtMeta = const VerificationMeta('deletedAt');
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, origin, createdAt, updatedAt, deletedAt];
  @override
  String get aliasedName => _alias ?? 't_account_groups';
  @override
  String get actualTableName => 't_account_groups';
  @override
  VerificationContext validateIntegrity(Insertable<TAccountGroup> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('origin')) {
      context.handle(_originMeta,
          origin.isAcceptableOrUnknown(data['origin']!, _originMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TAccountGroup map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TAccountGroup(
      id: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      origin: attachedDatabase.options.types
          .read(DriftSqlType.bool, data['${effectivePrefix}origin'])!,
      createdAt: attachedDatabase.options.types
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.options.types
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      deletedAt: attachedDatabase.options.types
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
    );
  }

  @override
  $TAccountGroupsTable createAlias(String alias) {
    return $TAccountGroupsTable(attachedDatabase, alias);
  }
}

class TAccount extends DataClass implements Insertable<TAccount> {
  final int id;
  final int accountGroupId;
  final String name;
  final String? description;
  final String currency;
  final String? icon;
  final bool origin;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  const TAccount(
      {required this.id,
      required this.accountGroupId,
      required this.name,
      this.description,
      required this.currency,
      this.icon,
      required this.origin,
      required this.createdAt,
      required this.updatedAt,
      this.deletedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['account_group_id'] = Variable<int>(accountGroupId);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['currency'] = Variable<String>(currency);
    if (!nullToAbsent || icon != null) {
      map['icon'] = Variable<String>(icon);
    }
    map['origin'] = Variable<bool>(origin);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    return map;
  }

  TAccountsCompanion toCompanion(bool nullToAbsent) {
    return TAccountsCompanion(
      id: Value(id),
      accountGroupId: Value(accountGroupId),
      name: Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      currency: Value(currency),
      icon: icon == null && nullToAbsent ? const Value.absent() : Value(icon),
      origin: Value(origin),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory TAccount.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TAccount(
      id: serializer.fromJson<int>(json['id']),
      accountGroupId: serializer.fromJson<int>(json['accountGroupId']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
      currency: serializer.fromJson<String>(json['currency']),
      icon: serializer.fromJson<String?>(json['icon']),
      origin: serializer.fromJson<bool>(json['origin']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'accountGroupId': serializer.toJson<int>(accountGroupId),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
      'currency': serializer.toJson<String>(currency),
      'icon': serializer.toJson<String?>(icon),
      'origin': serializer.toJson<bool>(origin),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
    };
  }

  TAccount copyWith(
          {int? id,
          int? accountGroupId,
          String? name,
          Value<String?> description = const Value.absent(),
          String? currency,
          Value<String?> icon = const Value.absent(),
          bool? origin,
          DateTime? createdAt,
          DateTime? updatedAt,
          Value<DateTime?> deletedAt = const Value.absent()}) =>
      TAccount(
        id: id ?? this.id,
        accountGroupId: accountGroupId ?? this.accountGroupId,
        name: name ?? this.name,
        description: description.present ? description.value : this.description,
        currency: currency ?? this.currency,
        icon: icon.present ? icon.value : this.icon,
        origin: origin ?? this.origin,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
      );
  @override
  String toString() {
    return (StringBuffer('TAccount(')
          ..write('id: $id, ')
          ..write('accountGroupId: $accountGroupId, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('currency: $currency, ')
          ..write('icon: $icon, ')
          ..write('origin: $origin, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, accountGroupId, name, description,
      currency, icon, origin, createdAt, updatedAt, deletedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TAccount &&
          other.id == this.id &&
          other.accountGroupId == this.accountGroupId &&
          other.name == this.name &&
          other.description == this.description &&
          other.currency == this.currency &&
          other.icon == this.icon &&
          other.origin == this.origin &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt);
}

class TAccountsCompanion extends UpdateCompanion<TAccount> {
  final Value<int> id;
  final Value<int> accountGroupId;
  final Value<String> name;
  final Value<String?> description;
  final Value<String> currency;
  final Value<String?> icon;
  final Value<bool> origin;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  const TAccountsCompanion({
    this.id = const Value.absent(),
    this.accountGroupId = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.currency = const Value.absent(),
    this.icon = const Value.absent(),
    this.origin = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
  });
  TAccountsCompanion.insert({
    this.id = const Value.absent(),
    required int accountGroupId,
    required String name,
    this.description = const Value.absent(),
    this.currency = const Value.absent(),
    this.icon = const Value.absent(),
    this.origin = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
  })  : accountGroupId = Value(accountGroupId),
        name = Value(name);
  static Insertable<TAccount> custom({
    Expression<int>? id,
    Expression<int>? accountGroupId,
    Expression<String>? name,
    Expression<String>? description,
    Expression<String>? currency,
    Expression<String>? icon,
    Expression<bool>? origin,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (accountGroupId != null) 'account_group_id': accountGroupId,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (currency != null) 'currency': currency,
      if (icon != null) 'icon': icon,
      if (origin != null) 'origin': origin,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
    });
  }

  TAccountsCompanion copyWith(
      {Value<int>? id,
      Value<int>? accountGroupId,
      Value<String>? name,
      Value<String?>? description,
      Value<String>? currency,
      Value<String?>? icon,
      Value<bool>? origin,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<DateTime?>? deletedAt}) {
    return TAccountsCompanion(
      id: id ?? this.id,
      accountGroupId: accountGroupId ?? this.accountGroupId,
      name: name ?? this.name,
      description: description ?? this.description,
      currency: currency ?? this.currency,
      icon: icon ?? this.icon,
      origin: origin ?? this.origin,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (accountGroupId.present) {
      map['account_group_id'] = Variable<int>(accountGroupId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (currency.present) {
      map['currency'] = Variable<String>(currency.value);
    }
    if (icon.present) {
      map['icon'] = Variable<String>(icon.value);
    }
    if (origin.present) {
      map['origin'] = Variable<bool>(origin.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TAccountsCompanion(')
          ..write('id: $id, ')
          ..write('accountGroupId: $accountGroupId, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('currency: $currency, ')
          ..write('icon: $icon, ')
          ..write('origin: $origin, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }
}

class $TAccountsTable extends TAccounts
    with TableInfo<$TAccountsTable, TAccount> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TAccountsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _accountGroupIdMeta =
      const VerificationMeta('accountGroupId');
  @override
  late final GeneratedColumn<int> accountGroupId = GeneratedColumn<int>(
      'account_group_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: 'REFERENCES t_account_groups (id)');
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  final VerificationMeta _currencyMeta = const VerificationMeta('currency');
  @override
  late final GeneratedColumn<String> currency = GeneratedColumn<String>(
      'currency', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('USD'));
  final VerificationMeta _iconMeta = const VerificationMeta('icon');
  @override
  late final GeneratedColumn<String> icon = GeneratedColumn<String>(
      'icon', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  final VerificationMeta _originMeta = const VerificationMeta('origin');
  @override
  late final GeneratedColumn<bool> origin = GeneratedColumn<bool>(
      'origin', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (origin IN (0, 1))',
      defaultValue: const Constant(false));
  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  final VerificationMeta _updatedAtMeta = const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  final VerificationMeta _deletedAtMeta = const VerificationMeta('deletedAt');
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        accountGroupId,
        name,
        description,
        currency,
        icon,
        origin,
        createdAt,
        updatedAt,
        deletedAt
      ];
  @override
  String get aliasedName => _alias ?? 't_accounts';
  @override
  String get actualTableName => 't_accounts';
  @override
  VerificationContext validateIntegrity(Insertable<TAccount> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('account_group_id')) {
      context.handle(
          _accountGroupIdMeta,
          accountGroupId.isAcceptableOrUnknown(
              data['account_group_id']!, _accountGroupIdMeta));
    } else if (isInserting) {
      context.missing(_accountGroupIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('currency')) {
      context.handle(_currencyMeta,
          currency.isAcceptableOrUnknown(data['currency']!, _currencyMeta));
    }
    if (data.containsKey('icon')) {
      context.handle(
          _iconMeta, icon.isAcceptableOrUnknown(data['icon']!, _iconMeta));
    }
    if (data.containsKey('origin')) {
      context.handle(_originMeta,
          origin.isAcceptableOrUnknown(data['origin']!, _originMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TAccount map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TAccount(
      id: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      accountGroupId: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}account_group_id'])!,
      name: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      description: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      currency: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}currency'])!,
      icon: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}icon']),
      origin: attachedDatabase.options.types
          .read(DriftSqlType.bool, data['${effectivePrefix}origin'])!,
      createdAt: attachedDatabase.options.types
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.options.types
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      deletedAt: attachedDatabase.options.types
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
    );
  }

  @override
  $TAccountsTable createAlias(String alias) {
    return $TAccountsTable(attachedDatabase, alias);
  }
}

class TTransaction extends DataClass implements Insertable<TTransaction> {
  final int id;
  final int categoryId;
  final TransactionType type;
  final int from;
  final int? to;
  final double amount;
  final String? note;
  final String? description;
  final DateTime date;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  const TTransaction(
      {required this.id,
      required this.categoryId,
      required this.type,
      required this.from,
      this.to,
      required this.amount,
      this.note,
      this.description,
      required this.date,
      required this.createdAt,
      required this.updatedAt,
      this.deletedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['category_id'] = Variable<int>(categoryId);
    {
      final converter = $TTransactionsTable.$converter0;
      map['type'] = Variable<int>(converter.toSql(type));
    }
    map['from'] = Variable<int>(from);
    if (!nullToAbsent || to != null) {
      map['to'] = Variable<int>(to);
    }
    map['amount'] = Variable<double>(amount);
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['date'] = Variable<DateTime>(date);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    return map;
  }

  TTransactionsCompanion toCompanion(bool nullToAbsent) {
    return TTransactionsCompanion(
      id: Value(id),
      categoryId: Value(categoryId),
      type: Value(type),
      from: Value(from),
      to: to == null && nullToAbsent ? const Value.absent() : Value(to),
      amount: Value(amount),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      date: Value(date),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory TTransaction.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TTransaction(
      id: serializer.fromJson<int>(json['id']),
      categoryId: serializer.fromJson<int>(json['categoryId']),
      type: serializer.fromJson<TransactionType>(json['type']),
      from: serializer.fromJson<int>(json['from']),
      to: serializer.fromJson<int?>(json['to']),
      amount: serializer.fromJson<double>(json['amount']),
      note: serializer.fromJson<String?>(json['note']),
      description: serializer.fromJson<String?>(json['description']),
      date: serializer.fromJson<DateTime>(json['date']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'categoryId': serializer.toJson<int>(categoryId),
      'type': serializer.toJson<TransactionType>(type),
      'from': serializer.toJson<int>(from),
      'to': serializer.toJson<int?>(to),
      'amount': serializer.toJson<double>(amount),
      'note': serializer.toJson<String?>(note),
      'description': serializer.toJson<String?>(description),
      'date': serializer.toJson<DateTime>(date),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
    };
  }

  TTransaction copyWith(
          {int? id,
          int? categoryId,
          TransactionType? type,
          int? from,
          Value<int?> to = const Value.absent(),
          double? amount,
          Value<String?> note = const Value.absent(),
          Value<String?> description = const Value.absent(),
          DateTime? date,
          DateTime? createdAt,
          DateTime? updatedAt,
          Value<DateTime?> deletedAt = const Value.absent()}) =>
      TTransaction(
        id: id ?? this.id,
        categoryId: categoryId ?? this.categoryId,
        type: type ?? this.type,
        from: from ?? this.from,
        to: to.present ? to.value : this.to,
        amount: amount ?? this.amount,
        note: note.present ? note.value : this.note,
        description: description.present ? description.value : this.description,
        date: date ?? this.date,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
      );
  @override
  String toString() {
    return (StringBuffer('TTransaction(')
          ..write('id: $id, ')
          ..write('categoryId: $categoryId, ')
          ..write('type: $type, ')
          ..write('from: $from, ')
          ..write('to: $to, ')
          ..write('amount: $amount, ')
          ..write('note: $note, ')
          ..write('description: $description, ')
          ..write('date: $date, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, categoryId, type, from, to, amount, note,
      description, date, createdAt, updatedAt, deletedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TTransaction &&
          other.id == this.id &&
          other.categoryId == this.categoryId &&
          other.type == this.type &&
          other.from == this.from &&
          other.to == this.to &&
          other.amount == this.amount &&
          other.note == this.note &&
          other.description == this.description &&
          other.date == this.date &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt);
}

class TTransactionsCompanion extends UpdateCompanion<TTransaction> {
  final Value<int> id;
  final Value<int> categoryId;
  final Value<TransactionType> type;
  final Value<int> from;
  final Value<int?> to;
  final Value<double> amount;
  final Value<String?> note;
  final Value<String?> description;
  final Value<DateTime> date;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  const TTransactionsCompanion({
    this.id = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.type = const Value.absent(),
    this.from = const Value.absent(),
    this.to = const Value.absent(),
    this.amount = const Value.absent(),
    this.note = const Value.absent(),
    this.description = const Value.absent(),
    this.date = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
  });
  TTransactionsCompanion.insert({
    this.id = const Value.absent(),
    required int categoryId,
    required TransactionType type,
    required int from,
    this.to = const Value.absent(),
    required double amount,
    this.note = const Value.absent(),
    this.description = const Value.absent(),
    required DateTime date,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
  })  : categoryId = Value(categoryId),
        type = Value(type),
        from = Value(from),
        amount = Value(amount),
        date = Value(date);
  static Insertable<TTransaction> custom({
    Expression<int>? id,
    Expression<int>? categoryId,
    Expression<int>? type,
    Expression<int>? from,
    Expression<int>? to,
    Expression<double>? amount,
    Expression<String>? note,
    Expression<String>? description,
    Expression<DateTime>? date,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (categoryId != null) 'category_id': categoryId,
      if (type != null) 'type': type,
      if (from != null) 'from': from,
      if (to != null) 'to': to,
      if (amount != null) 'amount': amount,
      if (note != null) 'note': note,
      if (description != null) 'description': description,
      if (date != null) 'date': date,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
    });
  }

  TTransactionsCompanion copyWith(
      {Value<int>? id,
      Value<int>? categoryId,
      Value<TransactionType>? type,
      Value<int>? from,
      Value<int?>? to,
      Value<double>? amount,
      Value<String?>? note,
      Value<String?>? description,
      Value<DateTime>? date,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<DateTime?>? deletedAt}) {
    return TTransactionsCompanion(
      id: id ?? this.id,
      categoryId: categoryId ?? this.categoryId,
      type: type ?? this.type,
      from: from ?? this.from,
      to: to ?? this.to,
      amount: amount ?? this.amount,
      note: note ?? this.note,
      description: description ?? this.description,
      date: date ?? this.date,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<int>(categoryId.value);
    }
    if (type.present) {
      final converter = $TTransactionsTable.$converter0;
      map['type'] = Variable<int>(converter.toSql(type.value));
    }
    if (from.present) {
      map['from'] = Variable<int>(from.value);
    }
    if (to.present) {
      map['to'] = Variable<int>(to.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TTransactionsCompanion(')
          ..write('id: $id, ')
          ..write('categoryId: $categoryId, ')
          ..write('type: $type, ')
          ..write('from: $from, ')
          ..write('to: $to, ')
          ..write('amount: $amount, ')
          ..write('note: $note, ')
          ..write('description: $description, ')
          ..write('date: $date, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }
}

class $TTransactionsTable extends TTransactions
    with TableInfo<$TTransactionsTable, TTransaction> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TTransactionsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _categoryIdMeta = const VerificationMeta('categoryId');
  @override
  late final GeneratedColumn<int> categoryId = GeneratedColumn<int>(
      'category_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  final VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumnWithTypeConverter<TransactionType, int> type =
      GeneratedColumn<int>('type', aliasedName, false,
              type: DriftSqlType.int, requiredDuringInsert: true)
          .withConverter<TransactionType>($TTransactionsTable.$converter0);
  final VerificationMeta _fromMeta = const VerificationMeta('from');
  @override
  late final GeneratedColumn<int> from = GeneratedColumn<int>(
      'from', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  final VerificationMeta _toMeta = const VerificationMeta('to');
  @override
  late final GeneratedColumn<int> to = GeneratedColumn<int>(
      'to', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  final VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
      'amount', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  final VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
      'note', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  final VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  final VerificationMeta _updatedAtMeta = const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  final VerificationMeta _deletedAtMeta = const VerificationMeta('deletedAt');
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        categoryId,
        type,
        from,
        to,
        amount,
        note,
        description,
        date,
        createdAt,
        updatedAt,
        deletedAt
      ];
  @override
  String get aliasedName => _alias ?? 't_transactions';
  @override
  String get actualTableName => 't_transactions';
  @override
  VerificationContext validateIntegrity(Insertable<TTransaction> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('category_id')) {
      context.handle(
          _categoryIdMeta,
          categoryId.isAcceptableOrUnknown(
              data['category_id']!, _categoryIdMeta));
    } else if (isInserting) {
      context.missing(_categoryIdMeta);
    }
    context.handle(_typeMeta, const VerificationResult.success());
    if (data.containsKey('from')) {
      context.handle(
          _fromMeta, from.isAcceptableOrUnknown(data['from']!, _fromMeta));
    } else if (isInserting) {
      context.missing(_fromMeta);
    }
    if (data.containsKey('to')) {
      context.handle(_toMeta, to.isAcceptableOrUnknown(data['to']!, _toMeta));
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('note')) {
      context.handle(
          _noteMeta, note.isAcceptableOrUnknown(data['note']!, _noteMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TTransaction map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TTransaction(
      id: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      categoryId: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}category_id'])!,
      type: $TTransactionsTable.$converter0.fromSql(attachedDatabase
          .options.types
          .read(DriftSqlType.int, data['${effectivePrefix}type'])!),
      from: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}from'])!,
      to: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}to']),
      amount: attachedDatabase.options.types
          .read(DriftSqlType.double, data['${effectivePrefix}amount'])!,
      note: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}note']),
      description: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      date: attachedDatabase.options.types
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      createdAt: attachedDatabase.options.types
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.options.types
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      deletedAt: attachedDatabase.options.types
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
    );
  }

  @override
  $TTransactionsTable createAlias(String alias) {
    return $TTransactionsTable(attachedDatabase, alias);
  }

  static TypeConverter<TransactionType, int> $converter0 =
      const EnumIndexConverter<TransactionType>(TransactionType.values);
}

class TBudget extends DataClass implements Insertable<TBudget> {
  final int id;
  final int categoryId;
  final int amount;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  const TBudget(
      {required this.id,
      required this.categoryId,
      required this.amount,
      required this.createdAt,
      required this.updatedAt,
      this.deletedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['category_id'] = Variable<int>(categoryId);
    map['amount'] = Variable<int>(amount);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    return map;
  }

  TBudgetsCompanion toCompanion(bool nullToAbsent) {
    return TBudgetsCompanion(
      id: Value(id),
      categoryId: Value(categoryId),
      amount: Value(amount),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory TBudget.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TBudget(
      id: serializer.fromJson<int>(json['id']),
      categoryId: serializer.fromJson<int>(json['categoryId']),
      amount: serializer.fromJson<int>(json['amount']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'categoryId': serializer.toJson<int>(categoryId),
      'amount': serializer.toJson<int>(amount),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
    };
  }

  TBudget copyWith(
          {int? id,
          int? categoryId,
          int? amount,
          DateTime? createdAt,
          DateTime? updatedAt,
          Value<DateTime?> deletedAt = const Value.absent()}) =>
      TBudget(
        id: id ?? this.id,
        categoryId: categoryId ?? this.categoryId,
        amount: amount ?? this.amount,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
      );
  @override
  String toString() {
    return (StringBuffer('TBudget(')
          ..write('id: $id, ')
          ..write('categoryId: $categoryId, ')
          ..write('amount: $amount, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, categoryId, amount, createdAt, updatedAt, deletedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TBudget &&
          other.id == this.id &&
          other.categoryId == this.categoryId &&
          other.amount == this.amount &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt);
}

class TBudgetsCompanion extends UpdateCompanion<TBudget> {
  final Value<int> id;
  final Value<int> categoryId;
  final Value<int> amount;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  const TBudgetsCompanion({
    this.id = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.amount = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
  });
  TBudgetsCompanion.insert({
    this.id = const Value.absent(),
    required int categoryId,
    required int amount,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
  })  : categoryId = Value(categoryId),
        amount = Value(amount);
  static Insertable<TBudget> custom({
    Expression<int>? id,
    Expression<int>? categoryId,
    Expression<int>? amount,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (categoryId != null) 'category_id': categoryId,
      if (amount != null) 'amount': amount,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
    });
  }

  TBudgetsCompanion copyWith(
      {Value<int>? id,
      Value<int>? categoryId,
      Value<int>? amount,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<DateTime?>? deletedAt}) {
    return TBudgetsCompanion(
      id: id ?? this.id,
      categoryId: categoryId ?? this.categoryId,
      amount: amount ?? this.amount,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<int>(categoryId.value);
    }
    if (amount.present) {
      map['amount'] = Variable<int>(amount.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TBudgetsCompanion(')
          ..write('id: $id, ')
          ..write('categoryId: $categoryId, ')
          ..write('amount: $amount, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }
}

class $TBudgetsTable extends TBudgets with TableInfo<$TBudgetsTable, TBudget> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TBudgetsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _categoryIdMeta = const VerificationMeta('categoryId');
  @override
  late final GeneratedColumn<int> categoryId = GeneratedColumn<int>(
      'category_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  final VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<int> amount = GeneratedColumn<int>(
      'amount', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  final VerificationMeta _updatedAtMeta = const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  final VerificationMeta _deletedAtMeta = const VerificationMeta('deletedAt');
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, categoryId, amount, createdAt, updatedAt, deletedAt];
  @override
  String get aliasedName => _alias ?? 't_budgets';
  @override
  String get actualTableName => 't_budgets';
  @override
  VerificationContext validateIntegrity(Insertable<TBudget> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('category_id')) {
      context.handle(
          _categoryIdMeta,
          categoryId.isAcceptableOrUnknown(
              data['category_id']!, _categoryIdMeta));
    } else if (isInserting) {
      context.missing(_categoryIdMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TBudget map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TBudget(
      id: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      categoryId: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}category_id'])!,
      amount: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}amount'])!,
      createdAt: attachedDatabase.options.types
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.options.types
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      deletedAt: attachedDatabase.options.types
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
    );
  }

  @override
  $TBudgetsTable createAlias(String alias) {
    return $TBudgetsTable(attachedDatabase, alias);
  }
}

class TDataCurrency extends DataClass implements Insertable<TDataCurrency> {
  final String code;
  final String name;
  final String symbol;
  final String symbolNative;
  final int decimalDigits;
  final double rounding;
  const TDataCurrency(
      {required this.code,
      required this.name,
      required this.symbol,
      required this.symbolNative,
      required this.decimalDigits,
      required this.rounding});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['code'] = Variable<String>(code);
    map['name'] = Variable<String>(name);
    map['symbol'] = Variable<String>(symbol);
    map['symbol_native'] = Variable<String>(symbolNative);
    map['decimal_digits'] = Variable<int>(decimalDigits);
    map['rounding'] = Variable<double>(rounding);
    return map;
  }

  TDataCurrenciesCompanion toCompanion(bool nullToAbsent) {
    return TDataCurrenciesCompanion(
      code: Value(code),
      name: Value(name),
      symbol: Value(symbol),
      symbolNative: Value(symbolNative),
      decimalDigits: Value(decimalDigits),
      rounding: Value(rounding),
    );
  }

  factory TDataCurrency.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TDataCurrency(
      code: serializer.fromJson<String>(json['code']),
      name: serializer.fromJson<String>(json['name']),
      symbol: serializer.fromJson<String>(json['symbol']),
      symbolNative: serializer.fromJson<String>(json['symbol_native']),
      decimalDigits: serializer.fromJson<int>(json['decimal_digits']),
      rounding: serializer.fromJson<double>(json['rounding']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'code': serializer.toJson<String>(code),
      'name': serializer.toJson<String>(name),
      'symbol': serializer.toJson<String>(symbol),
      'symbol_native': serializer.toJson<String>(symbolNative),
      'decimal_digits': serializer.toJson<int>(decimalDigits),
      'rounding': serializer.toJson<double>(rounding),
    };
  }

  TDataCurrency copyWith(
          {String? code,
          String? name,
          String? symbol,
          String? symbolNative,
          int? decimalDigits,
          double? rounding}) =>
      TDataCurrency(
        code: code ?? this.code,
        name: name ?? this.name,
        symbol: symbol ?? this.symbol,
        symbolNative: symbolNative ?? this.symbolNative,
        decimalDigits: decimalDigits ?? this.decimalDigits,
        rounding: rounding ?? this.rounding,
      );
  @override
  String toString() {
    return (StringBuffer('TDataCurrency(')
          ..write('code: $code, ')
          ..write('name: $name, ')
          ..write('symbol: $symbol, ')
          ..write('symbolNative: $symbolNative, ')
          ..write('decimalDigits: $decimalDigits, ')
          ..write('rounding: $rounding')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(code, name, symbol, symbolNative, decimalDigits, rounding);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TDataCurrency &&
          other.code == this.code &&
          other.name == this.name &&
          other.symbol == this.symbol &&
          other.symbolNative == this.symbolNative &&
          other.decimalDigits == this.decimalDigits &&
          other.rounding == this.rounding);
}

class TDataCurrenciesCompanion extends UpdateCompanion<TDataCurrency> {
  final Value<String> code;
  final Value<String> name;
  final Value<String> symbol;
  final Value<String> symbolNative;
  final Value<int> decimalDigits;
  final Value<double> rounding;
  const TDataCurrenciesCompanion({
    this.code = const Value.absent(),
    this.name = const Value.absent(),
    this.symbol = const Value.absent(),
    this.symbolNative = const Value.absent(),
    this.decimalDigits = const Value.absent(),
    this.rounding = const Value.absent(),
  });
  TDataCurrenciesCompanion.insert({
    required String code,
    required String name,
    required String symbol,
    required String symbolNative,
    required int decimalDigits,
    required double rounding,
  })  : code = Value(code),
        name = Value(name),
        symbol = Value(symbol),
        symbolNative = Value(symbolNative),
        decimalDigits = Value(decimalDigits),
        rounding = Value(rounding);
  static Insertable<TDataCurrency> custom({
    Expression<String>? code,
    Expression<String>? name,
    Expression<String>? symbol,
    Expression<String>? symbolNative,
    Expression<int>? decimalDigits,
    Expression<double>? rounding,
  }) {
    return RawValuesInsertable({
      if (code != null) 'code': code,
      if (name != null) 'name': name,
      if (symbol != null) 'symbol': symbol,
      if (symbolNative != null) 'symbol_native': symbolNative,
      if (decimalDigits != null) 'decimal_digits': decimalDigits,
      if (rounding != null) 'rounding': rounding,
    });
  }

  TDataCurrenciesCompanion copyWith(
      {Value<String>? code,
      Value<String>? name,
      Value<String>? symbol,
      Value<String>? symbolNative,
      Value<int>? decimalDigits,
      Value<double>? rounding}) {
    return TDataCurrenciesCompanion(
      code: code ?? this.code,
      name: name ?? this.name,
      symbol: symbol ?? this.symbol,
      symbolNative: symbolNative ?? this.symbolNative,
      decimalDigits: decimalDigits ?? this.decimalDigits,
      rounding: rounding ?? this.rounding,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (symbol.present) {
      map['symbol'] = Variable<String>(symbol.value);
    }
    if (symbolNative.present) {
      map['symbol_native'] = Variable<String>(symbolNative.value);
    }
    if (decimalDigits.present) {
      map['decimal_digits'] = Variable<int>(decimalDigits.value);
    }
    if (rounding.present) {
      map['rounding'] = Variable<double>(rounding.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TDataCurrenciesCompanion(')
          ..write('code: $code, ')
          ..write('name: $name, ')
          ..write('symbol: $symbol, ')
          ..write('symbolNative: $symbolNative, ')
          ..write('decimalDigits: $decimalDigits, ')
          ..write('rounding: $rounding')
          ..write(')'))
        .toString();
  }
}

class $TDataCurrenciesTable extends TDataCurrencies
    with TableInfo<$TDataCurrenciesTable, TDataCurrency> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TDataCurrenciesTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
      'code', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _symbolMeta = const VerificationMeta('symbol');
  @override
  late final GeneratedColumn<String> symbol = GeneratedColumn<String>(
      'symbol', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _symbolNativeMeta =
      const VerificationMeta('symbolNative');
  @override
  late final GeneratedColumn<String> symbolNative = GeneratedColumn<String>(
      'symbol_native', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _decimalDigitsMeta =
      const VerificationMeta('decimalDigits');
  @override
  late final GeneratedColumn<int> decimalDigits = GeneratedColumn<int>(
      'decimal_digits', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  final VerificationMeta _roundingMeta = const VerificationMeta('rounding');
  @override
  late final GeneratedColumn<double> rounding = GeneratedColumn<double>(
      'rounding', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [code, name, symbol, symbolNative, decimalDigits, rounding];
  @override
  String get aliasedName => _alias ?? 't_data_currencies';
  @override
  String get actualTableName => 't_data_currencies';
  @override
  VerificationContext validateIntegrity(Insertable<TDataCurrency> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('code')) {
      context.handle(
          _codeMeta, code.isAcceptableOrUnknown(data['code']!, _codeMeta));
    } else if (isInserting) {
      context.missing(_codeMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('symbol')) {
      context.handle(_symbolMeta,
          symbol.isAcceptableOrUnknown(data['symbol']!, _symbolMeta));
    } else if (isInserting) {
      context.missing(_symbolMeta);
    }
    if (data.containsKey('symbol_native')) {
      context.handle(
          _symbolNativeMeta,
          symbolNative.isAcceptableOrUnknown(
              data['symbol_native']!, _symbolNativeMeta));
    } else if (isInserting) {
      context.missing(_symbolNativeMeta);
    }
    if (data.containsKey('decimal_digits')) {
      context.handle(
          _decimalDigitsMeta,
          decimalDigits.isAcceptableOrUnknown(
              data['decimal_digits']!, _decimalDigitsMeta));
    } else if (isInserting) {
      context.missing(_decimalDigitsMeta);
    }
    if (data.containsKey('rounding')) {
      context.handle(_roundingMeta,
          rounding.isAcceptableOrUnknown(data['rounding']!, _roundingMeta));
    } else if (isInserting) {
      context.missing(_roundingMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {code};
  @override
  TDataCurrency map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TDataCurrency(
      code: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}code'])!,
      name: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      symbol: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}symbol'])!,
      symbolNative: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}symbol_native'])!,
      decimalDigits: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}decimal_digits'])!,
      rounding: attachedDatabase.options.types
          .read(DriftSqlType.double, data['${effectivePrefix}rounding'])!,
    );
  }

  @override
  $TDataCurrenciesTable createAlias(String alias) {
    return $TDataCurrenciesTable(attachedDatabase, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $TCategoriesTable tCategories = $TCategoriesTable(this);
  late final $TAccountGroupsTable tAccountGroups = $TAccountGroupsTable(this);
  late final $TAccountsTable tAccounts = $TAccountsTable(this);
  late final $TTransactionsTable tTransactions = $TTransactionsTable(this);
  late final $TBudgetsTable tBudgets = $TBudgetsTable(this);
  late final $TDataCurrenciesTable tDataCurrencies =
      $TDataCurrenciesTable(this);
  late final TransactionsDao transactionsDao =
      TransactionsDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, dynamic>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        tCategories,
        tAccountGroups,
        tAccounts,
        tTransactions,
        tBudgets,
        tDataCurrencies
      ];
}
