// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $ExpenseItemTable extends ExpenseItem
    with TableInfo<$ExpenseItemTable, ExpenseItemData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ExpenseItemTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _sumMeta = const VerificationMeta('sum');
  @override
  late final GeneratedColumn<int> sum = GeneratedColumn<int>(
    'sum',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
    'category',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isUnnecessaryMeta = const VerificationMeta(
    'isUnnecessary',
  );
  @override
  late final GeneratedColumn<bool> isUnnecessary = GeneratedColumn<bool>(
    'is_unnecessary',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_unnecessary" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _commentMeta = const VerificationMeta(
    'comment',
  );
  @override
  late final GeneratedColumn<String> comment = GeneratedColumn<String>(
    'comment',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    sum,
    category,
    isUnnecessary,
    comment,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'expense_item';
  @override
  VerificationContext validateIntegrity(
    Insertable<ExpenseItemData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('sum')) {
      context.handle(
        _sumMeta,
        sum.isAcceptableOrUnknown(data['sum']!, _sumMeta),
      );
    } else if (isInserting) {
      context.missing(_sumMeta);
    }
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    }
    if (data.containsKey('is_unnecessary')) {
      context.handle(
        _isUnnecessaryMeta,
        isUnnecessary.isAcceptableOrUnknown(
          data['is_unnecessary']!,
          _isUnnecessaryMeta,
        ),
      );
    }
    if (data.containsKey('comment')) {
      context.handle(
        _commentMeta,
        comment.isAcceptableOrUnknown(data['comment']!, _commentMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ExpenseItemData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ExpenseItemData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      sum: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sum'],
      )!,
      category: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category'],
      ),
      isUnnecessary: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_unnecessary'],
      )!,
      comment: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}comment'],
      ),
    );
  }

  @override
  $ExpenseItemTable createAlias(String alias) {
    return $ExpenseItemTable(attachedDatabase, alias);
  }
}

