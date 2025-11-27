import 'package:flutter/material.dart';
import 'address_screen.dart';

class AddressListScreen extends StatefulWidget {
  const AddressListScreen({super.key});

  @override
  State<AddressListScreen> createState() => _AddressListScreenState();
}

class _AddressListScreenState extends State<AddressListScreen> {
  final List<Map<String, dynamic>> _addresses = [
    {
      'name': 'Гэр',
      'phone': '99112233',
      'address': 'Улаанбаатар, Сүхбаатар дүүрэг, 1-р хороо',
      'isDefault': true,
    },
    {
      'name': 'Ажлын хаяг',
      'phone': '88997766',
      'address': 'Улаанбаатар, Баянзүрх дүүрэг, 8-р хороо',
      'isDefault': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Хүргэлтийн хаяг',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          // Шинэ хаяг нэмэх товч
          Padding(
            padding: const EdgeInsets.all(20),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AddressScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black45,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Colors.black45),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                icon: const Icon(Icons.add, color: Colors.black45),
                label: const Text(
                  'Шинэ хаяг нэмэх',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black45,
                  ),
                ),
              ),
            ),
          ),

          // Хаягуудын жагсаалт
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: _addresses.length,
              itemBuilder: (context, index) {
                final address = _addresses[index];
                return _buildAddressCard(address, index);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddressCard(Map<String, dynamic> address, int index) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  address['name'],
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (address['isDefault'] == true)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Text(
                      'ҮНДСЭН',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
              ],
            ),

            const SizedBox(height: 8),

            Text(
              'Утас: ${address['phone']}',
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 4),

            // Хаяг
            Text(
              address['address'],
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black87,
              ),
            ),

            const SizedBox(height: 12),

            Row(
              children: [
                if (address['isDefault'] != true)
                  TextButton(
                    onPressed: () => _setAsDefault(index),
                    child: const Text(
                      'Үндсэн болгох',
                      style: TextStyle(color: Colors.orange),
                    ),
                  ),

                const Spacer(),

                IconButton(
                  onPressed: () => _editAddress(index),
                  icon: const Icon(Icons.edit, color: Colors.blue),
                ),

                IconButton(
                  onPressed: () => _deleteAddress(index),
                  icon: const Icon(Icons.delete, color: Colors.red),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _setAsDefault(int index) {
    setState(() {
      for (var i = 0; i < _addresses.length; i++) {
        _addresses[i]['isDefault'] = (i == index);
      }
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Үндсэн хаяг амжилттай солигдлоо'),
        backgroundColor: Colors.green,
      ),
    );
  }

  void _editAddress(int index) {
    print('Засах: ${_addresses[index]['name']}');
  }

  void _deleteAddress(int index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Хаяг устгах'),
        content: Text('"${_addresses[index]['name']}" хаягийг устгах уу?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Цуцлах'),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                _addresses.removeAt(index);
              });
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Хаяг амжилттай устгагдлаа'),
                  backgroundColor: Colors.green,
                ),
              );
            },
            child: const Text(
              'Устгах',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}