import 'package:flutter/material.dart';

class FilterButton extends StatelessWidget {
  final String title;
  const FilterButton({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: SizedBox(
        height: 26,
        width: 100,
        child: ElevatedButton(
            onPressed: () {},
            child: Row(
              children: [
                const Icon(
                  Icons.close,
                  size: 12,
                ),
                Text(
                  title,
                  style: const TextStyle(fontSize: 13),
                )
              ],
            )),
      ),
    );
  }
}
