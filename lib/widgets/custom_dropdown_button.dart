import 'package:flutter/material.dart';

class CustomDropdownButton extends StatelessWidget {
  final List<String> items;
  final Function(String?)? onChanged;

  const CustomDropdownButton({
    Key? key,
    required this.items,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 75,
          child: Text(
            'Category',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: SizedBox(
            height: 45,
            child: DropdownButtonFormField(
              iconSize: 20,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                ),
              ),
              items: items.map((item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                );
              }).toList(),
              onChanged: onChanged,
            ),
          ),
        ),
      ],
    );
  }
}
