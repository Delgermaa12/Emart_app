import 'package:flutter/material.dart';
import 'success_page.dart';
class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String? _selectedValue; // dropdown

  @override
  Widget build(BuildContext context) {
    final Color yellow = const Color(0xFFFFCC00);

    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: yellow,
        title: const Text(
          "Нууц үг сэргээх",
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),

      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(25),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              const Text(
                "И-мэйл хаягаа оруулж, жагсаалт дээрээс сонголт хийнэ үү.",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 20),

              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: "И-мэйл",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  prefixIcon: const Icon(Icons.email_outlined),
                ),
                validator: (value) {
                  if (value!.isEmpty) return "И-мэйл оруулна уу";

                  final regex = RegExp(r'^[^@]+@[^\.]+\..+$');
                  if (!regex.hasMatch(value)) return "И-мэйл буруу байна";

                  return null;
                },
              ),

              const SizedBox(height: 20),

              // DROPDOWN
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Сэргээх хэлбэр',
                  prefixIcon: const Icon(Icons.list_alt),
                  filled: true,
                  fillColor: Colors.amber[50],
                  labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: const BorderSide(color: Color(0xFFFFCC00), width: 2),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: const BorderSide(color: Color(0xFFFFCC00), width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: const BorderSide(color: Colors.orange, width: 2),
                  ),
                ),
                dropdownColor: Colors.amber[50],
                iconEnabledColor: Colors.amber[800],
                value: _selectedValue,
                items: [
                  'И-Мэйлээр сэргээх',
                  'Утасны дугаараар сэргээх',
                  'Ажилтны тусламж авах'
                ].map((option) {
                  return DropdownMenuItem(
                    value: option,
                    child: Text(option),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedValue = value;
                  });
                },
                validator: (value) =>
                value == null ? 'Сонголт хийнэ үү' : null,
              ),


              const SizedBox(height: 30),

              // SUBMIT
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: yellow,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),

                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SuccessPage(
                            email: emailController.text.trim(),
                            option: _selectedValue!,
                          ),
                        ),
                      );
                    }
                  },

                  child: const Text(
                    "Сэргээх линк илгээх",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
