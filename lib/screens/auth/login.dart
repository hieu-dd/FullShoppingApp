import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:full_shop_app/const/colors.dart';
import 'package:full_shop_app/extension/string.dart';
import 'package:full_shop_app/global/global_method.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login-screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FocusNode _passwordFocusNode = FocusNode();
  bool _obscureText = true;
  String _emailAddress = '';
  String _password = '';
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void dispose() {
    _passwordFocusNode.dispose();
    super.dispose();
  }

  void _submitForm() async {
    final isValid = _formKey.currentState?.validate();
    FocusScope.of(context).unfocus();
    if (isValid ?? false) {
      _formKey.currentState!.save();
      setState(() {
        _isLoading = true;
      });
      try {
        await _auth.signInWithEmailAndPassword(
          email: _emailAddress,
          password: _password,
        );
        Navigator.of(context).canPop() ? Navigator.of(context).pop() : null;
      } on FirebaseAuthException catch (error) {
        GlobalMethod.showAlertDialog(
            "Error", error.message ?? "Có lỗi xảy ra", null, context);
      } catch (error) {
        GlobalMethod.showAlertDialog("Error", "Có lỗi xảy ra", null, context);
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.95,
            child: RotatedBox(
              quarterTurns: 2,
              child: WaveWidget(
                config: CustomConfig(
                  gradients: [
                    [ColorsConsts.gradiendFStart, ColorsConsts.gradiendLStart],
                    [ColorsConsts.gradiendFEnd, ColorsConsts.gradiendLEnd],
                  ],
                  durations: [19440, 10800],
                  heightPercentages: [0.20, 0.25],
                  blur: MaskFilter.blur(BlurStyle.solid, 10),
                  gradientBegin: Alignment.bottomLeft,
                  gradientEnd: Alignment.topRight,
                ),
                waveAmplitude: 0,
                size: Size(
                  double.infinity,
                  double.infinity,
                ),
              ),
            ),
          ),
          Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 80),
                height: 120.0,
                width: 120.0,
                decoration: BoxDecoration(
                  //  color: Theme.of(context).backgroundColor,
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: NetworkImage(
                      'https://image.flaticon.com/icons/png/128/869/869636.png',
                    ),
                    fit: BoxFit.fill,
                  ),
                  shape: BoxShape.rectangle,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: TextFormField(
                          key: ValueKey('email'),
                          validator: (value) {
                            if (value.isNullOrEmpty() ||
                                !value!.contains('@')) {
                              return 'Please enter a valid email address';
                            }
                            return null;
                          },
                          textInputAction: TextInputAction.next,
                          onEditingComplete: () => FocusScope.of(context)
                              .requestFocus(_passwordFocusNode),
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              border: const UnderlineInputBorder(),
                              filled: true,
                              prefixIcon: Icon(Icons.email),
                              labelText: 'Email Address',
                              fillColor: Theme.of(context).backgroundColor),
                          onSaved: (value) {
                            _emailAddress = value ?? '';
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: TextFormField(
                          key: ValueKey('Password'),
                          validator: (value) {
                            if (value.isNullOrEmpty() || value!.length < 7) {
                              return 'Please enter a valid Password';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.emailAddress,
                          focusNode: _passwordFocusNode,
                          decoration: InputDecoration(
                              border: const UnderlineInputBorder(),
                              filled: true,
                              prefixIcon: Icon(Icons.lock),
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _obscureText = !_obscureText;
                                  });
                                },
                                child: Icon(_obscureText
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                              ),
                              labelText: 'Password',
                              fillColor: Theme.of(context).backgroundColor),
                          onSaved: (value) {
                            _password = value ?? '';
                          },
                          obscureText: _obscureText,
                          onEditingComplete: _submitForm,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(width: 10),
                          _isLoading
                              ? CircularProgressIndicator()
                              : ElevatedButton(
                                  style: ButtonStyle(
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                      side: BorderSide(
                                          color: ColorsConsts.backgroundColor),
                                    ),
                                  )),
                                  onPressed: _submitForm,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Login',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 17),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Icon(
                                        Icons.person_outlined,
                                        size: 18,
                                      )
                                    ],
                                  )),
                          SizedBox(width: 20),
                        ],
                      ),
                    ],
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
