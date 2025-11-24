import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'address_nemeh.dart';

class PaymentPage extends StatefulWidget {
  final double totalPrice;
  const PaymentPage({super.key, required this.totalPrice});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  bool showDetails = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Сагс',
          style: GoogleFonts.notoSans(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          Stack(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.shopping_cart_outlined,
                    color: Colors.black),
              ),
              Positioned(
                right: 6,
                top: 6,
                child: Container(
                  width: 14,
                  height: 14,
                  decoration: const BoxDecoration(
                      color: Colors.red, shape: BoxShape.circle),
                  child: const Center(
                    child: Text(
                      '1',
                      style: TextStyle(fontSize: 10, color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),

      // ------------------ Body хэсэг ------------------
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                sectionContainer([
                  buildListTile(
                      Icons.location_on_outlined, 'Шинэ хаяг бүртгэх', context),
                  buildListTile(Icons.calendar_today_outlined, 'Энгийн хүргэлт',
                      context),
                  buildSubInfoTile('Нэмэлт мэдээлэл',
                      'Захиалгын нэмэлт мэдээллээ үлдээнэ үү!', Icons.info_outline),
                  buildListTile(Icons.phone_outlined, 'Хүргэлт авах утас', context),
                ]),
                const SizedBox(height: 12),
                sectionContainer([
                  buildListTile(Icons.credit_card, 'Төлбөрийн хэлбэр', context),
                  buildListTile(Icons.card_giftcard, 'Купон ашиглах', context),
                ]),
                const SizedBox(height: 12),
                sectionContainer([
                  buildListTile(Icons.credit_score_rounded, 'Ипоинт карт холбох',
                      context,
                      iconColor: Colors.orange),
                  buildListTile(Icons.receipt, 'Ибаримт байгууллагаар', context),
                  buildListTile(Icons.receipt_long, 'Ибаримт хялбар бүртгэл', context),
                  buildListTile(Icons.shopping_bag_outlined, 'Тор авах', context),
                ]),
                const SizedBox(height: 12),
                Center(
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Үйлчилгээний нөхцөл',
                      style: GoogleFonts.notoSans(
                        color: Colors.blueAccent,
                        decoration: TextDecoration.underline,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // --- Доод хэсэг ---
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(color: Colors.grey.shade300),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // ---------------- Төлбөрийн дэлгэрэнгүй товч ----------------
                GestureDetector(
                  onTap: () => setState(() => showDetails = !showDetails),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Төлбөрийн дэлгэрэнгүй',
                        style: GoogleFonts.notoSans(
                          fontSize: 15,
                          color: Colors.grey[800],
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Icon(
                        showDetails
                            ? Icons.keyboard_arrow_up
                            : Icons.keyboard_arrow_down,
                        color: Colors.grey[700],
                        size: 20,
                      ),
                    ],
                  ),
                ),

                // ---------------- Дэлгэрэнгүй хэсэг ----------------
                AnimatedCrossFade(
                  duration: const Duration(milliseconds: 200),
                  firstChild: const SizedBox.shrink(),
                  secondChild: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Нийт дүн:',
                                style: TextStyle(fontSize: 15)),
                            Text(
                              '${widget.totalPrice.toStringAsFixed(0)}₮',
                              style: const TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text('Хямдрал:',
                                style: TextStyle(fontSize: 15)),
                            Text('0₮', style: TextStyle(fontSize: 15)),
                          ],
                        ),
                        const Divider(height: 16),
                      ],
                    ),
                  ),
                  crossFadeState: showDetails
                      ? CrossFadeState.showSecond
                      : CrossFadeState.showFirst,
                ),

