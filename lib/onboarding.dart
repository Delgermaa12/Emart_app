import 'package:flutter/material.dart';
import 'login_page.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  bool _dontShowAgain = false;

  final List<Map<String, dynamic>> _pages = [
    {
      'title': 'Emart',
      'subtitle': 'Илүү чанарыг Илүү хямдаар',
      'backgroundColor': Colors.amber,
    },
    {
      'title': 'GAIN MORE BENEFIT',
      'subtitle': 'ОНЛАЙН ОФФЛАЙН ГОРИМД\n АЖИЛЛАХ ОНООНЫ КАРТ',
      'image': 'assets/1.png',
    },
    {
      'title': 'GO SHOPPING',
      'subtitle': 'ОРОН ДАЯАР ХҮРГЭХ\n ОНЛАЙН ХУДАЛДАА',
      'image': 'assets/2.png',
    },
    {
      'title': 'GLOBAL BRAND',
      'subtitle': 'БРЕНД БҮТЭЭГДЭХҮҮНИЙГ\n НЭГ ДОРООС',
      'image': 'assets/3.png',
    },
  ];

  void _goToLogin() {
    Navigator.pushReplacementNamed(context, '/login');
  }

  void _nextPage() {
    if (_currentPage < _pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _goToLogin();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: _dontShowAgain,
                        onChanged: (bool? value) {
                          setState(() {
                            _dontShowAgain = value ?? false;
                          });
                        },
                        activeColor: Colors.amber[700],
                      ),
                      const Text(
                        'Дахин үзэхгүй',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),

                  TextButton(
                    onPressed: _goToLogin,
                    child: const Text(
                      'Алгасах',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black45,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _pages.length,
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                itemBuilder: (context, index) {
                  return _buildPage(_pages[index]);
                },
              ),
            ),

            _buildBottomSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildPage(Map<String, dynamic> page) {
    final hasImage = page.containsKey('image');

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (hasImage) ...[
            Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  page['image'],
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return _buildPlaceholderIcon();
                  },
                ),
              ),
            ),
            const SizedBox(height: 100),
          ] else ...[
            Container(
                width: 1,
                height: 1,

            ),
          ],

          Text(
            page['title'],
            style: TextStyle(
              fontSize: _getTitleSize(page['title']),
              fontWeight: FontWeight.bold,
              color: Colors.black54,
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 10),

          Text(
            page['subtitle'],
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black45,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildPlaceholderIcon() {
    return Container(
      color: Colors.amber[100],
      child: const Icon(
        Icons.shopping_cart,
        size: 60,
        color: Colors.amber,
      ),
    );
  }

  Widget _buildBottomSection() {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(_pages.length, (index) {
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: _currentPage == index ? 20 : 8,
                height: 8,
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: _currentPage == index
                      ? Colors.amber[700]!
                      : Colors.grey[300]!,
                ),
              );
            }),
          ),

          const SizedBox(height: 30),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (_currentPage < _pages.length - 1)
                TextButton(
                  onPressed: _nextPage,
                  child: const Text(
                    '',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                )
              else
                const SizedBox(width: 80),

              ElevatedButton(
                onPressed: _nextPage,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber[700],
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(16),
                  elevation: 5,
                ),
                child: Icon(
                  _currentPage == _pages.length - 1
                      ? Icons.check
                      : Icons.arrow_forward,
                  color: Colors.white,
                  size: 24,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  double _getTitleSize(String title) {
    if (title.length > 15) return 28;
    if (title.length > 10) return 32;
    return 36;
  }
}