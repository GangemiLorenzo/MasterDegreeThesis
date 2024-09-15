// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'code_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CodeState {
  String? get fileName => throw _privateConstructorUsedError;
  Uint8List? get fileBytes => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            bool isLoading, String? fileName, Uint8List? fileBytes)
        initial,
    required TResult Function(String fileName, Uint8List fileBytes,
            String taskId, int progress, String message)
        processing,
    required TResult Function(
            String fileName,
            Uint8List fileBytes,
            Task task,
            bool isLoading,
            String? selectedItem,
            bool justSavedFile,
            bool showSettings)
        loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isLoading, String? fileName, Uint8List? fileBytes)?
        initial,
    TResult? Function(String fileName, Uint8List fileBytes, String taskId,
            int progress, String message)?
        processing,
    TResult? Function(
            String fileName,
            Uint8List fileBytes,
            Task task,
            bool isLoading,
            String? selectedItem,
            bool justSavedFile,
            bool showSettings)?
        loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLoading, String? fileName, Uint8List? fileBytes)?
        initial,
    TResult Function(String fileName, Uint8List fileBytes, String taskId,
            int progress, String message)?
        processing,
    TResult Function(
            String fileName,
            Uint8List fileBytes,
            Task task,
            bool isLoading,
            String? selectedItem,
            bool justSavedFile,
            bool showSettings)?
        loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Processing value) processing,
    required TResult Function(_Loaded value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Processing value)? processing,
    TResult? Function(_Loaded value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Processing value)? processing,
    TResult Function(_Loaded value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CodeStateCopyWith<CodeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CodeStateCopyWith<$Res> {
  factory $CodeStateCopyWith(CodeState value, $Res Function(CodeState) then) =
      _$CodeStateCopyWithImpl<$Res, CodeState>;
  @useResult
  $Res call({String fileName, Uint8List fileBytes});
}

/// @nodoc
class _$CodeStateCopyWithImpl<$Res, $Val extends CodeState>
    implements $CodeStateCopyWith<$Res> {
  _$CodeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fileName = null,
    Object? fileBytes = null,
  }) {
    return _then(_value.copyWith(
      fileName: null == fileName
          ? _value.fileName!
          : fileName // ignore: cast_nullable_to_non_nullable
              as String,
      fileBytes: null == fileBytes
          ? _value.fileBytes!
          : fileBytes // ignore: cast_nullable_to_non_nullable
              as Uint8List,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $CodeStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, String? fileName, Uint8List? fileBytes});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$CodeStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? fileName = freezed,
    Object? fileBytes = freezed,
  }) {
    return _then(_$InitialImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      fileName: freezed == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String?,
      fileBytes: freezed == fileBytes
          ? _value.fileBytes
          : fileBytes // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
    ));
  }
}

/// @nodoc

