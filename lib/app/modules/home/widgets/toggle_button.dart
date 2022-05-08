import 'package:flutter/material.dart';

class ToggleBtns extends StatefulWidget {
  final List<Text> texts;
  final Function(int) selected;
  final Color selectedColor;
  final bool multipleSelectionsAllowed;
  final bool stateContained;
  final bool canUnToggle;
  ToggleBtns(
      {required this.texts,
      required this.selected,
      this.selectedColor = const Color(0xFF6200EE),
      this.stateContained = true,
      this.canUnToggle = false,
      this.multipleSelectionsAllowed = true,
      Key? key});

  @override
  _ToggleBtnsState createState() => _ToggleBtnsState();
}

class _ToggleBtnsState extends State<ToggleBtns> {
  late List<bool> isSelected = [];
  @override
  void initState() {
    // ignore: unused_local_variable
    for (var e in widget.texts) {
      isSelected.add(false);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ToggleButtons(
            color: Colors.black.withOpacity(0.60),
            selectedColor: widget.selectedColor,
            selectedBorderColor: widget.selectedColor,
            fillColor: widget.selectedColor.withOpacity(0.08),
            splashColor: widget.selectedColor.withOpacity(0.12),
            hoverColor: widget.selectedColor.withOpacity(0.04),
            borderRadius: BorderRadius.circular(4.0),
            isSelected: isSelected,
            highlightColor: Colors.transparent,
            onPressed: (index) {
              // send callback
              widget.selected(index);
              // if you wish to have state:
              if (widget.stateContained) {
                if (!widget.multipleSelectionsAllowed) {
                  final selectedIndex = isSelected[index];
                  isSelected = isSelected.map((e) => e = false).toList();
                  if (widget.canUnToggle) {
                    isSelected[index] = selectedIndex;
                  }
                }
                setState(() {
                  isSelected[index] = !isSelected[index];
                });
              }
            },
            children: widget.texts
                .map(
                  (e) => Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: e,
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
