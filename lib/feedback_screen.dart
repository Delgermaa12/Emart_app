import 'package:flutter/material.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({super.key});

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  String _selectedCategory = 'Аппликэйшн';
  String _selectedSubCategory = 'Бараа';
  final TextEditingController _feedbackController = TextEditingController();

  final List<String> _categories = [
    'Аппликэйшн',
    'Вебсайт',
    'Хургэлт',
  ];

  final Map<String, List<String>> _subCategories = {
    'Аппликэйшн': ['Бараа', 'Төлбөр', 'Хэрэглэх', 'Бусад'],
    'Вебсайт': ['Захмалга', 'Дизайн', 'Ажиллагаа', 'Бусад'],
    'Хургэлт': ['Үйлчилгээ', 'Хүргэлт', 'Бараа чанар', 'Бусад'],
  };

  @override
  void initState() {
    super.initState();
    _selectedSubCategory = _subCategories[_selectedCategory]!.first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Санал хүсэлт',
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
            _buildSectionTitle('Санал хүсэлтийн төрөл'),
            const SizedBox(height: 10),
            _buildCategorySelector(),

            const SizedBox(height: 30),

            _buildSectionTitle('Дэлгэрэнгүй'),
            const SizedBox(height: 10),
            _buildSubCategorySelector(),

            const SizedBox(height: 30),

            _buildSectionTitle('Санал хүсэлт'),
            const SizedBox(height: 10),
            _buildFeedbackTextField(),

            const SizedBox(height: 40),
            _buildSubmitButton(),

            const SizedBox(height: 20),
            _buildPhoneNumber(),
          ],
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

  Widget _buildCategorySelector() {
    return Container(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _categories.length,
        itemBuilder: (context, index) {
          final category = _categories[index];
          final isSelected = _selectedCategory == category;

          return Padding(
            padding: const EdgeInsets.only(right: 10),
            child: ChoiceChip(
              label: Text(
                category,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black87,
                  fontWeight: FontWeight.w500,
                ),
              ),
              selected: isSelected,
              onSelected: (selected) {
                setState(() {
                  _selectedCategory = category;
                  _selectedSubCategory = _subCategories[category]!.first;
                });
              },
              backgroundColor: Colors.grey[200],
              selectedColor: Colors.orange,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSubCategorySelector() {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: _subCategories[_selectedCategory]!.map((subCategory) {
        final isSelected = _selectedSubCategory == subCategory;

        return ChoiceChip(
          label: Text(
            subCategory,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black87,
              fontWeight: FontWeight.w500,
            ),
          ),
          selected: isSelected,
          onSelected: (selected) {
            setState(() {
              _selectedSubCategory = subCategory;
            });
          },
          backgroundColor: Colors.grey[200],
          selectedColor: Colors.orange,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildFeedbackTextField() {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        controller: _feedbackController,
        maxLines: null,
        expands: true,
        textAlignVertical: TextAlignVertical.top,
        decoration: const InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(16),
          hintText: 'Санал хүсэлтээ энд бичнэ үү...',
          hintStyle: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }

  Widget _buildSubmitButton() {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: _submitFeedback,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.orange,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: const Text(
          'ИЛГЭЭХ',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildPhoneNumber() {
    return const Center(
      child: Column(
        children: [
          Text(
            '76110101',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.orange,
            ),
          ),
          SizedBox(height: 5),
          Text(
            'Холбогдох утасны дугаар',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  void _submitFeedback() {
    final feedback = _feedbackController.text.trim();

    if (feedback.isEmpty) {
      _showSnackBar('Санал хүсэлтээ бичнэ үү');
      return;
    }

    print('Санал хүсэлт илгээгдлээ:');
    print('Ангилал: $_selectedCategory');
    print('Дэд ангилал: $_selectedSubCategory');
    print('Санал хүсэлт: $feedback');

    _showSuccessDialog();
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.orange,
      ),
    );
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
          'Таны санал хүсэлт амжилттай илгээгдлээ. Баярлалаа!',
          textAlign: TextAlign.center,
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Dialog хаах
              Navigator.pop(context); // Санал хүсэлт дэлгэц рүү буцах
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
    _feedbackController.dispose();
    super.dispose();
  }
}