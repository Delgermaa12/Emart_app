import 'package:flutter/material.dart';

class RefundAccountScreen extends StatefulWidget {
  const RefundAccountScreen({super.key});

  @override
  State<RefundAccountScreen> createState() => _RefundAccountScreenState();
}

class _RefundAccountScreenState extends State<RefundAccountScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _accountNumberController = TextEditingController();
  final TextEditingController _accountHolderController = TextEditingController();

  String? _selectedBank;
  bool _hasExistingAccount = false;

  final List<String> _banks = [
    'Хаан банк',
    'Голомт банк',
    'ХХБ банк',
    'Төрийн банк',
    'Ард кредит банк',
    'Богд банк',
    'Капитрон банк',
    'Чингис Хаан банк',
  ];

  @override
  void initState() {
    super.initState();
    _checkExistingAccount();
  }

  void _checkExistingAccount() {
    setState(() {
      _hasExistingAccount = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Буцаалтын данс бүртгэл',
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInfoSection(),

            const SizedBox(height: 30),

            if (_hasExistingAccount) _buildExistingAccountSection(),

            _buildAccountForm(),

            const SizedBox(height: 40),

            _buildSubmitButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.blue[100]!),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.info_outline, color: Colors.blue, size: 20),
              SizedBox(width: 8),
              Text(
                'Мэдээлэл',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(
            'Дансны мэдээллийг бүртгэснээр таны захиалгын төлбөр дунд бүртгэсэн данс руу шилжин орох болно.',
            style: TextStyle(
              fontSize: 14,
              color: Colors.blue,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExistingAccountSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.green[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.green[100]!),
      ),
      child: Row(
        children: [
          Icon(Icons.check_circle, color: Colors.green[600], size: 20),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              'Таны бүртгэлтэй данс: Хаан банк •••• 1234',
              style: TextStyle(
                fontSize: 14,
                color: Colors.green[800],
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAccountForm() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle('Банк сонгох'),
          const SizedBox(height: 8),
          _buildBankDropdown(),

          const SizedBox(height: 20),

          _buildSectionTitle('Буцаалтын данс'),
          const SizedBox(height: 8),
          _buildAccountNumberField(),

          const SizedBox(height: 20),

          _buildSectionTitle('Эзэмшигчийн нэр'),
          const SizedBox(height: 8),
          _buildAccountHolderField(),
        ],
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

  Widget _buildBankDropdown() {
    return DropdownButtonFormField<String>(
      value: _selectedBank,
      items: _banks.map((String bank) {
        return DropdownMenuItem<String>(
          value: bank,
          child: Text(bank),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          _selectedBank = newValue;
        });
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Банкаа сонгоно уу';
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: 'Банк сонгох',
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

  Widget _buildAccountNumberField() {
    return TextFormField(
      controller: _accountNumberController,
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Дансны дугаар оруулна уу';
        }
        if (value.length < 8) {
          return 'Дансны дугаар буруу байна';
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: 'Дансны дугаар',
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

  Widget _buildAccountHolderField() {
    return TextFormField(
      controller: _accountHolderController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Эзэмшигчийн нэр оруулна уу';
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: 'Эзэмшигчийн нэр',
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

  Widget _buildSubmitButton() {
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
        child: Text(
          _hasExistingAccount ? 'ШИНЭЧЛЭХ' : 'БҮРТГЭХ',
          style: const TextStyle(
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
      final accountData = {
        'bank': _selectedBank,
        'accountNumber': _accountNumberController.text,
        'accountHolder': _accountHolderController.text,
      };

      print('Дансны мэдээлэл амжилттай бүртгэгдлээ: $accountData');

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
        content: Text(
          _hasExistingAccount
              ? 'Дансны мэдээлэл амжилттай шинэчлэгдлээ.'
              : 'Дансны мэдээлэл амжилттай бүртгэгдлээ.',
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
    _accountNumberController.dispose();
    _accountHolderController.dispose();
    super.dispose();
  }
}