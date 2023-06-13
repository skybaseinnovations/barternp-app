import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class CustomDropDown extends StatelessWidget {
  final String dropDownTitle;
  final String dropDownHint;
  final Icon dropDownIcon;
  const CustomDropDown({
    super.key,
    required this.dropDownTitle,
    required this.dropDownHint,
    required this.dropDownIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            dropDownTitle,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 60,
            decoration:
                const BoxDecoration(border: Border(bottom: BorderSide(color: Color(0xffdedede)))),
            child: Column(
              children: [
                DropdownButtonHideUnderline(
                    child: DropdownButton2(
                  isExpanded: true,
                  items: const [],
                  hint: Text(dropDownHint),
                  dropdownStyleData: const DropdownStyleData(width: 400),
                  iconStyleData: IconStyleData(icon: dropDownIcon),
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
