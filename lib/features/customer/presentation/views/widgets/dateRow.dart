import 'package:carrental/core/widgets/customDropDownButton.dart';
import 'package:carrental/features/customer/presentation/view_model/Date.dart';
import 'package:flutter/material.dart';

class DateRow extends StatefulWidget {
  const DateRow({super.key, required this.dateClass});

  final DateClass dateClass;
  @override
  State<DateRow> createState() => _DateRowState();
}

class _DateRowState extends State<DateRow> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          const Text(
            'start year',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          CustomDropdown(
            value: widget.dateClass.startYear,
            itemsList: widget.dateClass.years,
            onChanged: (p0) {
              setState(() {
                widget.dateClass.startYear = p0;
              });
            },
          ),
          const Text(
            'start month',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          CustomDropdown(
            value: widget.dateClass.startMonth,
            itemsList: widget.dateClass.months,
            onChanged: (p0) {
              setState(() {
                widget.dateClass.startMonth = p0;
              });
            },
          ),
        ]),
        Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          const Text(
            'end year',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          CustomDropdown(
            value: widget.dateClass.endYear,
            itemsList: widget.dateClass.years,
            onChanged: (p0) {
              setState(() {
                widget.dateClass.endYear = p0;
              });
            },
          ),
          const Text(
            'end month',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          CustomDropdown(
            value: widget.dateClass.endMonth,
            itemsList: widget.dateClass.months,
            onChanged: (p0) {
              setState(() {
                widget.dateClass.endMonth = p0;
              });
            },
          ),
        ]),
      ],
    );
  }
}
