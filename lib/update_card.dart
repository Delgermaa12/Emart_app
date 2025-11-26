import 'package:flutter/material.dart';

class UpdateCardInfoPage extends StatefulWidget {
  const UpdateCardInfoPage({super.key});

  @override
  State<UpdateCardInfoPage> createState() => _UpdateCardInfoPageState();
}

class _UpdateCardInfoPageState extends State<UpdateCardInfoPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nationalityController =
  TextEditingController(text: "Монгол");
  final TextEditingController registerAController = TextEditingController();
  final TextEditingController registerBController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController districtController = TextEditingController();
  final TextEditingController khorooController = TextEditingController();
  final TextEditingController buildingController = TextEditingController();
  final TextEditingController doorController = TextEditingController();
  final TextEditingController birthDateController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  String gender = "Сонгох";
  String married = "Үгүй";

  @override
  Widget build(BuildContext context) {
    const primaryYellow = Color(0xFFFFD200);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Гишүүний картын мэдээлэл шинэчлэх"),
        backgroundColor: primaryYellow,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
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
              buildTextFormField("Иргэншил", nationalityController),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: buildTextFormField(
                      "Регистрийн эхний үсэг",
                      registerAController,
                      isRegister: true,
                      registerPart: 'A',
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: buildTextFormField(
                      "Регистрийн дараагийн үсэг",
                      registerBController,
                      isRegister: true,
                      registerPart: 'B',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              buildTextFormField("Овог", lastNameController),
              const SizedBox(height: 12),
              buildTextFormField("Нэр", firstNameController),
              const SizedBox(height: 12),
              buildTextFormField("Хот/Аймаг", cityController),
              const SizedBox(height: 12),
              buildTextFormField("Дүүрэг/Сум", districtController),
              const SizedBox(height: 12),
              buildTextFormField("Хороо/Баг", khorooController),
              const SizedBox(height: 12),
              buildTextFormField("Байр", buildingController),
              const SizedBox(height: 12),
              buildTextFormField("Хаалганы дугаар", doorController),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: buildTextFormField(
                        "Төрсөн өдөр", birthDateController),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      value: gender,
                      decoration: const InputDecoration(
                        labelText: "Хүйс",
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value == "Сонгох") {
                          return "Хүйс сонгоно уу";
                        }
                        return null;
                      },
                      items: const [
                        DropdownMenuItem(
                            value: "Сонгох", child: Text("Сонгох")),
                        DropdownMenuItem(
                            value: "Эрэгтэй", child: Text("Эрэгтэй")),
                        DropdownMenuItem(
                            value: "Эмэгтэй", child: Text("Эмэгтэй")),
                      ],
                      onChanged: (value) {
                        setState(() {
                          gender = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: buildTextFormField("Утасны дугаар", phoneController,
                        isPhone: true),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      value: married,
                      decoration: const InputDecoration(
                        labelText: "Гэрлэсэн эсэх",
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Сонгоно уу";
                        }
                        return null;
                      },
                      items: const [
                        DropdownMenuItem(value: "Тийм", child: Text("Тийм")),
                        DropdownMenuItem(value: "Үгүй", child: Text("Үгүй")),
                      ],
                      onChanged: (value) {
                        setState(() {
                          married = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Мэдээлэл амжилттай хадгалагдлаа"),
                        backgroundColor: Colors.green,
                        duration: Duration(seconds: 2),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryYellow,
                  foregroundColor: Colors.black,
                  minimumSize: const Size(double.infinity, 45),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "ХАДГАЛАХ",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextFormField(String label, TextEditingController controller,
      {bool isPhone = false, bool isRegister = false, String registerPart = ''}) {
    return TextFormField(
      controller: controller,
      keyboardType: isPhone ? TextInputType.phone : TextInputType.text,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "$label оруулна уу";
        }
        if (isPhone && value.length != 8) {
          return "Утасны дугаар 8 оронтой байх ёстой";
        }
        if (isRegister) {
          if (registerPart == 'A' && !RegExp(r'^[A-Za-z]{2}$').hasMatch(value)) {
            return "2 үсэг оруулна уу";
          }
          if (registerPart == 'B' && !RegExp(r'^[0-9]{8}$').hasMatch(value)) {
            return "8 тоо оруулна уу";
          }
        }
        return null;
      },
    );
  }
}