                // ---------------- Төлөх дүн ба товч ----------------
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Төлөх дүн:',
                      style:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      '${widget.totalPrice.toStringAsFixed(0)}₮',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                // ---------------- Төлбөр төлөх товч ----------------
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                    minimumSize: const Size(double.infinity, 48),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      shape: const RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20)),
                      ),
                      builder: (_) => buildPaymentOptions(context),
                    );
                  },
                  child: Text(
                    'Төлбөр төлөх',
                    style: GoogleFonts.notoSans(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ---------------- Helper Widgets ----------------

  Widget sectionContainer(List<Widget> children) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(children: children),
    );
  }

  Widget buildListTile(IconData icon, String title, BuildContext context,
      {Color iconColor = Colors.amber}) {
    return ListTile(
      leading: Icon(icon, color: iconColor),
      title: Text(
        title,
        style: GoogleFonts.notoSans(
          fontSize: 14,
          color: Colors.black87,
        ),
      ),
      trailing: const Icon(Icons.chevron_right, color: Colors.grey),
      onTap: () {
        if (title == 'Шинэ хаяг бүртгэх') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const NewAddressPage()),
          );
        }
      },
    );
  }

  Widget buildSubInfoTile(String title, String subtitle, IconData icon) {
    return ListTile(
      leading: Icon(icon, color: Colors.amber),
      title: Text(
        title,
        style: GoogleFonts.notoSans(
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: GoogleFonts.notoSans(
          fontSize: 12,
          color: Colors.grey[600],
        ),
      ),
      trailing: const Icon(Icons.chevron_right, color: Colors.grey),
    );
  }

  Widget switchTile(String title) {
    return SwitchListTile(
      title: Text(
        title,
        style: GoogleFonts.notoSans(fontSize: 14),
      ),
      value: false,
      onChanged: (_) {},
      activeColor: Colors.amber,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
    );
  }

  Widget buildPaymentOptions(BuildContext context) {
    final paymentMethods = [
      {
        'name': 'Төлбөрийн картаар',
        'desc': 'Бүх банкны картаар төлөх',
        'icon': Icons.credit_card,
        'color': Colors.amber,
      },
      {
        'name': 'SocialPay',
        'desc': 'SocialPay-ээр төлөх',
        'icon': Icons.currency_exchange,
        'color': Colors.blueAccent,
      },
      {
        'name': 'Дансаар',
        'desc': 'Интернет банк, мобайл банкаар төлөх',
        'icon': Icons.account_balance,
        'color': Colors.green,
      },
      {
        'name': 'QPay',
        'desc': 'QR код уншуулж төлөх',
        'icon': Icons.qr_code_2,
        'color': Colors.black87,
      },
      {
        'name': 'MonPay',
        'desc': 'MonPay-ээр төлөх',
        'icon': Icons.wallet,
        'color': Colors.indigo,
      },
      {
        'name': 'StorePay',
        'desc': 'Storepay-ээр төлөх',
        'icon': Icons.swap_horiz,
        'color': Colors.blue,
      },
      {
        'name': 'Pass',
        'desc': 'Pass-аар төлөх',
        'icon': Icons.payment,
        'color': Colors.green.shade700,
      },
      {
        'name': 'RedPoint',
        'desc': 'RedPoint-оор төлөх',
        'icon': Icons.redeem,
        'color': Colors.red,
      },
      {
        'name': 'Digi Pay',
        'desc': 'Digi pay-ээр төлөх',
        'icon': Icons.account_balance_wallet_outlined,
        'color': Colors.teal,
      },
    ];

    String? selected; // дотоод сонголт хадгалах

    return StatefulBuilder(
      builder: (context, setSheetState) => Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          color: Colors.white,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Төлбөрийн хэлбэрээ сонгоно уу',
              style: GoogleFonts.notoSans(
                fontSize: 17,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),

            // --- Төлбөрийн жагсаалт ---
            Flexible(
              child: SingleChildScrollView(
                child: Column(
                  children: paymentMethods.map((m) {
                    final isSelected = selected == m['name'];
                    return GestureDetector(
                      onTap: () => setSheetState(() => selected = m['name'] as String),
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 4),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? Colors.amber.withOpacity(0.15)
                              : Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: isSelected ? Colors.amber : Colors.transparent,
                            width: 1.5,
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(m['icon'] as IconData,
                                color: m['color'] as Color, size: 32),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    m['name'] as String,
                                    style: GoogleFonts.notoSans(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    m['desc'] as String,
                                    style: GoogleFonts.notoSans(
                                      fontSize: 12,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            if (isSelected)
                              const Icon(Icons.check_circle,
                                  color: Colors.amber, size: 22),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),

            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (selected != null) {
                  Navigator.pop(context, selected);
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
                minimumSize: const Size(double.infinity, 48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'Хадгалах',
                style: GoogleFonts.notoSans(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
