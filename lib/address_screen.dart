import 'package:flutter/material.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  final _formKey = GlobalKey<FormState>();

  // Form fields
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _districtController = TextEditingController();
  final TextEditingController _subDistrictController = TextEditingController();
  final TextEditingController _bagKhorooController = TextEditingController();
  final TextEditingController _khoroololController = TextEditingController();
  final TextEditingController _bairController = TextEditingController();
  final TextEditingController _tootController = TextEditingController();
  final TextEditingController _detailController = TextEditingController();
  final TextEditingController _what3wordsController = TextEditingController();

  String? _selectedProvince;
  String? _selectedCity;

  final List<String> _provinces = [
    'Улаанбаатар',
    'Архангай',
    'Баян-Өлгий',
    'Баянхонгор',
    'Булган',
    'Говь-Алтай',
    'Говьсүмбэр',
    'Дархан-Уул',
    'Дорноговь',
    'Дорнод',
    'Дундговь',
    'Завхан',
    'Орхон',
    'Өвөрхангай',
    'Өмнөговь',
    'Сүхбаатар',
    'Сэлэнгэ',
    'Төв',
    'Увс',
    'Ховд',
    'Хөвсгөл',
    'Хэнтий',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Хүргэлтийн хаяг бүртгэх',
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionTitle('Хаягийн нэр'),
              const SizedBox(height: 8),
              _buildTextField(
                controller: _nameController,
                hintText: 'Жишээ: Гэр, Ажлын хаяг',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Хаягийн нэр оруулна уу';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),

              _buildSectionTitle('Утас'),
              const SizedBox(height: 8),
              _buildTextField(
                controller: _phoneController,
                hintText: 'Утасны дугаар',
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Утасны дугаар оруулна уу';
                  }
                  if (value.length < 8) {
                    return 'Утасны дугаар буруу байна';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),

              _buildSectionTitle('Хот/аймаг'),
              const SizedBox(height: 8),
              _buildDropdown(
                value: _selectedProvince,
                items: _provinces,
                hint: 'Хот/аймаг сонгох',
                onChanged: (value) {
                  setState(() {
                    _selectedProvince = value;
                    _selectedCity = null;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Хот/аймаг сонгоно уу';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),

              _buildSectionTitle('Сум/дүүрэг'),
              const SizedBox(height: 8),
              _buildTextField(
                controller: _districtController,
                hintText: 'Сум/дүүрэг',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Сум/дүүрэг оруулна уу';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),

              _buildSectionTitle('Баг/хороо'),
              const SizedBox(height: 8),
              _buildTextField(
                controller: _bagKhorooController,
                hintText: 'Баг/хороо',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Баг/хороо оруулна уу';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),

              _buildSectionTitle('Хотхон (заавал биш)'),
              const SizedBox(height: 8),
              _buildTextField(
                controller: _khoroololController,
                hintText: 'Хотхон',
              ),

              const SizedBox(height: 20),

              _buildSectionTitle('Байр (заавал биш)'),
              const SizedBox(height: 8),
              _buildTextField(
                controller: _bairController,
                hintText: 'Байр',
              ),

              const SizedBox(height: 20),

              _buildSectionTitle('Тоот (заавал биш)'),
              const SizedBox(height: 8),
              _buildTextField(
                controller: _tootController,
                hintText: 'Тоот',
              ),

              const SizedBox(height: 20),

              _buildSectionTitle('Дэлгэрэнгүй хаяг'),
              const SizedBox(height: 8),
              _buildTextField(
                controller: _detailController,
                hintText: 'Дэлгэрэнгүй хаяг',
                maxLines: 3,
              ),

              const SizedBox(height: 20),

              _buildSectionTitle('What3words'),
              const SizedBox(height: 8),
              _buildTextField(
                controller: _what3wordsController,
                hintText: 'Жишээ: ааруул.салаа.бууц',
              ),

              const SizedBox(height: 40),

              _buildRegisterButton(),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: Colors.black87,
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines,
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey[300]!),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.orange),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.red),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
      ),
    );
  }

  Widget _buildDropdown({
    required String? value,
    required List<String> items,
    required String hint,
    required Function(String?) onChanged,
    String? Function(String?)? validator,
  }) {
    return DropdownButtonFormField<String>(
      value: value,
      items: items.map((String item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Text(item),
        );
      }).toList(),
      onChanged: onChanged,
      validator: validator,
      decoration: InputDecoration(
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey[300]!),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.orange),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
      ),
    );
  }

  Widget _buildRegisterButton() {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: _submitForm,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.orange,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: const Text(
          'БҮРТГЭХ',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final addressData = {
        'name': _nameController.text,
        'phone': _phoneController.text,
        'province': _selectedProvince,
        'district': _districtController.text,
        'bagKhoroo': _bagKhorooController.text,
        'khoroolol': _khoroololController.text,
        'bair': _bairController.text,
        'toot': _tootController.text,
        'detail': _detailController.text,
        'what3words': _what3wordsController.text,
      };

      print('Хаяг амжилттай бүртгэгдлээ: $addressData');

      _showSuccessDialog();
    }
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          'Амжилттай',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.green,
          ),
        ),
        content: const Text(
          'Хаяг амжилттай бүртгэгдлээ.',
          textAlign: TextAlign.center,
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: const Text(
              'OK',
              style: TextStyle(color: Colors.orange),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _districtController.dispose();
    _subDistrictController.dispose();
    _bagKhorooController.dispose();
    _khoroololController.dispose();
    _bairController.dispose();
    _tootController.dispose();
    _detailController.dispose();
    _what3wordsController.dispose();
    super.dispose();
  }
}