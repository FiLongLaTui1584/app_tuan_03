import 'package:flutter/material.dart';
import '../model/user.dart';
import 'detail.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool _checkValue1 = false;
  bool _checkValue2 = false;
  int _gender = 0;

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 15),
            Container(
              alignment: Alignment.center,
              child: const Text(
                "Information",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  icon: Icon(Icons.person),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  icon: Icon(Icons.email),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  icon: Icon(Icons.lock),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _confirmPasswordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Confirm Password',
                  icon: Icon(Icons.lock),
                ),
              ),
            ),
            const SizedBox(height: 15),
            const Text("What is your Gender?"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ListTile(
                    title: const Text("Male"),
                    leading: Radio(
                      value: 1,
                      groupValue: _gender,
                      onChanged: (value) {
                        setState(() {
                          _gender = value!;
                        });
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: ListTile(
                    title: const Text("Female"),
                    leading: Radio(
                      value: 2,
                      groupValue: _gender,
                      onChanged: (value) {
                        setState(() {
                          _gender = value!;
                        });
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: ListTile(
                    title: const Text("Other"),
                    leading: Radio(
                      value: 3,
                      groupValue: _gender,
                      onChanged: (value) {
                        setState(() {
                          _gender = value!;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            const Text("What is your Favorite?"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: CheckboxListTile(
                    title: const Text("Music"),
                    value: _checkValue1,
                    onChanged: (value) {
                      setState(() {
                        _checkValue1 = value!;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: CheckboxListTile(
                    title: const Text("Travel"),
                    value: _checkValue2,
                    onChanged: (value) {
                      setState(() {
                        _checkValue2 = value!;
                      });
                    },
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                var gender = _gender == 1
                    ? "Male"
                    : _gender == 2
                        ? "Female"
                        : "Other";

                var favorite = "";
                if (_checkValue1) {
                  favorite += "Music, ";
                }
                if (_checkValue2) {
                  favorite += "Travel, ";
                }
                if (favorite.isNotEmpty) {
                  favorite = favorite.substring(0, favorite.length - 2);
                }

                User user = User(
                  fullname: _nameController.text,
                  email: _emailController.text,
                  gender: gender,
                  favorite: favorite,
                );

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Detail(user: user),
                  ),
                );
              },
              child: const Text("Register"),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}
