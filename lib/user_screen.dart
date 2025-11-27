import 'package:emart_app/address_list_screen.dart';
import 'package:emart_app/connect_card.dart';
import 'package:emart_app/user_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'ipoint_page.dart';
import 'change_pass_settings.dart';
import 'feedback_screen.dart';
import 'refund_account.dart';
import 'coupon_screen.dart';

class MyPage extends StatelessWidget {
  final User user;
  MyPage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = const Color(0xFFFFCC00);
    final textStyle = GoogleFonts.notoSans(fontSize: 16, color: Colors.black87);

    Widget buildListTile(IconData icon, String title,
        {VoidCallback? onTap, Widget? trailing}) {
      return ListTile(
        leading: Icon(icon, color: Colors.grey[700]),
        title: Text(title, style: textStyle),
        trailing: trailing ?? const Icon(Icons.chevron_right),
        onTap: onTap,
      );
    }

    void showLanguageSelector(BuildContext context) {
      showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
        builder: (context) {
          return Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Хэл сонгох",
                    style: GoogleFonts.notoSans(
                        fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                ListTile(
                  leading: const Icon(Icons.language, color: Colors.blueAccent),
                  title: const Text("Монгол хэл"),
                  onTap: () {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Монгол хэл сонгогдлоо")),
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.flag_outlined, color: Colors.red),
                  title: const Text("English"),
                  onTap: () {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("English selected")),
                    );
                  },
                ),
              ],
            ),
          );
        },
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,

      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 28,
                    backgroundImage: AssetImage('assets/profile.jpg'),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(user.name,
                          style: GoogleFonts.notoSans(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 6),
                      Container(
                        width: 120,
                        height: 6,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(3),
                        ),
                        child: FractionallySizedBox(
                          widthFactor: 0.4,
                          alignment: Alignment.centerLeft,
                          child: Container(
                            decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(3),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const Divider(height: 1),
            sectionTitle("Миний"),
            buildListTile(Icons.confirmation_num_outlined, "Купон", onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CouponScreen()),
              );
            }),
            buildListTile(Icons.shopping_bag_outlined, "Худалдан авалт"),
            buildListTile(Icons.receipt_long_outlined, "Төлбөрийн баримт"),
            buildListTile(Icons.location_on_outlined, "Хүргэлтийн хаяг", onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AddressListScreen()),
              );
            }),
            buildListTile(Icons.credit_card_outlined, "Банкны карт"),
            buildListTile(Icons.card_membership_outlined, "Ипойнт карт", onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ConnectCardPage()),
              );
            }),
            buildListTile(Icons.account_balance_wallet_outlined, "Буцаалтын данс бүртгэл", onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const RefundAccountScreen()),
              );
            }),
            buildListTile(Icons.document_scanner_outlined, "Ибаримт хялбар бүртгэл"),
            buildListTile(Icons.favorite_border, "Хадгалсан бараа"),
            const Divider(height: 1),

            sectionTitle("Бусад"),
            buildListTile(Icons.chat_bubble_outline, "Санал хүсэлт",
              onTap:(){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FeedbackScreen()),
                );}),
            buildListTile(
              Icons.language, "Хэл солих",
              onTap: () => showLanguageSelector(context),
              trailing: const Icon(Icons.arrow_drop_up_outlined),
            ),
            buildListTile(
              Icons.key_outlined,
              "Нууц үг солих",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SettingsScreen()),
                );
              },
            ),
            buildListTile(Icons.list_alt_outlined, "Хэрэглэгчийн судалгаа"),
            buildListTile(Icons.lock_outline, "Гүйлгээний нууц үг"),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget sectionTitle(String title) {
    return Container(
      width: double.infinity,
      color: Colors.grey[200],
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Text(title,
          style: GoogleFonts.notoSans(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black87)),
    );
  }
}
