import 'package:bottom_dialog/bottom_model.dart';
import 'package:flutter/material.dart';

class BottomDialog extends StatefulWidget {
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

  BottomDialog(
      {required this.showImage,
      required this.useSearch,
      required this.multiSelect,
      required this.bottomModelList,
      required this.titleText,
      required this.itemTextStyle,
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
      this.hasDividerAfterHeader = false});

  @override
  _BottomDialogState createState() => _BottomDialogState();
}

class _BottomDialogState extends State<BottomDialog> {
  List<BottomModel> _tempList = [];

  @override
  void initState() {
    _tempList = widget.bottomModelList;
    sortedList(_tempList);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _customScaffold;
  }

  Widget get _customScaffold =>
      Scaffold(backgroundColor: Colors.transparent, body: _customSafeArea);

  Widget get _customSafeArea => SafeArea(
        child: _customColumn,
      );

  Widget get _customColumn => Column(
        children: [_expandedTopSpace, _screenDesign],
      );

  Widget get _expandedTopSpace =>
      Expanded(flex: 1, child: SizedBox(height: 150.0));

  Widget get _screenDesign => Container(
        decoration: _customBoxDecoration,
        padding: _customContainerVerticalPadding,
        child: _customContainerColumn,
      );

  BoxDecoration get _customBoxDecoration => BoxDecoration(
      color: widget.widgetColor,
      borderRadius: _customBorderRadius,
      boxShadow: _customBoxShadow);

  BorderRadius get _customBorderRadius => BorderRadius.only(
      topLeft: Radius.circular(widget.dialogRadius),
      topRight: Radius.circular(widget.dialogRadius));

  List<BoxShadow>? get _customBoxShadow => _whichShadowToReturn();

  List<BoxShadow>? _whichShadowToReturn() {
    if (widget.hasShadow) {
      if (widget.customBoxShadow == null)
        return _defaultBoxShadow;
      else
        return widget.customBoxShadow!;
    } else
      return null;
  }

  List<BoxShadow> get _defaultBoxShadow => [
        BoxShadow(
          color: _grayColor,
          blurRadius: 5.0,
          spreadRadius: 5.0,
          offset: Offset(2.0, 2.0), // shadow direction: bottom right
        )
      ];

  Widget get _customContainerColumn => Column(
        children: [
          _titleRow,
          _customHeightSizedBox,
          if(widget.hasDividerAfterHeader)
          _customDivider,
          _customHeightSizedBox,
          if (widget.useSearch) _customSearchFiled,
          if (widget.useSearch) _customHeightSizedBox,
          _customList,
          _customHeightSizedBox,
        ],
      );

  Widget get _titleRow => Row(
        mainAxisAlignment: widget.multiSelect
            ? MainAxisAlignment.spaceBetween
            : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _customHeaderExpanded(_cancelTextButton),
          _customHeaderExpanded(widget.titleText),
          _customHeaderExpanded(
              widget.multiSelect ? _saveTextButton : Container())
        ],
      );

  Expanded _customHeaderExpanded(Widget widget) {
    return Expanded(
      child: widget,
      flex: 1,
    );
  }

  TextButton get _cancelTextButton => TextButton(
      onPressed: () {
        Navigator.pop(context);
      },
      child: _cancelText);

  Text get _cancelText => Text(
        widget.cancelWord!,
        style: widget.cancelTextStyle,
      );

  TextButton get _saveTextButton => TextButton(
      onPressed: () {
        Navigator.pop(context);
        widget.onSave!(widget.bottomModelList);
      },
      child: _saveText);

  Text get _saveText => Text(
        widget.saveWord!,
        style: widget.saveTextStyle,
      );

  Widget get _customSearchFiled => Padding(
    padding: _customContainerHorizontalPadding,
    child: TextField(
          style: widget.searchTextStyle,
          onChanged: (value) {
            _doSearchOnList(value);
          },
          decoration: InputDecoration(
              hintText: widget.searchWord,
              hintStyle: widget.searchHintTextStyle,
              prefixIcon: widget.prefixSearchIcon),
        ),
  );

  void _doSearchOnList(String searchValue) {
    setState(() {
      if (searchValue.isEmpty)
        _tempList = widget.bottomModelList;
      else
        _tempList = widget.bottomModelList
            .where((element) =>
                element.name.toLowerCase().contains(searchValue.toLowerCase()))
            .toList();
      sortedList(_tempList);
    });
  }

  void sortedList(List<BottomModel> list){
   list.sort((a, b) => a.sortId!.compareTo(b.sortId!));
  }

  Widget get _customList => Container(
        height: _tempList.length > 2
            ? MediaQuery.of(context).size.height / 3
            : null,
        padding: _customContainerHorizontalPadding,
        child: ListView.builder(
          itemBuilder: (context, index) => _customItem(_tempList[index]),
          shrinkWrap: true,
          itemCount: _tempList.length,
        ),
      );

  _customItem(BottomModel item) {
    return InkWell(
      onTap: () {
        _onTapOnItem(item);
      },
      child: _listItem(item),
    );
  }

  Widget _listItem(BottomModel item) {
    return Padding(
      padding: _customItemRowPadding,
      child: _itemRow(item),
    );
  }

  Row _itemRow(BottomModel item) {
    return Row(
      children: [
        if (widget.multiSelect) _customCheckBox(item),
        if (widget.multiSelect) _customWidthSizedBox,
        if (widget.showImage) _customImageSizedBox(item.imageWidget),
        if (widget.showImage) _customWidthSizedBox,
        _customItemText(item.name)
      ],
    );
  }

  Checkbox _customCheckBox(BottomModel item) {
    return Checkbox(
        value: item.selected,
        onChanged: (value) {
          item.selected = value!;
          _changeSelectedItem(item);
        });
  }

  Text _customItemText(String text) {
    return Text(
      text,
      style: widget.itemTextStyle,
    );
  }

  SizedBox _customImageSizedBox(Widget? imageWidget) {
    return SizedBox(
      width: 30.0,
      height: 30.0,
      child: imageWidget,
    );
  }

  void _onTapOnItem(BottomModel item) {
    if (!widget.multiSelect)
      doSingleSelect(item);
    else
      _changeSelectedItem(item);
  }

  void doSingleSelect(BottomModel item) {
    Navigator.pop(context);
    widget.onItemSelected!(item);
  }

  void _changeSelectedItem(BottomModel item) {
    widget.bottomModelList
        .singleWhere((element) => item.id == element.id)
        .selected = !item.selected;
    setState(() {
      _tempList.singleWhere((element) => item.id == element.id).selected =
          !item.selected;
    });
  }

  Color get _grayColor => Color.fromARGB(255, 112, 112, 112);

  EdgeInsets get _customContainerVerticalPadding =>
      EdgeInsets.only(top: 15.0, bottom: 15.0);

  EdgeInsets get _customContainerHorizontalPadding =>
      EdgeInsets.only(left: 30.0, right: 30.0);

  SizedBox get _customHeightSizedBox => SizedBox(
        height: 8.0,
      );

  Divider get _customDivider => Divider(
        height: 1.0,
        color: widget.dividerColor == null ? _grayColor : widget.dividerColor,
      );

  SizedBox get _customWidthSizedBox => SizedBox(
        width: 10.0,
      );

  EdgeInsets get _customItemRowPadding =>
      EdgeInsets.only(left: 15.0, bottom: 10.0, right: 15.0, top: 10.0);
}
