import 'package:filter_list/src/theme/filter_list_theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Overrides the default style of [ChoiceChip]
///
/// See also:
///
///  * [ChoiceChipThemeData], which is used to configure this theme.
class ChoiceChipTheme extends InheritedTheme {
  /// Builds a [GifDialogTheme].
  const ChoiceChipTheme({
    Key? key,
    required this.data,
    required Widget child,
  }) : super(key: key, child: child);

  /// The configuration of this theme.
  final ChoiceChipThemeData data;

  /// The closest instance of this class that encloses the given context.
  ///
  /// If there is no enclosing [ChoiceChipTheme] widget, then
  /// [FilterListThemeData.choiceChipTheme] is used.
  ///
  /// Typical usage is as follows:
  ///
  /// ```dart
  /// final theme = ChoiceChipThemeData.of(context);
  /// ```
  static ChoiceChipThemeData of(BuildContext context) {
    final choiceChipTheme =
        context.dependOnInheritedWidgetOfExactType<ChoiceChipTheme>();
    return choiceChipTheme?.data ?? FilterListTheme.of(context).choiceChipTheme;
  }

  @override
  Widget wrap(BuildContext context, Widget child) =>
      ChoiceChipTheme(data: data, child: child);

  @override
  bool updateShouldNotify(ChoiceChipTheme oldWidget) => data != oldWidget.data;

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<ChoiceChipThemeData>('data', data));
  }
}

/// {@template choice_chip_theme}
/// A style that overrides the default appearance of [ChoiceChip] and
/// [ChoiceChip] widgets when used with [ChoiceChipTheme] or with the overall
/// [FilterListTheme]'s [FilterListThemeData.choiceChipTheme].
///
/// See also:
///
/// * [ChoiceChipTheme], the theme which is configured with this class.
/// * [FilterListThemeData.choiceChipTheme], which can be used to override
/// the default style for [ChoiceChip]
/// {@endtemplate}
class ChoiceChipThemeData with Diagnosticable {
  /// Builds a [ChoiceChipThemeData].
  const ChoiceChipThemeData({
    this.selectedTextStyle = const TextStyle(color: Colors.white),
    this.textStyle,
    this.selectedBackgroundColor = Colors.blue,
    this.backgroundColor,
    this.visualDensity,
    this.elevation,
    this.side,
    this.shape,
    this.shadowColor = Colors.black,
    this.selectedShadowColor = Colors.black,
    this.padding,
    this.labelPadding,
    this.margin = const EdgeInsets.symmetric(horizontal: 10.0),
  });

  factory ChoiceChipThemeData.light(BuildContext context) =>
      ChoiceChipThemeData(
        selectedTextStyle:
            TextStyle(color: Theme.of(context).colorScheme.onPrimary),
        textStyle: TextStyle(color: Colors.black),
        selectedBackgroundColor: Colors.blue,
        backgroundColor: const Color(0xfff8f8f8),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        elevation: 0,
        selectedShadowColor: Colors.black,
        shadowColor: Colors.black,
        padding: const EdgeInsets.all(4),
        labelPadding: const EdgeInsets.symmetric(horizontal: 4.0),
        margin: const EdgeInsets.symmetric(horizontal: 10.0),
      );

  /// TextStyle for chip when selected.
  final TextStyle? selectedTextStyle;

  /// TextStyle for chip when not selected.
  final TextStyle? textStyle;

  /// Color to be used for the selected, selected chip's background.
  ///
  /// The default is [Colors.blue].
  final Color? selectedBackgroundColor;

  /// Color to be used for the unselected, unselected chip's background.
  ///
  /// The default is light grey.
  final Color? backgroundColor;

  ///Defines how compact the chip's layout will be.
  ///
  /// Chips are unaffected by horizontal density changes.
  final VisualDensity? visualDensity;

  /// Elevation to be applied on the chip relative to its parent.
  ///
  /// This controls the size of the shadow below the chip.
  ///
  /// Defaults to 0. The value is always non-negative.
  final double? elevation;

  /// The color and weight of the chip's outline.
  ///
  /// Defaults to the border side in the ambient [ChipThemeData]. If the theme border side resolves to null, the default is the border side of [shape].
  final BorderSide? side;

  /// The [OutlinedBorder] to draw around the chip.
  ///
  /// Defaults to the shape in the ambient [ChipThemeData]. If the theme shape resolves to null, the default is [StadiumBorder].
  final OutlinedBorder? shape;

  /// Color of the chip's shadow when the elevation is greater than 0.
  ///
  /// The default is [Colors.black].
  final Color? shadowColor;

  /// Color of the chip's shadow when the elevation is greater than 0 and the chip is selected.
  ///
  ///The default is [Colors.black].
  final Color? selectedShadowColor;

  /// The padding between the contents of the chip and the outside [shape].
  ///
  /// Defaults to 4 logical pixels on all sides.

  final EdgeInsetsGeometry? padding;

  /// The padding around the [label] widget.
  ///
  /// By default, this is 4 logical pixels at the beginning and the end of the label, and zero on top and bottom.
  final EdgeInsetsGeometry? labelPadding;

