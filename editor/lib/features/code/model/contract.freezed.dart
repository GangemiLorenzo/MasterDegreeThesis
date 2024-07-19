// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contract.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Contract _$ContractFromJson(Map<String, dynamic> json) {
  return _Contract.fromJson(json);
}

/// @nodoc
mixin _$Contract {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  bool get isInterface => throw _privateConstructorUsedError;
  bool get isLibrary => throw _privateConstructorUsedError;
  List<Variable> get variables => throw _privateConstructorUsedError;
  List<FunctionDefinition> get functions => throw _privateConstructorUsedError;
  List<Modifier> get modifiers => throw _privateConstructorUsedError;
  List<Event> get events => throw _privateConstructorUsedError;
  List<Inheritance> get inheritance => throw _privateConstructorUsedError;
  List<EnumDefinition> get enums => throw _privateConstructorUsedError;
  List<Struct> get structs => throw _privateConstructorUsedError;
  List<CustomError> get errors => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ContractCopyWith<Contract> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContractCopyWith<$Res> {
  factory $ContractCopyWith(Contract value, $Res Function(Contract) then) =
      _$ContractCopyWithImpl<$Res, Contract>;
  @useResult
  $Res call(
      {String id,
      String name,
      bool isInterface,
      bool isLibrary,
      List<Variable> variables,
      List<FunctionDefinition> functions,
      List<Modifier> modifiers,
      List<Event> events,
      List<Inheritance> inheritance,
      List<EnumDefinition> enums,
      List<Struct> structs,
      List<CustomError> errors});
}

/// @nodoc
class _$ContractCopyWithImpl<$Res, $Val extends Contract>
    implements $ContractCopyWith<$Res> {
  _$ContractCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? isInterface = null,
    Object? isLibrary = null,
    Object? variables = null,
    Object? functions = null,
    Object? modifiers = null,
    Object? events = null,
    Object? inheritance = null,
    Object? enums = null,
    Object? structs = null,
    Object? errors = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      isInterface: null == isInterface
          ? _value.isInterface
          : isInterface // ignore: cast_nullable_to_non_nullable
              as bool,
      isLibrary: null == isLibrary
          ? _value.isLibrary
          : isLibrary // ignore: cast_nullable_to_non_nullable
              as bool,
      variables: null == variables
          ? _value.variables
          : variables // ignore: cast_nullable_to_non_nullable
              as List<Variable>,
      functions: null == functions
          ? _value.functions
          : functions // ignore: cast_nullable_to_non_nullable
              as List<FunctionDefinition>,
      modifiers: null == modifiers
          ? _value.modifiers
          : modifiers // ignore: cast_nullable_to_non_nullable
              as List<Modifier>,
      events: null == events
          ? _value.events
          : events // ignore: cast_nullable_to_non_nullable
              as List<Event>,
      inheritance: null == inheritance
          ? _value.inheritance
          : inheritance // ignore: cast_nullable_to_non_nullable
              as List<Inheritance>,
      enums: null == enums
          ? _value.enums
          : enums // ignore: cast_nullable_to_non_nullable
              as List<EnumDefinition>,
      structs: null == structs
          ? _value.structs
          : structs // ignore: cast_nullable_to_non_nullable
              as List<Struct>,
      errors: null == errors
          ? _value.errors
          : errors // ignore: cast_nullable_to_non_nullable
              as List<CustomError>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ContractImplCopyWith<$Res>
    implements $ContractCopyWith<$Res> {
  factory _$$ContractImplCopyWith(
          _$ContractImpl value, $Res Function(_$ContractImpl) then) =
      __$$ContractImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      bool isInterface,
      bool isLibrary,
      List<Variable> variables,
      List<FunctionDefinition> functions,
      List<Modifier> modifiers,
      List<Event> events,
      List<Inheritance> inheritance,
      List<EnumDefinition> enums,
      List<Struct> structs,
      List<CustomError> errors});
}

