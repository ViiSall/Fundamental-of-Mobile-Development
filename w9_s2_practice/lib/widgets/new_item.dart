import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uuid/uuid.dart';
import '../models/grocery_item.dart';
import '../models/grocery_category.dart';
import 'grocery_list.dart';

class NewItem extends StatefulWidget {
  final GroceryItem? item;
  final Mode mode;

  const NewItem({super.key, this.item, required this.mode});

  @override
  State<NewItem> createState() {
    return _NewItemState();
  }
}

class _NewItemState extends State<NewItem> {
  final _formKey = GlobalKey<FormState>();
  var uuid = Uuid();

  String _enteredName = '';
  int _enteredQuantity = 1;
  GroceryCategory _selectedCategory = GroceryCategory.fruit;

  @override
  void initState() {
    super.initState();
    if (widget.mode == Mode.editing && widget.item != null) {
      _enteredName = widget.item!.name;
      _enteredQuantity = widget.item!.quantity;
      _selectedCategory = widget.item!.category;
    }
  }

  void _saveItem() {
    final isValid = _formKey.currentState!.validate();
    if (isValid) {
      _formKey.currentState!.save();

      final newItem = GroceryItem(
        id: widget.mode == Mode.editing ? widget.item!.id : uuid.v4(),
        name: _enteredName,
        quantity: _enteredQuantity,
        category: _selectedCategory,
      );

      Navigator.of(context).pop(newItem);
    }
  }

  void _resetForm() {
    _formKey.currentState!.reset();
  }

  String? validateTitle(String? value) {
    if (value == null || value.isEmpty || value.trim().length > 50) {
      return 'Must be between 1 and 50 characters.';
    }
    return null;
  }

  String? validateQuantity(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a quantity.';
    }
    final quantity = int.tryParse(value);
    if (quantity == null || quantity <= 0) {
      return 'Must be a valid, positive number.';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.mode == Mode.editing ? 'Edit Item' : 'Add a New Item'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                maxLength: 50,
                decoration: const InputDecoration(
                  label: Text('Name'),
                ),
                validator: validateTitle,
                initialValue: widget.mode == Mode.editing ? _enteredName : '',
                onSaved: (value) {
                  _enteredName = value!;
                },
              ),
              const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        label: Text('Quantity'),
                      ),
                      initialValue: widget.mode == Mode.editing ? _enteredQuantity.toString() : '1',
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      validator: validateQuantity,
                      onSaved: (value) {
                        _enteredQuantity = int.parse(value!);
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: DropdownButtonFormField<GroceryCategory>(
                      items: [
                        for (final category in GroceryCategory.values)
                          DropdownMenuItem<GroceryCategory>(
                            value: category,
                            child: Row(
                              children: [
                                Container(
                                  width: 16,
                                  height: 16,
                                  color: category.color,
                                ),
                                const SizedBox(width: 6),
                                Text(category.label),
                              ],
                            ),
                          ),
                      ],
                      value: _selectedCategory,
                      onChanged: (value) {
                        _selectedCategory = value!;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: _resetForm,
                    child: const Text('Reset'),
                  ),
                  ElevatedButton(
                    onPressed: _saveItem,
                    child: Text(widget.mode == Mode.editing ? 'Edit Item' : 'Save Item'),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
