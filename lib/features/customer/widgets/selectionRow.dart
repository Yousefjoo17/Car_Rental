import 'package:carrental/core/widgets/customDropDownButton.dart';
import 'package:flutter/material.dart';

class SelectionRow extends StatelessWidget {
  const SelectionRow(
      {super.key,
      required this.dropDownval,
      required this.itemList,
      required this.name,
      required this.onChanged});
  final String name;
  final String dropDownval;
  final List<String> itemList;
  final void Function(String?) onChanged;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Row(
        children: [
          Text(
            name,
            style: const TextStyle(fontSize: 18),
          ),
          const Spacer(),
          CustomDropdown(
            value: dropDownval,
            itemsList: itemList,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
