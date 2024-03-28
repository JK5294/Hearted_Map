import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hearted_map/models/makeMaptextList.dart';
import 'package:hearted_map/theme/sh_theme.dart';
import 'package:hearted_map/ui/MakeMapPage/widgets/smalltag.dart';

class MultiSelectListView extends StatefulWidget {
  @override
  _MultiSelectListViewState createState() => _MultiSelectListViewState();
  final List<String> tagToNextPage;
  MultiSelectListView({
    super.key,
    required this.tagToNextPage,
  });
}

class _MultiSelectListViewState extends State<MultiSelectListView>
    with SingleTickerProviderStateMixin {
  late final List<String> _items;
  late bool _colorChange;
  late final List imageList = [];
  late final List labelList = [];
  late final List colorList = [];
  late TabController _tabController;
  Set<String> selectedKeys = Set<String>();
  @override
  void initState() {
    super.initState();
    _colorChange = false;
    _items = widget.tagToNextPage;
    _tabController = TabController(
      vsync: this,
      length: _items.length,
    );
    _tabController.addListener(() {});
    // emptyList = [];
    if (_items.isNotEmpty) {
      _items.forEach((element) {
        // emptyList.add(LocalDataTask.Instance.TagChecklist[element]);
        imageList.add(LocalDataTask.Instance.TagChecklist[element]![0]);
        colorList.add(LocalDataTask.Instance.TagChecklist[element]![1]);
        labelList.add(LocalDataTask.Instance.TagChecklist[element]![2]);
      });
      // print(emptyList);
      print(imageList);
      print(labelList);
      print(_items);
      print(colorList);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            flex: 4,
            child: TabBarView(
              controller: _tabController,
              children: List.generate(imageList.length, (index) {
                return _imagesGenerate(index);
              }),
            )),
        Expanded(
            flex: 1,
            child: Container(margin: EdgeInsets.all(5), child: _taglist())),
        Expanded(
            // width: 300,
            flex: 4,
            // color: Colors.red,
            child: Container(
              margin: EdgeInsets.all(10),
              // color: Colors.red,
              child: TabBarView(
                  controller: _tabController,
                  children: List.generate(_items.length, (index) {
                    return GridView.builder(
                      itemCount: labelList[index]!.length,
                      scrollDirection: Axis.horizontal,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 2 / 3,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                      ),
                      itemBuilder: (context, _index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              if (LocalDataTask.Instance.selectedItems
                                  .containsKey(labelList[index]![_index])) {
                                LocalDataTask.Instance.selectedItems
                                    .remove(labelList[index]![_index]);
                                LocalDataTask.Instance.selectedlabel
                                    .remove(labelList[index]![_index]);
                                LocalDataTask.Instance.selectedWidget
                                    .remove(smalltag(
                                  image: imageList[index],
                                  label: labelList[index]![_index],
                                  color: colorList[index]![1],
                                  colorList: colorList,
                                  index: index,
                                ));
                                _colorChange = false;
                              } else {
                                LocalDataTask.Instance.selectedItems[
                                    labelList[index]![_index]] = smalltag(
                                  image: imageList[index],
                                  label: labelList[index]![_index],
                                  color: colorList[index]![1],
                                  colorList: colorList,
                                  index: index,
                                );
                                LocalDataTask.Instance.selectedlabel
                                    .add(labelList[index]![_index]);
                                LocalDataTask.Instance.selectedWidget
                                    .add(smalltag(
                                  image: imageList[index],
                                  label: labelList[index]![_index],
                                  color: colorList[index]![1],
                                  colorList: colorList,
                                  index: index,
                                ));

                                _colorChange = true;
                              }
                              print(LocalDataTask.Instance.selectedItems);
                              print(LocalDataTask.Instance.selectedWidget);
                              print(LocalDataTask.Instance.selectedlabel);
                            });
                          },
                          child: smalltag(
                            image: imageList[index],
                            label: labelList[index]![_index],
                            color: colorList[index]![1],
                            colorList: colorList,
                            index: index,
                            isSelected: _colorChange,
                          ),
                        );
                      },
                    );
                  })),
            )),
      ],
    );
  }

  _imagesGenerate(int i) {
    return Column(children: [
      SizedBox(
        height: 20,
      ),
      Container(
          // margin: EdgeInsets.all(30),
          child: Flexible(
        flex: 1, // 使子元素等宽
        child: AspectRatio(
          aspectRatio: 17 / 11, // 宽高比
          child: Container(
            // color: Colors.red,
            margin: EdgeInsets.all(30),
            child: SvgPicture.asset(
              imageList[i],
              fit: BoxFit.fill,
            ),
          ),
        ),
      )),
    ]);
  }

  _taglist() {
    return AnimatedBuilder(
        animation: _tabController.animation!,
        builder: (BuildContext context, Widget? child) {
          return TabBar(
            controller: _tabController,
            isScrollable: true,
            indicatorPadding: EdgeInsets.zero,
            // labelPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            // indicatorColor: Colors.grey.shade500,
            unselectedLabelColor: Colors.grey,
            // indicatorSize: TabBarIndicatorSize.tab,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(20), //圆角
              // border: Border.all(color: Colors.white),
              color: colorList[_tabController.index]![1],
              // color: Colors.grey.shade400,
            ),
            tabs: List.generate(_items.length, (index) {
              return Container(
                margin: EdgeInsets.all(10),
                child: Container(
                  margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                  child: Text(
                    _items[index],
                    style: TextSize_14,
                  ),
                ),
              );
            }),
          );
        });
  }
}