  /// The margin around choice chip
  final EdgeInsetsGeometry margin;

  /// Creates a copy of this theme, but with the given fields replaced with
  /// the new values.
  ChoiceChipThemeData copyWith({
    TextStyle? selectedChipTextStyle,
    TextStyle? unselectedChipTextStyle,
    Color? selectedTextBackgroundColor,
    Color? unselectedTextbackGroundColor,
    VisualDensity? visualDensity,
    double? elevation,
    BorderSide? side,
    OutlinedBorder? shape,
    Color? shadowColor,
    Color? selectedShadowColor,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? labelPadding,
    EdgeInsetsGeometry? margin,
  }) {
    return ChoiceChipThemeData(
      selectedTextStyle: selectedChipTextStyle ?? this.selectedTextStyle,
      textStyle: unselectedChipTextStyle ?? this.textStyle,
      selectedBackgroundColor:
          selectedTextBackgroundColor ?? this.selectedBackgroundColor,
      backgroundColor: unselectedTextbackGroundColor ?? this.backgroundColor,
      visualDensity: visualDensity ?? this.visualDensity,
      elevation: elevation ?? this.elevation,
      side: side ?? this.side,
      shape: shape ?? this.shape,
      shadowColor: shadowColor ?? this.shadowColor,
      selectedShadowColor: selectedShadowColor ?? this.selectedShadowColor,
      padding: padding ?? this.padding,
      labelPadding: labelPadding ?? this.labelPadding,
      margin: margin ?? this.margin,
    );
  }

  /// Linearly interpolates between two [ChoiceChipThemeData].
  ///
  /// All the properties must be non-null.
  ChoiceChipThemeData lerp(
    ChoiceChipThemeData a,
    ChoiceChipThemeData b,
    double t,
  ) {
    return ChoiceChipThemeData(
      selectedTextStyle:
          TextStyle.lerp(a.selectedTextStyle, b.selectedTextStyle, t),
      textStyle: TextStyle.lerp(a.textStyle, b.textStyle, t),
      selectedBackgroundColor: a.selectedBackgroundColor,
      backgroundColor: Color.lerp(a.backgroundColor, b.backgroundColor, t),
      visualDensity: VisualDensity.lerp(a.visualDensity!, b.visualDensity!, t),
      elevation: a.elevation,
      side: BorderSide.lerp(a.side!, b.side!, t),
      shape: a.shape,
      shadowColor: Color.lerp(a.shadowColor, b.shadowColor, t),
      selectedShadowColor:
          Color.lerp(a.selectedShadowColor, b.selectedShadowColor, t),
      padding: EdgeInsetsGeometry.lerp(a.padding, b.padding, t),
      labelPadding: EdgeInsetsGeometry.lerp(a.labelPadding, b.labelPadding, t),
      margin: EdgeInsetsGeometry.lerp(a.margin, b.margin, t)!,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChoiceChipThemeData &&
          runtimeType == other.runtimeType &&
          selectedTextStyle == other.selectedTextStyle &&
          textStyle == other.textStyle &&
          selectedBackgroundColor == other.selectedBackgroundColor &&
          backgroundColor == other.backgroundColor &&
          visualDensity == other.visualDensity &&
          elevation == other.elevation &&
          side == other.side &&
          shape == other.shape &&
          shadowColor == other.shadowColor &&
          selectedShadowColor == other.selectedShadowColor &&
          padding == other.padding &&
          labelPadding == other.labelPadding &&
          margin == other.margin;

  @override
  int get hashCode =>
      selectedTextStyle.hashCode ^
      textStyle.hashCode ^
      selectedBackgroundColor.hashCode ^
      backgroundColor.hashCode ^
      visualDensity.hashCode ^
      elevation.hashCode ^
      side.hashCode ^
      shape.hashCode ^
      shadowColor.hashCode ^
      selectedShadowColor.hashCode ^
      padding.hashCode ^
      labelPadding.hashCode ^
      margin.hashCode;

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<Color>(
        'selectedTextBackgroundColor', selectedBackgroundColor));
    properties.add(
        DiagnosticsProperty<TextStyle?>('unselectedChipTextStyle', textStyle));
    properties.add(DiagnosticsProperty<TextStyle?>(
        'selectedChipTextStyle', selectedTextStyle));
    properties.add(
        DiagnosticsProperty<VisualDensity>('visualDensity', visualDensity));
    properties.add(DiagnosticsProperty<double>('elevation', elevation));
    properties.add(DiagnosticsProperty<BorderSide>('side', side));
    properties.add(DiagnosticsProperty<OutlinedBorder>('shape', shape));
    properties.add(DiagnosticsProperty<Color>('shadowColor', shadowColor));
    properties.add(
        DiagnosticsProperty<Color>('selectedShadowColor', selectedShadowColor));
    properties.add(DiagnosticsProperty<EdgeInsetsGeometry>('padding', padding));
    properties.add(
        DiagnosticsProperty<EdgeInsetsGeometry>('labelPadding', labelPadding));
    properties.add(DiagnosticsProperty<EdgeInsetsGeometry>('margin', margin));
  }
}