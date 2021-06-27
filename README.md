# progress_button

Bottom dialog is a picker dialog for pick with single or multiply chooses. with support of adding icons or and search.

<img src="https://github.com/georgesamirmansour/bottom_dialog/blob/master/screenShot/1.png" width="250" height="500"><img src="https://github.com/georgesamirmansour/bottom_dialog/blob/master/screenShot/2.png" width="250" height="500">
<img src="https://github.com/georgesamirmansour/bottom_dialog/blob/master/screenShot/3.png" width="250" height="500">
<img src="https://github.com/georgesamirmansour/bottom_dialog/blob/master/screenShot/4.png" width="250" height="500">
<img src="https://github.com/georgesamirmansour/bottom_dialog/blob/master/screenShot/5.png" width="250" height="500">
<img src="https://github.com/georgesamirmansour/bottom_dialog/blob/master/screenShot/6.png" width="250" height="500">
<img src="https://github.com/georgesamirmansour/bottom_dialog/blob/master/screenShot/7.png" width="250" height="500">
<img src="https://github.com/georgesamirmansour/bottom_dialog/blob/master/screenShot/8.png" width="250" height="500">
<img src="https://github.com/georgesamirmansour/bottom_dialog/blob/master/screenShot/9.png" width="250" height="500">


## Getting Started



## Examples: BottomModelExample
```groovy
 List<BottomModel> list = [
      BottomModel(
          name: 'Camera',
          id: 1,
          selected: true,
          imageWidget: Icon(Icons.camera),
          sortId: 1),
      BottomModel(
          name: 'Gallery',
          id: 2,
          selected: false,
          imageWidget: Icon(Icons.image),
          sortId: 1)
    ];
```
## Examples: ShowDialog
```groovy
    ShowBottomDialog(
      context: context,
      bottomModelList: list,
      // show or hide image inside list
      showImage: true,
      // list item text style
      itemTextStyle: TextStyle(color: Colors.black87, fontSize: 18.0),
      // title text in center of header
      titleText: Text(
        'Select which',
        style: TextStyle(color: Colors.black, fontSize: 22.0),
      ),
      // save word text, only showed when multiSelect = true,
      saveWord: 'Save',
      // save text style
      saveTextStyle: TextStyle(color: Colors.blueAccent, fontSize: 18.0),
      // background color
      widgetColor: Colors.white,
      // allow use search inside dialog
      useSearch: true,
      // search text
      searchWord: 'Search...',
      // search text style
      searchTextStyle: TextStyle(color: Colors.blueAccent, fontSize: 16.0),
      // search hint text style
      searchHintTextStyle: TextStyle(color: Colors.grey, fontSize: 16.0),

      // custom widget for search icon as prefix
      prefixSearchIcon: Icon(
        Icons.search,
        color: Colors.blueAccent,
      ),
      // if true => return onSave function, else return onItemSelected
      multiSelect: true,
      onSave: (List<BottomModel> returnedList) {},
      // return
      onItemSelected: (BottomModel item) {},
      // allow to show shadow at top and bottom of dialog
      hasShadow: true,
      // make custom dialog
      customBoxShadow: [
        BoxShadow(
          color: Colors.blueAccent,
          blurRadius: 5.0,
          spreadRadius: 5.0,
          offset: Offset(2.0, 2.0), // shadow direction: bottom right
        )
      ],
      // divider after header (cancel, title text...)
      hasDividerAfterHeader: true,
      // divider color
      dividerColor: Colors.blueGrey,
      // cancel text
      cancelWord: 'Cancel',
      // cancel text style , will throw error if it's null
      cancelTextStyle: TextStyle(color: Colors.red, fontSize: 16.0),
      // dialog top left and right radius
      dialogRadius: 30.0,
    );
```
License
--------
MIT License

Copyright (c) 2021 George Samir

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.