import 'package:flutter/material.dart';
import '../models/grocery_item.dart';

class GroceryTile extends StatelessWidget {
  const GroceryTile({
    required this.groceryItem,
    required this.isSelected,
    required this.selectionMode,
    required this.onLongPressItem,
    required this.onSelectionChanged,
    required this.onTapItem, // Add onTapItem callback here
    super.key,
  });

  final GroceryItem groceryItem;
  final bool isSelected;
  final bool selectionMode;
  final VoidCallback onLongPressItem;
  final ValueChanged<bool?> onSelectionChanged;
  final VoidCallback onTapItem; // Add onTapItem callback here

  @override
  Widget build(BuildContext context) {
    return Container(
      color: isSelected
          ? Colors.lightBlueAccent.withOpacity(0.5)
          : Colors.transparent,
      child: ListTile(
        leading: selectionMode
            ? Checkbox(
          value: isSelected,
          onChanged: onSelectionChanged, // Handled in parent
        )
            : Container(
          width: 24,
          height: 24,
          color: groceryItem.category.color,
        ),
        title: GestureDetector(
          onLongPress: onLongPressItem, // Long press on item
          onTap: onTapItem, // Handle tap to edit item
          child: Text(groceryItem.name),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              groceryItem.quantity.toString(),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 8),
            const Icon(Icons.drag_handle), // Drag handle
          ],
        ),
      ),
    );
  }
}
