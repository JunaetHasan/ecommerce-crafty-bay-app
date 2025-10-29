
import 'package:flutter/material.dart';

class SizePicker extends StatefulWidget {
  const SizePicker({super.key, required this.sizes, required this.onSelected, this.initialSelected});
  final List<String> sizes;
  final Function (int selectIndex) onSelected;
  final initialSelected;

  @override
  State<SizePicker> createState() => _SizePickerState();
}

class _SizePickerState extends State<SizePicker> {


  @override
  void initState() {
    selectedSizeIndex =widget.initialSelected;
    super.initState();
  }

  int selectedSizeIndex = 0;


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.sizes.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            widget.onSelected(index);
            selectedSizeIndex = index;
            if (mounted) {
              setState(() {});
            }
          },
          child: Container(
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              border: Border.all(color: Colors.black),
              color: selectedSizeIndex == index ? Colors.green : null,
            ),
            child: Text(widget.sizes[index]),
          ),
        );
      },
    );
  }
}