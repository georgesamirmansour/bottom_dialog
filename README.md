# progress_button

Progress button help developer to make custom progress with button and animation.

## Getting Started

Screenshots
```groovy
![Alt text](/relative/screenShot/1.png?raw=true "1")
![Alt text](/screenShot/2.png?raw=true "2")
![Alt text](/screenShot/3.png?raw=true "3")
![Alt text](/screenShot/4.png?raw=true "4")
![Alt text](/screenShot/5.png?raw=true "5")
![Alt text](/screenShot/6.png?raw=true "6")
![Alt text](/screenShot/7.png?raw=true "7")
![Alt text](/screenShot/8.png?raw=true "8")
![Alt text](/screenShot/9.png?raw=true "9")
```
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
      multiSelect: true,
      useSearch: true,
      itemTextStyle: TextStyle(color: Colors.black87, fontSize: 18.0),
      showImage: true,
      titleText: Text(
        'Select which',
        style: TextStyle(color: Colors.black, fontSize: 22.0),
      ),
      saveWord: 'Save',
      saveTextStyle: TextStyle(color: Colors.blueAccent, fontSize: 18.0),
      cancelWord: 'Cancel',
      widgetColor: Colors.white,
      searchWord: 'Search...',
      searchTextStyle: TextStyle(color: Colors.blueAccent, fontSize: 16.0),
      searchHintTextStyle: TextStyle(color: Colors.grey, fontSize: 16.0),
      prefixSearchIcon: Icon(
        Icons.search,
        color: Colors.blueAccent,
      ),
      onSave: (List<BottomModel> returnedList) {},
      onItemSelected: (BottomModel item) {},
      hasShadow: true,
      dividerColor: Colors.black,
      cancelTextStyle: TextStyle(color: Colors.red, fontSize: 16.0),
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