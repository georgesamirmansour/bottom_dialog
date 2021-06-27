import 'package:bottom_dialog/bottom_dialog.dart';
import 'package:flutter/material.dart';
import 'bottom_model.dart';

export 'bottom_model.dart';

class ShowBottomDialog {
  final bool showImage,
      useSearch,
      multiSelect,
      hasShadow,
      hasDividerAfterHeader;
  final List<BottomModel> bottomModelList;
  final Function(List<BottomModel> bottomModelList)? onSave;
  final Function(BottomModel bottomModelItem)? onItemSelected;
  final Text titleText;
  final Color widgetColor;
  final double dialogRadius;
  final List<BoxShadow>? customBoxShadow;
  final Color? dividerColor;
  final TextStyle? searchTextStyle,
      searchHintTextStyle,
      saveTextStyle,
      cancelTextStyle;
  final String? searchWord, saveWord, cancelWord;
  final Widget? prefixSearchIcon;
  final TextStyle itemTextStyle;
  final BuildContext context;

  ShowBottomDialog({
    required this.showImage,
    required this.useSearch,
    required this.multiSelect,
    required this.bottomModelList,
    required this.titleText,
    required this.itemTextStyle,
    required this.context,
    this.onSave,
    this.onItemSelected,
    this.widgetColor = Colors.white,
    this.dialogRadius = 30.0,
    this.customBoxShadow,
    this.hasShadow = true,
    this.dividerColor,
    this.searchTextStyle,
    this.searchHintTextStyle,
    this.searchWord,
    this.prefixSearchIcon,
    this.saveTextStyle,
    this.cancelTextStyle,
    this.saveWord,
    this.cancelWord,
    this.hasDividerAfterHeader = false,
  }) {
    _showBottomDialog(BottomDialog(
      showImage: showImage,
      useSearch: useSearch,
      multiSelect: multiSelect,
      bottomModelList: bottomModelList,
      titleText: titleText,
      itemTextStyle: itemTextStyle,
      dialogRadius: dialogRadius,
      customBoxShadow: customBoxShadow,
      dividerColor: dividerColor,
      hasShadow: hasShadow,
      onItemSelected: onItemSelected,
      onSave: onSave,
      prefixSearchIcon: prefixSearchIcon,
      searchHintTextStyle: searchHintTextStyle,
      searchTextStyle: searchTextStyle,
      searchWord: searchWord,
      widgetColor: widgetColor,
      cancelTextStyle: cancelTextStyle,
      cancelWord: cancelWord,
      saveTextStyle: saveTextStyle,
      saveWord: saveWord,
      hasDividerAfterHeader: hasDividerAfterHeader,
    ));
  }

  void _showBottomDialog(Widget widget) {
    Navigator.of(context).push(PageRouteBuilder(
        opaque: false,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var begin = Offset(0.0, 1.0);
          var end = Offset.zero;
          var tween = Tween(begin: begin, end: end);
          var offsetAnimation = animation.drive(tween);
          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        },
        pageBuilder: (context, animation, secondaryAnimation) => widget));
  }
}
