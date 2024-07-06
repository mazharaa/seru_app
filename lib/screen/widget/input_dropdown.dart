import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class InputDropdown extends StatelessWidget {
  final String label;
  final List<String> items;
  final Function(String?)? onChanged;
  const InputDropdown({
    super.key,
    required this.label,
    required this.items,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<String>(
      items: items,
      dropdownDecoratorProps: DropDownDecoratorProps(
        dropdownSearchDecoration: InputDecoration(
          label: Text(label),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 1.5, color: Colors.grey),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 1.5, color: Colors.blue),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      clearButtonProps: const ClearButtonProps(isVisible: true),
      popupProps: PopupProps.dialog(
        dialogProps: DialogProps(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        showSearchBox: true,
        searchFieldProps: TextFieldProps(
          decoration: InputDecoration(
            label: Text(label),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 1.5, color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 1.5, color: Colors.blue),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
      onChanged: onChanged,
    );
  }
}
