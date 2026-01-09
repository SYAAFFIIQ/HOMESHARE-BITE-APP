import 'package:flutter/material.dart';

void main() {
  runApp(ItemTrackerApp());
}

class Item {
  final String name;
  int quantity;

  Item(this.name, this.quantity);
}

class ItemTrackerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Item Tracker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Item> _items = [
    Item('Widget', 10),
    Item('Gadget', 5),
    Item('Sprocket', 15),
    Item('Doodad', 2),
  ];

  void _addItem(String name, int quantity) {
    setState(() {
      _items.add(Item(name, quantity));
    });
  }

  void _autoDeduct(int index) {
    setState(() {
      if (_items[index].quantity > 0) {
        _items[index].quantity -= 1;
      }
    });
  }

  void _showAddItemDialog() {
    String itemName = '';
    String quantityText = '';

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add New Item'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Item Name'),
                onChanged: (value) => itemName = value,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Quantity'),
                keyboardType: TextInputType.number,
                onChanged: (value) => quantityText = value,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                final int quantity = int.tryParse(quantityText) ?? 0;
                if (itemName.isNotEmpty && quantity > 0) {
                  _addItem(itemName, quantity);
                }
                Navigator.pop(context);
              },
              child: Text('Add'),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Item Tracker'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Project: Alpha'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _items.length,
              itemBuilder: (context, index) {
                final item = _items[index];
                return ListTile(
                  title: Text(item.name),
                  subtitle:
                      item.quantity == 5 ? Text('Auto-deducted 1m ago') : null,
                  trailing: Text(item.quantity.toString()),
                  onTap: () => _autoDeduct(index),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Add Item'),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'History'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings'),
        ],
        currentIndex: 0,
        onTap: (index) {
          if (index == 1) _showAddItemDialog();
        },
      ),
    );
  }
}