class _$InitialImpl with DiagnosticableTreeMixin implements _Initial {
  const _$InitialImpl({this.isLoading = false, this.fileName, this.fileBytes});

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final String? fileName;
  @override
  final Uint8List? fileBytes;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CodeState.initial(isLoading: $isLoading, fileName: $fileName, fileBytes: $fileBytes)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CodeState.initial'))
      ..add(DiagnosticsProperty('isLoading', isLoading))
      ..add(DiagnosticsProperty('fileName', fileName))
      ..add(DiagnosticsProperty('fileBytes', fileBytes));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.fileName, fileName) ||
                other.fileName == fileName) &&
            const DeepCollectionEquality().equals(other.fileBytes, fileBytes));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, fileName,
      const DeepCollectionEquality().hash(fileBytes));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            bool isLoading, String? fileName, Uint8List? fileBytes)
        initial,
    required TResult Function(String fileName, Uint8List fileBytes,
            String taskId, int progress, String message)
        processing,
    required TResult Function(
            String fileName,
            Uint8List fileBytes,
            Task task,
            bool isLoading,
            String? selectedItem,
            bool justSavedFile,
            bool showSettings)
        loaded,
  }) {
    return initial(isLoading, fileName, fileBytes);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isLoading, String? fileName, Uint8List? fileBytes)?
        initial,
    TResult? Function(String fileName, Uint8List fileBytes, String taskId,
            int progress, String message)?
        processing,
    TResult? Function(
            String fileName,
            Uint8List fileBytes,
            Task task,
            bool isLoading,
            String? selectedItem,
            bool justSavedFile,
            bool showSettings)?
        loaded,
  }) {
    return initial?.call(isLoading, fileName, fileBytes);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLoading, String? fileName, Uint8List? fileBytes)?
        initial,
    TResult Function(String fileName, Uint8List fileBytes, String taskId,
            int progress, String message)?
        processing,
    TResult Function(
            String fileName,
            Uint8List fileBytes,
            Task task,
            bool isLoading,
            String? selectedItem,
            bool justSavedFile,
            bool showSettings)?
        loaded,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(isLoading, fileName, fileBytes);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Processing value) processing,
    required TResult Function(_Loaded value) loaded,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Processing value)? processing,
    TResult? Function(_Loaded value)? loaded,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Processing value)? processing,
    TResult Function(_Loaded value)? loaded,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements CodeState {
  const factory _Initial(
      {final bool isLoading,
      final String? fileName,
      final Uint8List? fileBytes}) = _$InitialImpl;

  bool get isLoading;
  @override
  String? get fileName;
  @override
  Uint8List? get fileBytes;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ProcessingImplCopyWith<$Res>
    implements $CodeStateCopyWith<$Res> {
  factory _$$ProcessingImplCopyWith(
          _$ProcessingImpl value, $Res Function(_$ProcessingImpl) then) =
      __$$ProcessingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String fileName,
      Uint8List fileBytes,
      String taskId,
      int progress,
      String message});
}

/// @nodoc
class __$$ProcessingImplCopyWithImpl<$Res>
    extends _$CodeStateCopyWithImpl<$Res, _$ProcessingImpl>
    implements _$$ProcessingImplCopyWith<$Res> {
  __$$ProcessingImplCopyWithImpl(
      _$ProcessingImpl _value, $Res Function(_$ProcessingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fileName = null,
    Object? fileBytes = null,
    Object? taskId = null,
    Object? progress = null,
    Object? message = null,
  }) {
    return _then(_$ProcessingImpl(
      fileName: null == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String,
      fileBytes: null == fileBytes
          ? _value.fileBytes
          : fileBytes // ignore: cast_nullable_to_non_nullable
              as Uint8List,
      taskId: null == taskId
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as String,
      progress: null == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ProcessingImpl with DiagnosticableTreeMixin implements _Processing {
  const _$ProcessingImpl(
      {required this.fileName,
      required this.fileBytes,
      required this.taskId,
      required this.progress,
      required this.message});

  @override
  final String fileName;
  @override
  final Uint8List fileBytes;
  @override
  final String taskId;
  @override
  final int progress;
  @override
  final String message;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CodeState.processing(fileName: $fileName, fileBytes: $fileBytes, taskId: $taskId, progress: $progress, message: $message)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CodeState.processing'))
      ..add(DiagnosticsProperty('fileName', fileName))
      ..add(DiagnosticsProperty('fileBytes', fileBytes))
      ..add(DiagnosticsProperty('taskId', taskId))
      ..add(DiagnosticsProperty('progress', progress))
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProcessingImpl &&
            (identical(other.fileName, fileName) ||
                other.fileName == fileName) &&
            const DeepCollectionEquality().equals(other.fileBytes, fileBytes) &&
            (identical(other.taskId, taskId) || other.taskId == taskId) &&
            (identical(other.progress, progress) ||
                other.progress == progress) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      fileName,
      const DeepCollectionEquality().hash(fileBytes),
      taskId,
      progress,
      message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProcessingImplCopyWith<_$ProcessingImpl> get copyWith =>
      __$$ProcessingImplCopyWithImpl<_$ProcessingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            bool isLoading, String? fileName, Uint8List? fileBytes)
        initial,
    required TResult Function(String fileName, Uint8List fileBytes,
            String taskId, int progress, String message)
        processing,
    required TResult Function(
            String fileName,
            Uint8List fileBytes,
            Task task,
            bool isLoading,
            String? selectedItem,
            bool justSavedFile,
            bool showSettings)
        loaded,
  }) {
    return processing(fileName, fileBytes, taskId, progress, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isLoading, String? fileName, Uint8List? fileBytes)?
        initial,
    TResult? Function(String fileName, Uint8List fileBytes, String taskId,
            int progress, String message)?
        processing,
    TResult? Function(
            String fileName,
            Uint8List fileBytes,
            Task task,
            bool isLoading,
            String? selectedItem,
            bool justSavedFile,
            bool showSettings)?
        loaded,
  }) {
    return processing?.call(fileName, fileBytes, taskId, progress, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLoading, String? fileName, Uint8List? fileBytes)?
        initial,
    TResult Function(String fileName, Uint8List fileBytes, String taskId,
            int progress, String message)?
        processing,
    TResult Function(
            String fileName,
            Uint8List fileBytes,
            Task task,
            bool isLoading,
            String? selectedItem,
            bool justSavedFile,
            bool showSettings)?
        loaded,
    required TResult orElse(),
  }) {
    if (processing != null) {
      return processing(fileName, fileBytes, taskId, progress, message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Processing value) processing,
    required TResult Function(_Loaded value) loaded,
  }) {
    return processing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Processing value)? processing,
    TResult? Function(_Loaded value)? loaded,
  }) {
    return processing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Processing value)? processing,
    TResult Function(_Loaded value)? loaded,
    required TResult orElse(),
  }) {
    if (processing != null) {
      return processing(this);
    }
    return orElse();
  }
}

