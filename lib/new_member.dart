import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewMemberPage extends StatefulWidget {
  const NewMemberPage({super.key});

  @override
  State<NewMemberPage> createState() => _NewMemberPageState();
}

class _NewMemberPageState extends State<NewMemberPage> {
  bool isAgreed = false;

  @override
  Widget build(BuildContext context) {
    const primaryYellow = Color(0xFFFFD200);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ҮЙЛЧИЛГЭЭНИЙ ГЭРЭЭ",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        backgroundColor: primaryYellow,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ePoint logo
            Center(
              child: Text(
                "ePoint",
                style: GoogleFonts.poppins(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                  color: primaryYellow,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // ҮЙЛЧИЛГЭЭНИЙ ГЭРЭЭ гарчиг (зүүн талд)
            Text(
              "ҮЙЛЧИЛГЭЭНИЙ ГЭРЭЭ",
              style: GoogleFonts.notoSans(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
              textAlign: TextAlign.left,
            ),

            const SizedBox(height: 20),

            // Гэрээний текст — хар цэгтэй жагсаалт маягаар
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    _AgreementBullet(
                        text:
                        "Гишүүнээр элсэхийг хүссэн үйлчлүүлэгч 16-с дээш настай байх ба Emart Mongolia Арр-д өөрийн мэдээллийг бөглөн гишүүнээр элсэнэ."),
                    _AgreementBullet(
                        text:
                        "Emart Mongolia App-p бүртгүүлсэн тохиолдолд биет карт эзэмшихгүйгээр гар утасны апп дээрээ оноо хуримтлуулах, зарцуулна."),
                    _AgreementBullet(
                        text:
                        "Имартын онооны карт унших боломжгүй Имарт дэлгүүр дотор үйл ажиллагаа явуулж буй бусад байгууллагуудаас бүтээгдэхүүн худалдаж хуримтлуулах боломжгүй."),
                    _AgreementBullet(
                        text:
                        "Үйлчлүүлэгчийн хүсэлтээр картыг цуцалж болох бөгөөд хуримтлагдсан оноо хүчингүй болно."),
                    _AgreementBullet(
                        text:
                        "Гишүүнд зориулсан арга хэмжээ, урамшууллын мэдээлэл түгээх үйлчилгээ мөн адил цуцлагдана."),
                    _AgreementBullet(
                        text:
                        "Үйлчлүүлэгч 12 сарын хугацаанд гишүүний картаа, 24 сарын хугацаанд оноогоо ашиглаагүй тохиолдолд цуцлагдан ашиглах боломжгүй болно."),
                    _AgreementBullet(
                        text:
                        "Имарт онооны карт эзэмших хүсэлт болон оноог хуримтлуулах/зарцуулах нөхцөлийг хүлээн зөвшөөрч хувь хүний мэдээллээ үнэн зөв бөглөсөн."),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Checkbox хэсэг
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(color: primaryYellow, width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Checkbox(
                    value: isAgreed,
                    onChanged: (value) {
                      setState(() {
                        isAgreed = value ?? false;
                      });
                    },
                    activeColor: primaryYellow,
                  ),
                  Expanded(
                    child: Text(
                      "Би үйлчилгээний гэрээг хүлээн зөвшөөрч байна.",
                      style: GoogleFonts.notoSans(fontSize: 15),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // Button
            Center(
              child: ElevatedButton(
                onPressed: isAgreed
                    ? () {
                  // SnackBar гаргах
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        "Амжилттай",
                        style: TextStyle(color: Colors.white),
                      ),
                      backgroundColor: Colors.green,
                      duration: Duration(seconds: 2),
                    ),
                  );
                }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: isAgreed ? Colors.yellow : Colors.grey,
                  minimumSize: const Size(400, 45),
                ),
                child: const Text(
                  "ҮРГЭЛЖЛҮҮЛЭХ",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}

// Хар цэг бүхий гэрээний мөр бүр
class _AgreementBullet extends StatelessWidget {
  final String text;
  const _AgreementBullet({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "• ",
            style: TextStyle(fontSize: 20, height: 1.4),
          ),
          Expanded(
            child: Text(
              text,
              style: GoogleFonts.notoSans(fontSize: 15, height: 1.5),
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    );
  }
}
