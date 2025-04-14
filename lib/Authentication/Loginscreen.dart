import 'package:evitalrx_task/Homescreen/Homescreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String? utmSource;
  String? utmMedium;
  String? utmCampaign;

  static const platform = MethodChannel('com.evitalrx/utm');

  @override
  void initState() {
    super.initState();

    _getUTMParams();
  }

  Future<void> _getUTMParams() async {
    try {
      final result = await platform.invokeMethod<Map>('getUTMParams');


      print('result>>>>>>>>>${result}');

      setState(() {
        utmSource = result?['utm_source'];
        utmMedium = result?['utm_medium'];
        utmCampaign = result?['utm_campaign'];
      });
    } catch (e) {
      print("Error fetching UTM: $e");

      setState(() {
        utmSource = "facebook";
        utmMedium = "social";
        utmCampaign = "april_launch";
      });
    }
  }


  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoginAttempted = false;
  bool _passwordVisible = true;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: const Text(
          "EvitalRx",
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
        child: Center(
          child: Form(
            key: _formKey,
            autovalidateMode: _isLoginAttempted
                ? AutovalidateMode.onUserInteraction
                : AutovalidateMode.disabled,
            child: Column(
              children: [
                const SizedBox(height: 30),
                Image.asset("assets/images/llast.png", height: 150, width: 150),
                const SizedBox(height: 20),

                /// UTM INFO DISPLAY
                /// UTM INFO DISPLAY
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    color: Colors.teal[100],
                    elevation: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: (utmSource != null || utmMedium != null || utmCampaign != null)
                          ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (utmSource != null)
                            Text("UTM Source: $utmSource",
                                style: const TextStyle(fontWeight: FontWeight.bold)),
                          if (utmMedium != null)
                            Text("UTM Medium: $utmMedium",
                                style: const TextStyle(fontWeight: FontWeight.bold)),
                          if (utmCampaign != null)
                            Text("UTM Campaign: $utmCampaign",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, color: Colors.orange)),
                        ],
                      )
                          : const Center(
                        child: Text(
                          "No UTM Data Found",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.redAccent),
                        ),
                      ),
                    ),
                  ),
                ),

                /// LOGIN CARD
                Card(
                  color: Color(hexColor('#5F9EA0')),
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/images/Login_Final.png",
                          height: 100,
                          width: 100,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(bottom: 20),
                          child: Text(
                            'Login to your account',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: TextFormField(
                            controller: _mobileController,
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            onEditingComplete: () =>
                                FocusScope.of(context).nextFocus(),
                            decoration: InputDecoration(
                              labelText: 'Mobile Number',
                              labelStyle: const TextStyle(color: Colors.white),
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
                              } else if (value.length < 8) {
                                return "Password must be at least 8 characters long";
                              } else if (!RegExp(
                                r'^(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[0-9])(?=.*?[!@#$%^&*()_+={};:<>|./?,-]).{8,}$',
                              ).hasMatch(value)) {
                                return "Password must contain uppercase, lowercase, number, and special character";
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () async {
                              setState(() {
                                _isLoginAttempted = true;
                              });

                              if (_formKey.currentState!.validate()) {
                                if (_mobileController.text == "9033006262" &&
                                    _passwordController.text == "eVital@12") {
                                  Fluttertoast.showToast(
                                    msg: "Successfully Login",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    backgroundColor: Colors.green,
                                    textColor: Colors.white,
                                    fontSize: 11.0,
                                  );

                                  SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                                  await prefs.setBool('isLoggedIn', true);

                                  _mobileController.clear();
                                  _passwordController.clear();
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Homescreen(),
                                    ),
                                  );
                                } else {
                                  Fluttertoast.showToast(
                                    msg: "Please enter valid authentication",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 11.0,
                                  );
                                }
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.cyan,
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
                const SizedBox(height: 15),
              ],
            ),
          ),
        ),
      ),
    );
  }

  int hexColor(String color) {
    String newColor = '0xff' + color.replaceAll('#', '');
    return int.parse(newColor);
  }
}


