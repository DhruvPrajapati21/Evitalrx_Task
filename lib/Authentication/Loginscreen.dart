import 'package:evitalrx_task/Authentication/Providers.dart';
import 'package:evitalrx_task/Colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import '../Homescreen/Homescreen.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _mobileController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _attempted = false;
  bool _passwordVisible = true;

  @override
  Widget build(BuildContext context) {
    final utm = context.watch<UTMProvider>();
    final auth = context.read<AuthProvider>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: const Text(
          "Notes app",
          style: TextStyle(
            fontFamily: "Times New Roman",
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          autovalidateMode: _attempted
              ? AutovalidateMode.onUserInteraction
              : AutovalidateMode.disabled,
          child: Column(
            children: [
              const SizedBox(height: 30),
              Image.asset('assets/images/llast.png', height: 150, width: 150),
              const SizedBox(height: 20),

              Card(
                color: AppColors.utmCard,
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: utm.source != null || utm.medium != null || utm.campaign != null
                      ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (utm.source != null)
                        Text('UTM Source: ${utm.source}', style: const TextStyle(fontWeight: FontWeight.bold)),
                      if (utm.medium != null)
                        Text('UTM Medium: ${utm.medium}', style: const TextStyle(fontWeight: FontWeight.bold)),
                      if (utm.campaign != null)
                        Text('UTM Campaign: ${utm.campaign}', style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.orange)),
                    ],
                  )
                      : const Text('No UTM Data Found', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.redAccent)),
                ),
              ),

              const SizedBox(height: 20),

              Card(
                color: AppColors.loginCardBackground,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                elevation: 4,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Image.asset('assets/images/Login_Final.png', height: 100, width: 100),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: TextFormField(
                          controller: _mobileController,
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(10),
                          ],
                          onEditingComplete: () =>
                              FocusScope.of(context).nextFocus(),
                          decoration: InputDecoration(
                            labelText: 'Mobile Number',
                            labelStyle: TextStyle(color: AppColors.white),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: Colors.white),
                            ),
                            prefixIcon: const Icon(Icons.phone_android,
                                color: Colors.white),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter your mobile number";
                            } else if (value.length != 10) {
                              return "Mobile number must be exactly 10 digits";
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: TextFormField(
                          controller: _passwordController,
                          obscureText: _passwordVisible,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(9),
                          ],
                          decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: const TextStyle(color: Colors.white),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: Colors.white),
                            ),
                            prefixIcon: const Icon(Icons.lock_outline_rounded,
                                color: Colors.white),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _passwordVisible
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                setState(() {
                                  _passwordVisible = !_passwordVisible;
                                });
                              },
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter your Password";
                            } else if (value.length != 9) {
                              return "Password must be exactly 9 characters long";
                            } else if (!RegExp(
                              r'^(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[0-9])(?=.*?[!@#$%^&*()_+={};:<>|./?,-]).{9}$',
                            ).hasMatch(value)) {
                              return "Must contain uppercase, lowercase, number, and special char";
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(height: 24),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () async {
                            setState(() => _attempted = true);
                            if (_formKey.currentState!.validate()) {
                              if (_mobileController.text == '8780031661' && _passwordController.text == 'Notesd@12') {
                                await auth.login();
                                Fluttertoast.showToast(
                                  msg: 'Login successful',
                                  backgroundColor: AppColors.successGreen,
                                );

                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(builder: (_) => Homescreen()),
                                );
                              } else {
                                Fluttertoast.showToast(
                                  msg: 'Please enter valid authentication',
                                  backgroundColor: AppColors.warningRed,
                                );

                              }
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            padding:
                            const EdgeInsets.symmetric(vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text(
                            "Login",
                            style:
                            TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ),
                    ],
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