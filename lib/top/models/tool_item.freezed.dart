// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'tool_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ToolItemTearOff {
  const _$ToolItemTearOff();

  _ToolItem call(
      {required IconData icon,
      required String title,
      required String description,
      required void Function() onTap}) {
    return _ToolItem(
      icon: icon,
      title: title,
      description: description,
      onTap: onTap,
    );
  }
}

/// @nodoc
const $ToolItem = _$ToolItemTearOff();

/// @nodoc
mixin _$ToolItem {
  IconData get icon => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  void Function() get onTap => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ToolItemCopyWith<ToolItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ToolItemCopyWith<$Res> {
  factory $ToolItemCopyWith(ToolItem value, $Res Function(ToolItem) then) =
      _$ToolItemCopyWithImpl<$Res>;
  $Res call(
      {IconData icon, String title, String description, void Function() onTap});
}

/// @nodoc
class _$ToolItemCopyWithImpl<$Res> implements $ToolItemCopyWith<$Res> {
  _$ToolItemCopyWithImpl(this._value, this._then);

  final ToolItem _value;
  // ignore: unused_field
  final $Res Function(ToolItem) _then;

  @override
  $Res call({
    Object? icon = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? onTap = freezed,
  }) {
    return _then(_value.copyWith(
      icon: icon == freezed
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as IconData,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      onTap: onTap == freezed
          ? _value.onTap
          : onTap // ignore: cast_nullable_to_non_nullable
              as void Function(),
    ));
  }
}

/// @nodoc
abstract class _$ToolItemCopyWith<$Res> implements $ToolItemCopyWith<$Res> {
  factory _$ToolItemCopyWith(_ToolItem value, $Res Function(_ToolItem) then) =
      __$ToolItemCopyWithImpl<$Res>;
  @override
  $Res call(
      {IconData icon, String title, String description, void Function() onTap});
}

/// @nodoc
class __$ToolItemCopyWithImpl<$Res> extends _$ToolItemCopyWithImpl<$Res>
    implements _$ToolItemCopyWith<$Res> {
  __$ToolItemCopyWithImpl(_ToolItem _value, $Res Function(_ToolItem) _then)
      : super(_value, (v) => _then(v as _ToolItem));

  @override
  _ToolItem get _value => super._value as _ToolItem;

  @override
  $Res call({
    Object? icon = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? onTap = freezed,
  }) {
    return _then(_ToolItem(
      icon: icon == freezed
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as IconData,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      onTap: onTap == freezed
          ? _value.onTap
          : onTap // ignore: cast_nullable_to_non_nullable
              as void Function(),
    ));
  }
}

/// @nodoc

class _$_ToolItem implements _ToolItem {
  const _$_ToolItem(
      {required this.icon,
      required this.title,
      required this.description,
      required this.onTap});

  @override
  final IconData icon;
  @override
  final String title;
  @override
  final String description;
  @override
  final void Function() onTap;

  @override
  String toString() {
    return 'ToolItem(icon: $icon, title: $title, description: $description, onTap: $onTap)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ToolItem &&
            (identical(other.icon, icon) ||
                const DeepCollectionEquality().equals(other.icon, icon)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.onTap, onTap) ||
                const DeepCollectionEquality().equals(other.onTap, onTap)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(icon) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(onTap);

  @JsonKey(ignore: true)
  @override
  _$ToolItemCopyWith<_ToolItem> get copyWith =>
      __$ToolItemCopyWithImpl<_ToolItem>(this, _$identity);
}

abstract class _ToolItem implements ToolItem {
  const factory _ToolItem(
      {required IconData icon,
      required String title,
      required String description,
      required void Function() onTap}) = _$_ToolItem;

  @override
  IconData get icon => throw _privateConstructorUsedError;
  @override
  String get title => throw _privateConstructorUsedError;
  @override
  String get description => throw _privateConstructorUsedError;
  @override
  void Function() get onTap => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ToolItemCopyWith<_ToolItem> get copyWith =>
      throw _privateConstructorUsedError;
}