/// @nodoc
class __$$ContractImplCopyWithImpl<$Res>
    extends _$ContractCopyWithImpl<$Res, _$ContractImpl>
    implements _$$ContractImplCopyWith<$Res> {
  __$$ContractImplCopyWithImpl(
      _$ContractImpl _value, $Res Function(_$ContractImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? isInterface = null,
    Object? isLibrary = null,
    Object? variables = null,
    Object? functions = null,
    Object? modifiers = null,
    Object? events = null,
    Object? inheritance = null,
    Object? enums = null,
    Object? structs = null,
    Object? errors = null,
  }) {
    return _then(_$ContractImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      isInterface: null == isInterface
          ? _value.isInterface
          : isInterface // ignore: cast_nullable_to_non_nullable
              as bool,
      isLibrary: null == isLibrary
          ? _value.isLibrary
          : isLibrary // ignore: cast_nullable_to_non_nullable
              as bool,
      variables: null == variables
          ? _value._variables
          : variables // ignore: cast_nullable_to_non_nullable
              as List<Variable>,
      functions: null == functions
          ? _value._functions
          : functions // ignore: cast_nullable_to_non_nullable
              as List<FunctionDefinition>,
      modifiers: null == modifiers
          ? _value._modifiers
          : modifiers // ignore: cast_nullable_to_non_nullable
              as List<Modifier>,
      events: null == events
          ? _value._events
          : events // ignore: cast_nullable_to_non_nullable
              as List<Event>,
      inheritance: null == inheritance
          ? _value._inheritance
          : inheritance // ignore: cast_nullable_to_non_nullable
              as List<Inheritance>,
      enums: null == enums
          ? _value._enums
          : enums // ignore: cast_nullable_to_non_nullable
              as List<EnumDefinition>,
      structs: null == structs
          ? _value._structs
          : structs // ignore: cast_nullable_to_non_nullable
              as List<Struct>,
      errors: null == errors
          ? _value._errors
          : errors // ignore: cast_nullable_to_non_nullable
              as List<CustomError>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ContractImpl extends _Contract {
  const _$ContractImpl(
      {required this.id,
      required this.name,
      this.isInterface = false,
      this.isLibrary = false,
      final List<Variable> variables = const [],
      final List<FunctionDefinition> functions = const [],
      final List<Modifier> modifiers = const [],
      final List<Event> events = const [],
      final List<Inheritance> inheritance = const [],
      final List<EnumDefinition> enums = const [],
      final List<Struct> structs = const [],
      final List<CustomError> errors = const []})
      : _variables = variables,
        _functions = functions,
        _modifiers = modifiers,
        _events = events,
        _inheritance = inheritance,
        _enums = enums,
        _structs = structs,
        _errors = errors,
        super._();

  factory _$ContractImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContractImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  @JsonKey()
  final bool isInterface;
  @override
  @JsonKey()
  final bool isLibrary;
  final List<Variable> _variables;
  @override
  @JsonKey()
  List<Variable> get variables {
    if (_variables is EqualUnmodifiableListView) return _variables;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_variables);
  }

  final List<FunctionDefinition> _functions;
  @override
  @JsonKey()
  List<FunctionDefinition> get functions {
    if (_functions is EqualUnmodifiableListView) return _functions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_functions);
  }

  final List<Modifier> _modifiers;
  @override
  @JsonKey()
  List<Modifier> get modifiers {
    if (_modifiers is EqualUnmodifiableListView) return _modifiers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_modifiers);
  }

  final List<Event> _events;
  @override
  @JsonKey()
  List<Event> get events {
    if (_events is EqualUnmodifiableListView) return _events;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_events);
  }

  final List<Inheritance> _inheritance;
  @override
  @JsonKey()
  List<Inheritance> get inheritance {
    if (_inheritance is EqualUnmodifiableListView) return _inheritance;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_inheritance);
  }

  final List<EnumDefinition> _enums;
  @override
  @JsonKey()
  List<EnumDefinition> get enums {
    if (_enums is EqualUnmodifiableListView) return _enums;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_enums);
  }

  final List<Struct> _structs;
  @override
  @JsonKey()
  List<Struct> get structs {
    if (_structs is EqualUnmodifiableListView) return _structs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_structs);
  }

  final List<CustomError> _errors;
  @override
  @JsonKey()
  List<CustomError> get errors {
    if (_errors is EqualUnmodifiableListView) return _errors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_errors);
  }

  @override
  String toString() {
    return 'Contract(id: $id, name: $name, isInterface: $isInterface, isLibrary: $isLibrary, variables: $variables, functions: $functions, modifiers: $modifiers, events: $events, inheritance: $inheritance, enums: $enums, structs: $structs, errors: $errors)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContractImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.isInterface, isInterface) ||
                other.isInterface == isInterface) &&
            (identical(other.isLibrary, isLibrary) ||
                other.isLibrary == isLibrary) &&
            const DeepCollectionEquality()
                .equals(other._variables, _variables) &&
            const DeepCollectionEquality()
                .equals(other._functions, _functions) &&
            const DeepCollectionEquality()
                .equals(other._modifiers, _modifiers) &&
            const DeepCollectionEquality().equals(other._events, _events) &&
            const DeepCollectionEquality()
                .equals(other._inheritance, _inheritance) &&
            const DeepCollectionEquality().equals(other._enums, _enums) &&
            const DeepCollectionEquality().equals(other._structs, _structs) &&
            const DeepCollectionEquality().equals(other._errors, _errors));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      isInterface,
      isLibrary,
      const DeepCollectionEquality().hash(_variables),
      const DeepCollectionEquality().hash(_functions),
      const DeepCollectionEquality().hash(_modifiers),
      const DeepCollectionEquality().hash(_events),
      const DeepCollectionEquality().hash(_inheritance),
      const DeepCollectionEquality().hash(_enums),
      const DeepCollectionEquality().hash(_structs),
      const DeepCollectionEquality().hash(_errors));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ContractImplCopyWith<_$ContractImpl> get copyWith =>
      __$$ContractImplCopyWithImpl<_$ContractImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ContractImplToJson(
      this,
    );
  }
}

abstract class _Contract extends Contract {
  const factory _Contract(
      {required final String id,
      required final String name,
      final bool isInterface,
      final bool isLibrary,
      final List<Variable> variables,
      final List<FunctionDefinition> functions,
      final List<Modifier> modifiers,
      final List<Event> events,
      final List<Inheritance> inheritance,
      final List<EnumDefinition> enums,
      final List<Struct> structs,
      final List<CustomError> errors}) = _$ContractImpl;
  const _Contract._() : super._();

  factory _Contract.fromJson(Map<String, dynamic> json) =
      _$ContractImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  bool get isInterface;
  @override
  bool get isLibrary;
  @override
  List<Variable> get variables;
  @override
  List<FunctionDefinition> get functions;
  @override
  List<Modifier> get modifiers;
  @override
  List<Event> get events;
  @override
  List<Inheritance> get inheritance;
  @override
  List<EnumDefinition> get enums;
  @override
  List<Struct> get structs;
  @override
  List<CustomError> get errors;
  @override
  @JsonKey(ignore: true)
  _$$ContractImplCopyWith<_$ContractImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
