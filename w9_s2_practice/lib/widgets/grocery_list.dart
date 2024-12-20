import 'package:flutter/material.dart';
import '../models/grocery_item.dart';
import 'grocery_tile.dart';
import 'new_item.dart';

enum Mode { creating, editing, normal, selection }

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  final List<GroceryItem> _groceryItems = [];
  final Set<GroceryItem> _selectedItems = {};
  Mode _currentMode = Mode.normal;

  void _addItem() async {
    final newItem = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => const NewItem(mode: Mode.creating),
      ),
    );

    if (newItem != null) {
      setState(() {
        _groceryItems.add(newItem);
      });
    }
  }

  void _editItem(GroceryItem item) async {
    final editedItem = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => NewItem(item: item, mode: Mode.editing),
      ),
    );

    if (editedItem != null) {
      setState(() {
        final index = _groceryItems.indexOf(item);
        if (index != -1) {
          _groceryItems[index] = editedItem;
        }
      });
    }
  }

  void _deleteSelectedItems() {
    setState(() {
      _groceryItems.removeWhere((item) => _selectedItems.contains(item));
      _selectedItems.clear();
      _currentMode = Mode.normal;
    });
  }

  void _toggleSelection(GroceryItem item) {
    setState(() {
      if (_selectedItems.contains(item)) {
        _selectedItems.remove(item);
      } else {
        _selectedItems.add(item);
      }

      if (_selectedItems.isEmpty) {
        _currentMode = Mode.normal;
      }
    });
  }

  void _longPressItem(GroceryItem item) {
    setState(() {
      _currentMode = Mode.selection;
      _selectedItems.add(item);
    });
  }

  void _exitSelectionMode() {
    setState(() {
      _selectedItems.clear();
      _currentMode = Mode.normal;
    });
  }

  void _onReorder(int oldIndex, int newIndex) {
    setState(() {
      if (newIndex > oldIndex) {
        newIndex -= 1; // Adjust for shifting
      }
      final item = _groceryItems.removeAt(oldIndex);
      _groceryItems.insert(newIndex, item);
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget content;

    if (_groceryItems.isNotEmpty) {
      content = ReorderableListView.builder(
        onReorder: _onReorder,
        itemCount: _groceryItems.length,
        itemBuilder: (ctx, index) {
          final item = _groceryItems[index];
          return GroceryTile(
            key: ValueKey(item),
            groceryItem: item,
            isSelected: _selectedItems.contains(item),
            selectionMode: _currentMode == Mode.selection,
            onLongPressItem: () {
              if (_currentMode == Mode.normal) {
                _longPressItem(item);
              } else {
                _toggleSelection(item);
              }
            },
            onSelectionChanged: (isSelected) {
              setState(() {
                if (isSelected ?? false) {
                  _selectedItems.add(item);
                } else {
                  _selectedItems.remove(item);
                }
                if (_selectedItems.isEmpty) {
                  _currentMode = Mode.normal;
                }
              });
            },
            onTapItem: () {
              // When the user taps on the item, go to the edit screen
              _editItem(item);
            },
          );
        },
      );
    } else {
      content = const Center(child: Text('No items added yet.'));
    }

    return Scaffold(
      appBar: AppBar(
        leading: _currentMode == Mode.selection
            ? IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: _exitSelectionMode,
          tooltip: 'Exit Selection Mode',
        )
            : null,
        title: Text(
          _currentMode == Mode.selection
              ? '${_selectedItems.length} selected item(s)'
              : 'Your Groceries',
        ),
        actions: [
          if (_currentMode == Mode.selection)
            IconButton(
              onPressed: _deleteSelectedItems,
              icon: const Icon(Icons.delete),
              tooltip: 'Remove Selected Items',
            )
          else
            IconButton(
              onPressed: _addItem,
              icon: const Icon(Icons.add),
              tooltip: 'Add Item',
            ),
        ],
      ),
      body: content,
    );
  }
}