abstract class _Processing implements CodeState {
  const factory _Processing(
      {required final String fileName,
      required final Uint8List fileBytes,
      required final String taskId,
      required final int progress,
      required final String message}) = _$ProcessingImpl;

  @override
  String get fileName;
  @override
  Uint8List get fileBytes;
  String get taskId;
  int get progress;
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$ProcessingImplCopyWith<_$ProcessingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res> implements $CodeStateCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
          _$LoadedImpl value, $Res Function(_$LoadedImpl) then) =
      __$$LoadedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String fileName,
      Uint8List fileBytes,
      Task task,
      bool isLoading,
      String? selectedItem,
      bool justSavedFile,
      bool showSettings});

  $TaskCopyWith<$Res> get task;
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$CodeStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl _value, $Res Function(_$LoadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fileName = null,
    Object? fileBytes = null,
    Object? task = null,
    Object? isLoading = null,
    Object? selectedItem = freezed,
    Object? justSavedFile = null,
    Object? showSettings = null,
  }) {
    return _then(_$LoadedImpl(
      fileName: null == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String,
      fileBytes: null == fileBytes
          ? _value.fileBytes
          : fileBytes // ignore: cast_nullable_to_non_nullable
              as Uint8List,
      task: null == task
          ? _value.task
          : task // ignore: cast_nullable_to_non_nullable
              as Task,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedItem: freezed == selectedItem
          ? _value.selectedItem
          : selectedItem // ignore: cast_nullable_to_non_nullable
              as String?,
      justSavedFile: null == justSavedFile
          ? _value.justSavedFile
          : justSavedFile // ignore: cast_nullable_to_non_nullable
              as bool,
      showSettings: null == showSettings
          ? _value.showSettings
          : showSettings // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $TaskCopyWith<$Res> get task {
    return $TaskCopyWith<$Res>(_value.task, (value) {
      return _then(_value.copyWith(task: value));
    });
  }
}

/// @nodoc

class _$LoadedImpl with DiagnosticableTreeMixin implements _Loaded {
  const _$LoadedImpl(
      {required this.fileName,
      required this.fileBytes,
      required this.task,
      this.isLoading = false,
      this.selectedItem,
      this.justSavedFile = false,
      this.showSettings = false});

  @override
  final String fileName;
  @override
  final Uint8List fileBytes;
  @override
  final Task task;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  final String? selectedItem;
  @override
  @JsonKey()
  final bool justSavedFile;
  @override
  @JsonKey()
  final bool showSettings;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CodeState.loaded(fileName: $fileName, fileBytes: $fileBytes, task: $task, isLoading: $isLoading, selectedItem: $selectedItem, justSavedFile: $justSavedFile, showSettings: $showSettings)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CodeState.loaded'))
      ..add(DiagnosticsProperty('fileName', fileName))
      ..add(DiagnosticsProperty('fileBytes', fileBytes))
      ..add(DiagnosticsProperty('task', task))
      ..add(DiagnosticsProperty('isLoading', isLoading))
      ..add(DiagnosticsProperty('selectedItem', selectedItem))
      ..add(DiagnosticsProperty('justSavedFile', justSavedFile))
      ..add(DiagnosticsProperty('showSettings', showSettings));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl &&
            (identical(other.fileName, fileName) ||
                other.fileName == fileName) &&
            const DeepCollectionEquality().equals(other.fileBytes, fileBytes) &&
            (identical(other.task, task) || other.task == task) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.selectedItem, selectedItem) ||
                other.selectedItem == selectedItem) &&
            (identical(other.justSavedFile, justSavedFile) ||
                other.justSavedFile == justSavedFile) &&
            (identical(other.showSettings, showSettings) ||
                other.showSettings == showSettings));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      fileName,
      const DeepCollectionEquality().hash(fileBytes),
      task,
      isLoading,
      selectedItem,
      justSavedFile,
      showSettings);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      __$$LoadedImplCopyWithImpl<_$LoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            bool isLoading, String? fileName, Uint8List? fileBytes)
        initial,
    required TResult Function(String fileName, Uint8List fileBytes,
            String taskId, int progress, String message)
        processing,
    required TResult Function(
            String fileName,
            Uint8List fileBytes,
            Task task,
            bool isLoading,
            String? selectedItem,
            bool justSavedFile,
            bool showSettings)
        loaded,
  }) {
    return loaded(fileName, fileBytes, task, isLoading, selectedItem,
        justSavedFile, showSettings);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isLoading, String? fileName, Uint8List? fileBytes)?
        initial,
    TResult? Function(String fileName, Uint8List fileBytes, String taskId,
            int progress, String message)?
        processing,
    TResult? Function(
            String fileName,
            Uint8List fileBytes,
            Task task,
            bool isLoading,
            String? selectedItem,
            bool justSavedFile,
            bool showSettings)?
        loaded,
  }) {
    return loaded?.call(fileName, fileBytes, task, isLoading, selectedItem,
        justSavedFile, showSettings);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLoading, String? fileName, Uint8List? fileBytes)?
        initial,
    TResult Function(String fileName, Uint8List fileBytes, String taskId,
            int progress, String message)?
        processing,
    TResult Function(
            String fileName,
            Uint8List fileBytes,
            Task task,
            bool isLoading,
            String? selectedItem,
            bool justSavedFile,
            bool showSettings)?
        loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(fileName, fileBytes, task, isLoading, selectedItem,
          justSavedFile, showSettings);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Processing value) processing,
    required TResult Function(_Loaded value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Processing value)? processing,
    TResult? Function(_Loaded value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Processing value)? processing,
    TResult Function(_Loaded value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements CodeState {
  const factory _Loaded(
      {required final String fileName,
      required final Uint8List fileBytes,
      required final Task task,
      final bool isLoading,
      final String? selectedItem,
      final bool justSavedFile,
      final bool showSettings}) = _$LoadedImpl;

  @override
  String get fileName;
  @override
  Uint8List get fileBytes;
  Task get task;
  bool get isLoading;
  String? get selectedItem;
  bool get justSavedFile;
  bool get showSettings;
  @override
  @JsonKey(ignore: true)
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