class ExpenseItemData extends DataClass implements Insertable<ExpenseItemData> {
  final int id;
  final int sum;
  final String? category;
  final bool isUnnecessary;
  final String? comment;
  const ExpenseItemData({
    required this.id,
    required this.sum,
    this.category,
    required this.isUnnecessary,
    this.comment,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['sum'] = Variable<int>(sum);
    if (!nullToAbsent || category != null) {
      map['category'] = Variable<String>(category);
    }
    map['is_unnecessary'] = Variable<bool>(isUnnecessary);
    if (!nullToAbsent || comment != null) {
      map['comment'] = Variable<String>(comment);
    }
    return map;
  }

  ExpenseItemCompanion toCompanion(bool nullToAbsent) {
    return ExpenseItemCompanion(
      id: Value(id),
      sum: Value(sum),
      category: category == null && nullToAbsent
          ? const Value.absent()
          : Value(category),
      isUnnecessary: Value(isUnnecessary),
      comment: comment == null && nullToAbsent
          ? const Value.absent()
          : Value(comment),
    );
  }

  factory ExpenseItemData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ExpenseItemData(
      id: serializer.fromJson<int>(json['id']),
      sum: serializer.fromJson<int>(json['sum']),
      category: serializer.fromJson<String?>(json['category']),
      isUnnecessary: serializer.fromJson<bool>(json['isUnnecessary']),
      comment: serializer.fromJson<String?>(json['comment']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'sum': serializer.toJson<int>(sum),
      'category': serializer.toJson<String?>(category),
      'isUnnecessary': serializer.toJson<bool>(isUnnecessary),
      'comment': serializer.toJson<String?>(comment),
    };
  }

  ExpenseItemData copyWith({
    int? id,
    int? sum,
    Value<String?> category = const Value.absent(),
    bool? isUnnecessary,
    Value<String?> comment = const Value.absent(),
  }) => ExpenseItemData(
    id: id ?? this.id,
    sum: sum ?? this.sum,
    category: category.present ? category.value : this.category,
    isUnnecessary: isUnnecessary ?? this.isUnnecessary,
    comment: comment.present ? comment.value : this.comment,
  );
  ExpenseItemData copyWithCompanion(ExpenseItemCompanion data) {
    return ExpenseItemData(
      id: data.id.present ? data.id.value : this.id,
      sum: data.sum.present ? data.sum.value : this.sum,
      category: data.category.present ? data.category.value : this.category,
      isUnnecessary: data.isUnnecessary.present
          ? data.isUnnecessary.value
          : this.isUnnecessary,
      comment: data.comment.present ? data.comment.value : this.comment,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ExpenseItemData(')
          ..write('id: $id, ')
          ..write('sum: $sum, ')
          ..write('category: $category, ')
          ..write('isUnnecessary: $isUnnecessary, ')
          ..write('comment: $comment')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, sum, category, isUnnecessary, comment);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ExpenseItemData &&
          other.id == this.id &&
          other.sum == this.sum &&
          other.category == this.category &&
          other.isUnnecessary == this.isUnnecessary &&
          other.comment == this.comment);
}

class ExpenseItemCompanion extends UpdateCompanion<ExpenseItemData> {
  final Value<int> id;
  final Value<int> sum;
  final Value<String?> category;
  final Value<bool> isUnnecessary;
  final Value<String?> comment;
  const ExpenseItemCompanion({
    this.id = const Value.absent(),
    this.sum = const Value.absent(),
    this.category = const Value.absent(),
    this.isUnnecessary = const Value.absent(),
    this.comment = const Value.absent(),
  });
  ExpenseItemCompanion.insert({
    this.id = const Value.absent(),
    required int sum,
    this.category = const Value.absent(),
    this.isUnnecessary = const Value.absent(),
    this.comment = const Value.absent(),
  }) : sum = Value(sum);
  static Insertable<ExpenseItemData> custom({
    Expression<int>? id,
    Expression<int>? sum,
    Expression<String>? category,
    Expression<bool>? isUnnecessary,
    Expression<String>? comment,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (sum != null) 'sum': sum,
      if (category != null) 'category': category,
      if (isUnnecessary != null) 'is_unnecessary': isUnnecessary,
      if (comment != null) 'comment': comment,
    });
  }

  ExpenseItemCompanion copyWith({
    Value<int>? id,
    Value<int>? sum,
    Value<String?>? category,
    Value<bool>? isUnnecessary,
    Value<String?>? comment,
  }) {
    return ExpenseItemCompanion(
      id: id ?? this.id,
      sum: sum ?? this.sum,
      category: category ?? this.category,
      isUnnecessary: isUnnecessary ?? this.isUnnecessary,
      comment: comment ?? this.comment,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (sum.present) {
      map['sum'] = Variable<int>(sum.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (isUnnecessary.present) {
      map['is_unnecessary'] = Variable<bool>(isUnnecessary.value);
    }
    if (comment.present) {
      map['comment'] = Variable<String>(comment.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExpenseItemCompanion(')
          ..write('id: $id, ')
          ..write('sum: $sum, ')
          ..write('category: $category, ')
          ..write('isUnnecessary: $isUnnecessary, ')
          ..write('comment: $comment')
          ..write(')'))
        .toString();
  }
}

class $IncomeItemTable extends IncomeItem
    with TableInfo<$IncomeItemTable, IncomeItemData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $IncomeItemTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _sumMeta = const VerificationMeta('sum');
  @override
  late final GeneratedColumn<int> sum = GeneratedColumn<int>(
    'sum',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
    'category',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _incomeSourceMeta = const VerificationMeta(
    'incomeSource',
  );
  @override
  late final GeneratedColumn<String> incomeSource = GeneratedColumn<String>(
    'income_source',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _commentMeta = const VerificationMeta(
    'comment',
  );
  @override
  late final GeneratedColumn<String> comment = GeneratedColumn<String>(
    'comment',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    sum,
    category,
    incomeSource,
    comment,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'income_item';
  @override
  VerificationContext validateIntegrity(
    Insertable<IncomeItemData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('sum')) {
      context.handle(
        _sumMeta,
        sum.isAcceptableOrUnknown(data['sum']!, _sumMeta),
      );
    } else if (isInserting) {
      context.missing(_sumMeta);
    }
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    }
    if (data.containsKey('income_source')) {
      context.handle(
        _incomeSourceMeta,
        incomeSource.isAcceptableOrUnknown(
          data['income_source']!,
          _incomeSourceMeta,
        ),
      );
    }
    if (data.containsKey('comment')) {
      context.handle(
        _commentMeta,
        comment.isAcceptableOrUnknown(data['comment']!, _commentMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  IncomeItemData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return IncomeItemData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      sum: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sum'],
      )!,
      category: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category'],
      ),
      incomeSource: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}income_source'],
      ),
      comment: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}comment'],
      ),
    );
  }

  @override
  $IncomeItemTable createAlias(String alias) {
    return $IncomeItemTable(attachedDatabase, alias);
  }
}

class IncomeItemData extends DataClass implements Insertable<IncomeItemData> {
  final int id;
  final int sum;
  final String? category;
  final String? incomeSource;
  final String? comment;
  const IncomeItemData({
    required this.id,
    required this.sum,
    this.category,
    this.incomeSource,
    this.comment,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['sum'] = Variable<int>(sum);
    if (!nullToAbsent || category != null) {
      map['category'] = Variable<String>(category);
    }
    if (!nullToAbsent || incomeSource != null) {
      map['income_source'] = Variable<String>(incomeSource);
    }
    if (!nullToAbsent || comment != null) {
      map['comment'] = Variable<String>(comment);
    }
    return map;
  }

  IncomeItemCompanion toCompanion(bool nullToAbsent) {
    return IncomeItemCompanion(
      id: Value(id),
      sum: Value(sum),
      category: category == null && nullToAbsent
          ? const Value.absent()
          : Value(category),
      incomeSource: incomeSource == null && nullToAbsent
          ? const Value.absent()
          : Value(incomeSource),
      comment: comment == null && nullToAbsent
          ? const Value.absent()
          : Value(comment),
    );
  }

  factory IncomeItemData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return IncomeItemData(
      id: serializer.fromJson<int>(json['id']),
      sum: serializer.fromJson<int>(json['sum']),
      category: serializer.fromJson<String?>(json['category']),
      incomeSource: serializer.fromJson<String?>(json['incomeSource']),
      comment: serializer.fromJson<String?>(json['comment']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'sum': serializer.toJson<int>(sum),
      'category': serializer.toJson<String?>(category),
      'incomeSource': serializer.toJson<String?>(incomeSource),
      'comment': serializer.toJson<String?>(comment),
    };
  }

  IncomeItemData copyWith({
    int? id,
    int? sum,
    Value<String?> category = const Value.absent(),
    Value<String?> incomeSource = const Value.absent(),
    Value<String?> comment = const Value.absent(),
  }) => IncomeItemData(
    id: id ?? this.id,
    sum: sum ?? this.sum,
    category: category.present ? category.value : this.category,
    incomeSource: incomeSource.present ? incomeSource.value : this.incomeSource,
    comment: comment.present ? comment.value : this.comment,
  );
  IncomeItemData copyWithCompanion(IncomeItemCompanion data) {
    return IncomeItemData(
      id: data.id.present ? data.id.value : this.id,
      sum: data.sum.present ? data.sum.value : this.sum,
      category: data.category.present ? data.category.value : this.category,
      incomeSource: data.incomeSource.present
          ? data.incomeSource.value
          : this.incomeSource,
      comment: data.comment.present ? data.comment.value : this.comment,
    );
  }

  @override
  String toString() {
    return (StringBuffer('IncomeItemData(')
          ..write('id: $id, ')
          ..write('sum: $sum, ')
          ..write('category: $category, ')
          ..write('incomeSource: $incomeSource, ')
          ..write('comment: $comment')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, sum, category, incomeSource, comment);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is IncomeItemData &&
          other.id == this.id &&
          other.sum == this.sum &&
          other.category == this.category &&
          other.incomeSource == this.incomeSource &&
          other.comment == this.comment);
}

class IncomeItemCompanion extends UpdateCompanion<IncomeItemData> {
  final Value<int> id;
  final Value<int> sum;
  final Value<String?> category;
  final Value<String?> incomeSource;
  final Value<String?> comment;
  const IncomeItemCompanion({
    this.id = const Value.absent(),
    this.sum = const Value.absent(),
    this.category = const Value.absent(),
    this.incomeSource = const Value.absent(),
    this.comment = const Value.absent(),
  });
  IncomeItemCompanion.insert({
    this.id = const Value.absent(),
    required int sum,
    this.category = const Value.absent(),
    this.incomeSource = const Value.absent(),
    this.comment = const Value.absent(),
  }) : sum = Value(sum);
  static Insertable<IncomeItemData> custom({
    Expression<int>? id,
    Expression<int>? sum,
    Expression<String>? category,
    Expression<String>? incomeSource,
    Expression<String>? comment,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (sum != null) 'sum': sum,
      if (category != null) 'category': category,
      if (incomeSource != null) 'income_source': incomeSource,
      if (comment != null) 'comment': comment,
    });
  }

  IncomeItemCompanion copyWith({
    Value<int>? id,
    Value<int>? sum,
    Value<String?>? category,
    Value<String?>? incomeSource,
    Value<String?>? comment,
  }) {
    return IncomeItemCompanion(
      id: id ?? this.id,
      sum: sum ?? this.sum,
      category: category ?? this.category,
      incomeSource: incomeSource ?? this.incomeSource,
      comment: comment ?? this.comment,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (sum.present) {
      map['sum'] = Variable<int>(sum.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (incomeSource.present) {
      map['income_source'] = Variable<String>(incomeSource.value);
    }
    if (comment.present) {
      map['comment'] = Variable<String>(comment.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('IncomeItemCompanion(')
          ..write('id: $id, ')
          ..write('sum: $sum, ')
          ..write('category: $category, ')
          ..write('incomeSource: $incomeSource, ')
          ..write('comment: $comment')
          ..write(')'))
        .toString();
  }
}

class $BalanceItemTable extends BalanceItem
    with TableInfo<$BalanceItemTable, BalanceItemData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BalanceItemTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _balanceMeta = const VerificationMeta(
    'balance',
  );
  @override
  late final GeneratedColumn<int> balance = GeneratedColumn<int>(
    'balance',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updateAtMeta = const VerificationMeta(
    'updateAt',
  );
  @override
  late final GeneratedColumn<DateTime> updateAt = GeneratedColumn<DateTime>(
    'update_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, balance, updateAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'balance_item';
  @override
  VerificationContext validateIntegrity(
    Insertable<BalanceItemData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('balance')) {
      context.handle(
        _balanceMeta,
        balance.isAcceptableOrUnknown(data['balance']!, _balanceMeta),
      );
    } else if (isInserting) {
      context.missing(_balanceMeta);
    }
    if (data.containsKey('update_at')) {
      context.handle(
        _updateAtMeta,
        updateAt.isAcceptableOrUnknown(data['update_at']!, _updateAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updateAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BalanceItemData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BalanceItemData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      balance: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}balance'],
      )!,
      updateAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}update_at'],
      )!,
    );
  }

  @override
  $BalanceItemTable createAlias(String alias) {
    return $BalanceItemTable(attachedDatabase, alias);
  }
}

class BalanceItemData extends DataClass implements Insertable<BalanceItemData> {
  final int id;
  final int balance;
  final DateTime updateAt;
  const BalanceItemData({
    required this.id,
    required this.balance,
    required this.updateAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['balance'] = Variable<int>(balance);
    map['update_at'] = Variable<DateTime>(updateAt);
    return map;
  }

  BalanceItemCompanion toCompanion(bool nullToAbsent) {
    return BalanceItemCompanion(
      id: Value(id),
      balance: Value(balance),
      updateAt: Value(updateAt),
    );
  }

  factory BalanceItemData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BalanceItemData(
      id: serializer.fromJson<int>(json['id']),
      balance: serializer.fromJson<int>(json['balance']),
      updateAt: serializer.fromJson<DateTime>(json['updateAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'balance': serializer.toJson<int>(balance),
      'updateAt': serializer.toJson<DateTime>(updateAt),
    };
  }

  BalanceItemData copyWith({int? id, int? balance, DateTime? updateAt}) =>
      BalanceItemData(
        id: id ?? this.id,
        balance: balance ?? this.balance,
        updateAt: updateAt ?? this.updateAt,
      );
  BalanceItemData copyWithCompanion(BalanceItemCompanion data) {
    return BalanceItemData(
      id: data.id.present ? data.id.value : this.id,
      balance: data.balance.present ? data.balance.value : this.balance,
      updateAt: data.updateAt.present ? data.updateAt.value : this.updateAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BalanceItemData(')
          ..write('id: $id, ')
          ..write('balance: $balance, ')
          ..write('updateAt: $updateAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, balance, updateAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BalanceItemData &&
          other.id == this.id &&
          other.balance == this.balance &&
          other.updateAt == this.updateAt);
}

class BalanceItemCompanion extends UpdateCompanion<BalanceItemData> {
  final Value<int> id;
  final Value<int> balance;
  final Value<DateTime> updateAt;
  const BalanceItemCompanion({
    this.id = const Value.absent(),
    this.balance = const Value.absent(),
    this.updateAt = const Value.absent(),
  });
  BalanceItemCompanion.insert({
    this.id = const Value.absent(),
    required int balance,
    required DateTime updateAt,
  }) : balance = Value(balance),
       updateAt = Value(updateAt);
  static Insertable<BalanceItemData> custom({
    Expression<int>? id,
    Expression<int>? balance,
    Expression<DateTime>? updateAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (balance != null) 'balance': balance,
      if (updateAt != null) 'update_at': updateAt,
    });
  }

  BalanceItemCompanion copyWith({
    Value<int>? id,
    Value<int>? balance,
    Value<DateTime>? updateAt,
  }) {
    return BalanceItemCompanion(
      id: id ?? this.id,
      balance: balance ?? this.balance,
      updateAt: updateAt ?? this.updateAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (balance.present) {
      map['balance'] = Variable<int>(balance.value);
    }
    if (updateAt.present) {
      map['update_at'] = Variable<DateTime>(updateAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BalanceItemCompanion(')
          ..write('id: $id, ')
          ..write('balance: $balance, ')
          ..write('updateAt: $updateAt')
          ..write(')'))
        .toString();
  }
}

class $CategoryItemTable extends CategoryItem
    with TableInfo<$CategoryItemTable, CategoryItemData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CategoryItemTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
    'category',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _iconMeta = const VerificationMeta('icon');
  @override
  late final GeneratedColumn<String> icon = GeneratedColumn<String>(
    'icon',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _colorMeta = const VerificationMeta('color');
  @override
  late final GeneratedColumn<int> color = GeneratedColumn<int>(
    'color',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isExpenseMeta = const VerificationMeta(
    'isExpense',
  );
  @override
  late final GeneratedColumn<bool> isExpense = GeneratedColumn<bool>(
    'is_expense',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_expense" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  @override
  List<GeneratedColumn> get $columns => [id, category, icon, color, isExpense];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'category_item';
  @override
  VerificationContext validateIntegrity(
    Insertable<CategoryItemData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    }
    if (data.containsKey('icon')) {
      context.handle(
        _iconMeta,
        icon.isAcceptableOrUnknown(data['icon']!, _iconMeta),
      );
    }
    if (data.containsKey('color')) {
      context.handle(
        _colorMeta,
        color.isAcceptableOrUnknown(data['color']!, _colorMeta),
      );
    } else if (isInserting) {
      context.missing(_colorMeta);
    }
    if (data.containsKey('is_expense')) {
      context.handle(
        _isExpenseMeta,
        isExpense.isAcceptableOrUnknown(data['is_expense']!, _isExpenseMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CategoryItemData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CategoryItemData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      category: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category'],
      ),
      icon: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}icon'],
      ),
      color: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}color'],
      )!,
      isExpense: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_expense'],
      )!,
    );
  }

  @override
  $CategoryItemTable createAlias(String alias) {
    return $CategoryItemTable(attachedDatabase, alias);
  }
}

class CategoryItemData extends DataClass
    implements Insertable<CategoryItemData> {
  final int id;
  final String? category;
  final String? icon;
  final int color;
  final bool isExpense;
  const CategoryItemData({
    required this.id,
    this.category,
    this.icon,
    required this.color,
    required this.isExpense,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || category != null) {
      map['category'] = Variable<String>(category);
    }
    if (!nullToAbsent || icon != null) {
      map['icon'] = Variable<String>(icon);
    }
    map['color'] = Variable<int>(color);
    map['is_expense'] = Variable<bool>(isExpense);
    return map;
  }

  CategoryItemCompanion toCompanion(bool nullToAbsent) {
    return CategoryItemCompanion(
      id: Value(id),
      category: category == null && nullToAbsent
          ? const Value.absent()
          : Value(category),
      icon: icon == null && nullToAbsent ? const Value.absent() : Value(icon),
      color: Value(color),
      isExpense: Value(isExpense),
    );
  }

  factory CategoryItemData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CategoryItemData(
      id: serializer.fromJson<int>(json['id']),
      category: serializer.fromJson<String?>(json['category']),
      icon: serializer.fromJson<String?>(json['icon']),
      color: serializer.fromJson<int>(json['color']),
      isExpense: serializer.fromJson<bool>(json['isExpense']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'category': serializer.toJson<String?>(category),
      'icon': serializer.toJson<String?>(icon),
      'color': serializer.toJson<int>(color),
      'isExpense': serializer.toJson<bool>(isExpense),
    };
  }

  CategoryItemData copyWith({
    int? id,
    Value<String?> category = const Value.absent(),
    Value<String?> icon = const Value.absent(),
    int? color,
    bool? isExpense,
  }) => CategoryItemData(
    id: id ?? this.id,
    category: category.present ? category.value : this.category,
    icon: icon.present ? icon.value : this.icon,
    color: color ?? this.color,
    isExpense: isExpense ?? this.isExpense,
  );
  CategoryItemData copyWithCompanion(CategoryItemCompanion data) {
    return CategoryItemData(
      id: data.id.present ? data.id.value : this.id,
      category: data.category.present ? data.category.value : this.category,
      icon: data.icon.present ? data.icon.value : this.icon,
      color: data.color.present ? data.color.value : this.color,
      isExpense: data.isExpense.present ? data.isExpense.value : this.isExpense,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CategoryItemData(')
          ..write('id: $id, ')
          ..write('category: $category, ')
          ..write('icon: $icon, ')
          ..write('color: $color, ')
          ..write('isExpense: $isExpense')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, category, icon, color, isExpense);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CategoryItemData &&
          other.id == this.id &&
          other.category == this.category &&
          other.icon == this.icon &&
          other.color == this.color &&
          other.isExpense == this.isExpense);
}

class CategoryItemCompanion extends UpdateCompanion<CategoryItemData> {
  final Value<int> id;
  final Value<String?> category;
  final Value<String?> icon;
  final Value<int> color;
  final Value<bool> isExpense;
  const CategoryItemCompanion({
    this.id = const Value.absent(),
    this.category = const Value.absent(),
    this.icon = const Value.absent(),
    this.color = const Value.absent(),
    this.isExpense = const Value.absent(),
  });
  CategoryItemCompanion.insert({
    this.id = const Value.absent(),
    this.category = const Value.absent(),
    this.icon = const Value.absent(),
    required int color,
    this.isExpense = const Value.absent(),
  }) : color = Value(color);
  static Insertable<CategoryItemData> custom({
    Expression<int>? id,
    Expression<String>? category,
    Expression<String>? icon,
    Expression<int>? color,
    Expression<bool>? isExpense,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (category != null) 'category': category,
      if (icon != null) 'icon': icon,
      if (color != null) 'color': color,
      if (isExpense != null) 'is_expense': isExpense,
    });
  }

  CategoryItemCompanion copyWith({
    Value<int>? id,
    Value<String?>? category,
    Value<String?>? icon,
    Value<int>? color,
    Value<bool>? isExpense,
  }) {
    return CategoryItemCompanion(
      id: id ?? this.id,
      category: category ?? this.category,
      icon: icon ?? this.icon,
      color: color ?? this.color,
      isExpense: isExpense ?? this.isExpense,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (icon.present) {
      map['icon'] = Variable<String>(icon.value);
    }
    if (color.present) {
      map['color'] = Variable<int>(color.value);
    }
    if (isExpense.present) {
      map['is_expense'] = Variable<bool>(isExpense.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoryItemCompanion(')
          ..write('id: $id, ')
          ..write('category: $category, ')
          ..write('icon: $icon, ')
          ..write('color: $color, ')
          ..write('isExpense: $isExpense')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ExpenseItemTable expenseItem = $ExpenseItemTable(this);
  late final $IncomeItemTable incomeItem = $IncomeItemTable(this);
  late final $BalanceItemTable balanceItem = $BalanceItemTable(this);
  late final $CategoryItemTable categoryItem = $CategoryItemTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    expenseItem,
    incomeItem,
    balanceItem,
    categoryItem,
  ];
}

typedef $$ExpenseItemTableCreateCompanionBuilder =
    ExpenseItemCompanion Function({
      Value<int> id,
      required int sum,
      Value<String?> category,
      Value<bool> isUnnecessary,
      Value<String?> comment,
    });
typedef $$ExpenseItemTableUpdateCompanionBuilder =
    ExpenseItemCompanion Function({
      Value<int> id,
      Value<int> sum,
      Value<String?> category,
      Value<bool> isUnnecessary,
      Value<String?> comment,
    });

class $$ExpenseItemTableFilterComposer
    extends Composer<_$AppDatabase, $ExpenseItemTable> {
  $$ExpenseItemTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sum => $composableBuilder(
    column: $table.sum,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isUnnecessary => $composableBuilder(
    column: $table.isUnnecessary,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get comment => $composableBuilder(
    column: $table.comment,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ExpenseItemTableOrderingComposer
    extends Composer<_$AppDatabase, $ExpenseItemTable> {
  $$ExpenseItemTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sum => $composableBuilder(
    column: $table.sum,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isUnnecessary => $composableBuilder(
    column: $table.isUnnecessary,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get comment => $composableBuilder(
    column: $table.comment,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ExpenseItemTableAnnotationComposer
    extends Composer<_$AppDatabase, $ExpenseItemTable> {
  $$ExpenseItemTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get sum =>
      $composableBuilder(column: $table.sum, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<bool> get isUnnecessary => $composableBuilder(
    column: $table.isUnnecessary,
    builder: (column) => column,
  );

  GeneratedColumn<String> get comment =>
      $composableBuilder(column: $table.comment, builder: (column) => column);
}

class $$ExpenseItemTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ExpenseItemTable,
          ExpenseItemData,
          $$ExpenseItemTableFilterComposer,
          $$ExpenseItemTableOrderingComposer,
          $$ExpenseItemTableAnnotationComposer,
          $$ExpenseItemTableCreateCompanionBuilder,
          $$ExpenseItemTableUpdateCompanionBuilder,
          (
            ExpenseItemData,
            BaseReferences<_$AppDatabase, $ExpenseItemTable, ExpenseItemData>,
          ),
          ExpenseItemData,
          PrefetchHooks Function()
        > {
  $$ExpenseItemTableTableManager(_$AppDatabase db, $ExpenseItemTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ExpenseItemTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ExpenseItemTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ExpenseItemTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> sum = const Value.absent(),
                Value<String?> category = const Value.absent(),
                Value<bool> isUnnecessary = const Value.absent(),
                Value<String?> comment = const Value.absent(),
              }) => ExpenseItemCompanion(
                id: id,
                sum: sum,
                category: category,
                isUnnecessary: isUnnecessary,
                comment: comment,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int sum,
                Value<String?> category = const Value.absent(),
                Value<bool> isUnnecessary = const Value.absent(),
                Value<String?> comment = const Value.absent(),
              }) => ExpenseItemCompanion.insert(
                id: id,
                sum: sum,
                category: category,
                isUnnecessary: isUnnecessary,
                comment: comment,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ExpenseItemTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ExpenseItemTable,
      ExpenseItemData,
      $$ExpenseItemTableFilterComposer,
      $$ExpenseItemTableOrderingComposer,
      $$ExpenseItemTableAnnotationComposer,
      $$ExpenseItemTableCreateCompanionBuilder,
      $$ExpenseItemTableUpdateCompanionBuilder,
      (
        ExpenseItemData,
        BaseReferences<_$AppDatabase, $ExpenseItemTable, ExpenseItemData>,
      ),
      ExpenseItemData,
      PrefetchHooks Function()
    >;
typedef $$IncomeItemTableCreateCompanionBuilder =
    IncomeItemCompanion Function({
      Value<int> id,
      required int sum,
      Value<String?> category,
      Value<String?> incomeSource,
      Value<String?> comment,
    });
typedef $$IncomeItemTableUpdateCompanionBuilder =
    IncomeItemCompanion Function({
      Value<int> id,
      Value<int> sum,
      Value<String?> category,
      Value<String?> incomeSource,
      Value<String?> comment,
    });

class $$IncomeItemTableFilterComposer
    extends Composer<_$AppDatabase, $IncomeItemTable> {
  $$IncomeItemTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sum => $composableBuilder(
    column: $table.sum,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get incomeSource => $composableBuilder(
    column: $table.incomeSource,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get comment => $composableBuilder(
    column: $table.comment,
    builder: (column) => ColumnFilters(column),
  );
}

class $$IncomeItemTableOrderingComposer
    extends Composer<_$AppDatabase, $IncomeItemTable> {
  $$IncomeItemTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sum => $composableBuilder(
    column: $table.sum,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get incomeSource => $composableBuilder(
    column: $table.incomeSource,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get comment => $composableBuilder(
    column: $table.comment,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$IncomeItemTableAnnotationComposer
    extends Composer<_$AppDatabase, $IncomeItemTable> {
  $$IncomeItemTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get sum =>
      $composableBuilder(column: $table.sum, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<String> get incomeSource => $composableBuilder(
    column: $table.incomeSource,
    builder: (column) => column,
  );

  GeneratedColumn<String> get comment =>
      $composableBuilder(column: $table.comment, builder: (column) => column);
}

class $$IncomeItemTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $IncomeItemTable,
          IncomeItemData,
          $$IncomeItemTableFilterComposer,
          $$IncomeItemTableOrderingComposer,
          $$IncomeItemTableAnnotationComposer,
          $$IncomeItemTableCreateCompanionBuilder,
          $$IncomeItemTableUpdateCompanionBuilder,
          (
            IncomeItemData,
            BaseReferences<_$AppDatabase, $IncomeItemTable, IncomeItemData>,
          ),
          IncomeItemData,
          PrefetchHooks Function()
        > {
  $$IncomeItemTableTableManager(_$AppDatabase db, $IncomeItemTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$IncomeItemTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$IncomeItemTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$IncomeItemTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> sum = const Value.absent(),
                Value<String?> category = const Value.absent(),
                Value<String?> incomeSource = const Value.absent(),
                Value<String?> comment = const Value.absent(),
              }) => IncomeItemCompanion(
                id: id,
                sum: sum,
                category: category,
                incomeSource: incomeSource,
                comment: comment,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int sum,
                Value<String?> category = const Value.absent(),
                Value<String?> incomeSource = const Value.absent(),
                Value<String?> comment = const Value.absent(),
              }) => IncomeItemCompanion.insert(
                id: id,
                sum: sum,
                category: category,
                incomeSource: incomeSource,
                comment: comment,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$IncomeItemTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $IncomeItemTable,
      IncomeItemData,
      $$IncomeItemTableFilterComposer,
      $$IncomeItemTableOrderingComposer,
      $$IncomeItemTableAnnotationComposer,
      $$IncomeItemTableCreateCompanionBuilder,
      $$IncomeItemTableUpdateCompanionBuilder,
      (
        IncomeItemData,
        BaseReferences<_$AppDatabase, $IncomeItemTable, IncomeItemData>,
      ),
      IncomeItemData,
      PrefetchHooks Function()
    >;
typedef $$BalanceItemTableCreateCompanionBuilder =
    BalanceItemCompanion Function({
      Value<int> id,
      required int balance,
      required DateTime updateAt,
    });
typedef $$BalanceItemTableUpdateCompanionBuilder =
    BalanceItemCompanion Function({
      Value<int> id,
      Value<int> balance,
      Value<DateTime> updateAt,
    });

class $$BalanceItemTableFilterComposer
    extends Composer<_$AppDatabase, $BalanceItemTable> {
  $$BalanceItemTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get balance => $composableBuilder(
    column: $table.balance,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updateAt => $composableBuilder(
    column: $table.updateAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$BalanceItemTableOrderingComposer
    extends Composer<_$AppDatabase, $BalanceItemTable> {
  $$BalanceItemTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get balance => $composableBuilder(
    column: $table.balance,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updateAt => $composableBuilder(
    column: $table.updateAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$BalanceItemTableAnnotationComposer
    extends Composer<_$AppDatabase, $BalanceItemTable> {
  $$BalanceItemTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get balance =>
      $composableBuilder(column: $table.balance, builder: (column) => column);

  GeneratedColumn<DateTime> get updateAt =>
      $composableBuilder(column: $table.updateAt, builder: (column) => column);
}

class $$BalanceItemTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $BalanceItemTable,
          BalanceItemData,
          $$BalanceItemTableFilterComposer,
          $$BalanceItemTableOrderingComposer,
          $$BalanceItemTableAnnotationComposer,
          $$BalanceItemTableCreateCompanionBuilder,
          $$BalanceItemTableUpdateCompanionBuilder,
          (
            BalanceItemData,
            BaseReferences<_$AppDatabase, $BalanceItemTable, BalanceItemData>,
          ),
          BalanceItemData,
          PrefetchHooks Function()
        > {
  $$BalanceItemTableTableManager(_$AppDatabase db, $BalanceItemTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BalanceItemTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BalanceItemTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BalanceItemTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> balance = const Value.absent(),
                Value<DateTime> updateAt = const Value.absent(),
              }) => BalanceItemCompanion(
                id: id,
                balance: balance,
                updateAt: updateAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int balance,
                required DateTime updateAt,
              }) => BalanceItemCompanion.insert(
                id: id,
                balance: balance,
                updateAt: updateAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$BalanceItemTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $BalanceItemTable,
      BalanceItemData,
      $$BalanceItemTableFilterComposer,
      $$BalanceItemTableOrderingComposer,
      $$BalanceItemTableAnnotationComposer,
      $$BalanceItemTableCreateCompanionBuilder,
      $$BalanceItemTableUpdateCompanionBuilder,
      (
        BalanceItemData,
        BaseReferences<_$AppDatabase, $BalanceItemTable, BalanceItemData>,
      ),
      BalanceItemData,
      PrefetchHooks Function()
    >;
typedef $$CategoryItemTableCreateCompanionBuilder =
    CategoryItemCompanion Function({
      Value<int> id,
      Value<String?> category,
      Value<String?> icon,
      required int color,
      Value<bool> isExpense,
    });
typedef $$CategoryItemTableUpdateCompanionBuilder =
    CategoryItemCompanion Function({
      Value<int> id,
      Value<String?> category,
      Value<String?> icon,
      Value<int> color,
      Value<bool> isExpense,
    });

class $$CategoryItemTableFilterComposer
    extends Composer<_$AppDatabase, $CategoryItemTable> {
  $$CategoryItemTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get icon => $composableBuilder(
    column: $table.icon,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get color => $composableBuilder(
    column: $table.color,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isExpense => $composableBuilder(
    column: $table.isExpense,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CategoryItemTableOrderingComposer
    extends Composer<_$AppDatabase, $CategoryItemTable> {
  $$CategoryItemTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get icon => $composableBuilder(
    column: $table.icon,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get color => $composableBuilder(
    column: $table.color,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isExpense => $composableBuilder(
    column: $table.isExpense,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CategoryItemTableAnnotationComposer
    extends Composer<_$AppDatabase, $CategoryItemTable> {
  $$CategoryItemTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<String> get icon =>
      $composableBuilder(column: $table.icon, builder: (column) => column);

  GeneratedColumn<int> get color =>
      $composableBuilder(column: $table.color, builder: (column) => column);

  GeneratedColumn<bool> get isExpense =>
      $composableBuilder(column: $table.isExpense, builder: (column) => column);
}

class $$CategoryItemTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CategoryItemTable,
          CategoryItemData,
          $$CategoryItemTableFilterComposer,
          $$CategoryItemTableOrderingComposer,
          $$CategoryItemTableAnnotationComposer,
          $$CategoryItemTableCreateCompanionBuilder,
          $$CategoryItemTableUpdateCompanionBuilder,
          (
            CategoryItemData,
            BaseReferences<_$AppDatabase, $CategoryItemTable, CategoryItemData>,
          ),
          CategoryItemData,
          PrefetchHooks Function()
        > {
  $$CategoryItemTableTableManager(_$AppDatabase db, $CategoryItemTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CategoryItemTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CategoryItemTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CategoryItemTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> category = const Value.absent(),
                Value<String?> icon = const Value.absent(),
                Value<int> color = const Value.absent(),
                Value<bool> isExpense = const Value.absent(),
              }) => CategoryItemCompanion(
                id: id,
                category: category,
                icon: icon,
                color: color,
                isExpense: isExpense,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> category = const Value.absent(),
                Value<String?> icon = const Value.absent(),
                required int color,
                Value<bool> isExpense = const Value.absent(),
              }) => CategoryItemCompanion.insert(
                id: id,
                category: category,
                icon: icon,
                color: color,
                isExpense: isExpense,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CategoryItemTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CategoryItemTable,
      CategoryItemData,
      $$CategoryItemTableFilterComposer,
      $$CategoryItemTableOrderingComposer,
      $$CategoryItemTableAnnotationComposer,
      $$CategoryItemTableCreateCompanionBuilder,
      $$CategoryItemTableUpdateCompanionBuilder,
      (
        CategoryItemData,
        BaseReferences<_$AppDatabase, $CategoryItemTable, CategoryItemData>,
      ),
      CategoryItemData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ExpenseItemTableTableManager get expenseItem =>
      $$ExpenseItemTableTableManager(_db, _db.expenseItem);
  $$IncomeItemTableTableManager get incomeItem =>
      $$IncomeItemTableTableManager(_db, _db.incomeItem);
  $$BalanceItemTableTableManager get balanceItem =>
      $$BalanceItemTableTableManager(_db, _db.balanceItem);
  $$CategoryItemTableTableManager get categoryItem =>
      $$CategoryItemTableTableManager(_db, _db.categoryItem);
}
