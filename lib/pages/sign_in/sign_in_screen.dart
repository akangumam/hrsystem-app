import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  static const routeName = '/login';
  // ignore: use_super_parameters
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool isPasswordHidden = true;
  bool rememberMe = false;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onLogin() {
    // TODO: ganti dengan autentikasi nyata
    Navigator.pushReplacementNamed(context, '/main');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          // Background image
          Positioned(
            top: -100,
            left: 0,
            right: 0,
            bottom: 0,
            child: Image.asset(
              'assets/images/background.png',
              fit: BoxFit.cover,
            ),
          ),

          // Form container
          Align(
            alignment: Alignment.bottomCenter,
            child: SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 32,
                ),
                padding: const EdgeInsets.only(
                  top: 32,
                  left: 32,
                  right: 32,
                  bottom: 32,
                ),
                decoration: const BoxDecoration(
                  color: Color(0xFFFEFEFE),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header
                    Center(
                      child: Column(
                        children: const [
                          Text(
                            'Sign In',
                            style: TextStyle(
                              color: Color(0xFF101828),
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Roboto',
                              height: 1.33,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Sign in to my account',
                            style: TextStyle(
                              color: Color(0xFF475467),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Roboto',
                              height: 1.43,
                              letterSpacing: 0.10,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Email field
                    const Text(
                      'Email',
                      style: TextStyle(
                        color: Color(0xFF475467),
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Roboto',
                        height: 1.33,
                        letterSpacing: -0.20,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Container(
                      height: 44,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: const Color(0xFF98A2B3)),
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x0C101828),
                            blurRadius: 2,
                            offset: Offset(0, 1),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/icons/email.png',
                            width: 20,
                            height: 20,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: TextField(
                              controller: _emailController,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: 'My Email',
                                hintStyle: TextStyle(
                                  color: Color(0xFF98A2B3),
                                  fontSize: 14,
                                  fontFamily: 'Roboto',
                                  height: 1.43,
                                  letterSpacing: 0.25,
                                ),
                              ),
                              keyboardType: TextInputType.emailAddress,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Password field
                    const Text(
                      'Password',
                      style: TextStyle(
                        color: Color(0xFF475467),
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Roboto',
                        height: 1.33,
                        letterSpacing: -0.20,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Container(
                      height: 44,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: const Color(0xFF98A2B3)),
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x0C101828),
                            blurRadius: 2,
                            offset: Offset(0, 1),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/icons/password.png',
                            width: 20,
                            height: 20,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: TextField(
                              controller: _passwordController,
                              obscureText: isPasswordHidden,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: 'My Password',
                                hintStyle: TextStyle(
                                  color: Color(0xFF98A2B3),
                                  fontSize: 14,
                                  fontFamily: 'Roboto',
                                  height: 1.43,
                                  letterSpacing: 0.25,
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                            icon: Image.asset(
                              isPasswordHidden
                                  ? 'assets/icons/eye_closed.png'
                                  : 'assets/icons/eye_open.png',
                              width: 20,
                              height: 20,
                            ),
                            onPressed:
                                () => setState(
                                  () => isPasswordHidden = !isPasswordHidden,
                                ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Remember Me & Forgot Password
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () => setState(() => rememberMe = !rememberMe),
                          child: Row(
                            children: [
                              Image.asset(
                                rememberMe
                                    ? 'assets/icons/checked.png'
                                    : 'assets/icons/uncheck.png',
                                width: 16,
                                height: 16,
                              ),
                              const SizedBox(width: 8),
                              const Text(
                                'Remember Me',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Forgot Password',
                            style: TextStyle(
                              color: Color(0xFF7A5AF8),
                              fontSize: 12,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),

                    // Sign In button
                    GestureDetector(
                      onTap: _onLogin,
                      child: Container(
                        width: double.infinity,
                        height: 48,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 12,
                        ),
                        clipBehavior: Clip.antiAlias,
                        decoration: ShapeDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment(0.5, -0),
                            end: Alignment(0.5, 1),
                            colors: [
                              Color(0xFF8861F2),
                              Color(0xFF7544FB),
                              Color(0xFF5A2ED4),
                            ],
                          ),
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                              color: Color(0xFFA686FF),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(100),
                            ),
                          ),
                          shadows: const [
                            BoxShadow(
                              color: Color(0xFF6938EF),
                              blurRadius: 0,
                              offset: Offset(0, 0),
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        child: const Center(
                          child: Text(
                            'Sign In',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w500,
                              height: 1.43,
                              letterSpacing: 0.10,
                              shadows: [
                                Shadow(
                                  offset: Offset(0, 1),
                                  blurRadius: 16,
                                  color: Color(0xFF2D1A62),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),

                    // OR Divider
                    Row(
                      children: const [
                        Expanded(child: Divider(color: Color(0xFF98A2B3))),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            'OR',
                            style: TextStyle(
                              color: Color(0xFF98A2B3),
                              fontSize: 12,
                            ),
                          ),
                        ),
                        Expanded(child: Divider(color: Color(0xFF98A2B3))),
                      ],
                    ),
                    const SizedBox(height: 24),

                    // Alternative Sign-In
                    OutlinedButton.icon(
                      onPressed: () {},
                      icon: Image.asset(
                        'assets/icons/employee.png',
                        width: 24,
                        height: 24,
                      ),
                      label: const Text(
                        'Sign in With Employee ID',
                        style: TextStyle(color: Color(0xFF7A5AF8)),
                      ),
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Color(0xFF7A5AF8)),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                        ),
                        minimumSize: const Size(double.infinity, 48),
                      ),
                    ),
                    const SizedBox(height: 16),
                    OutlinedButton.icon(
                      onPressed: () {},
                      icon: Image.asset(
                        'assets/icons/phone.png',
                        width: 24,
                        height: 24,
                      ),
                      label: const Text(
                        'Sign in With Phone',
                        style: TextStyle(color: Color(0xFF7A5AF8)),
                      ),
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Color(0xFF7A5AF8)),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                        ),
                        minimumSize: const Size(double.infinity, 48),
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Footer Sign Up
                    Center(
                      child: Text.rich(
                        TextSpan(
                          children: const [
                            TextSpan(
                              text: 'Don’t have an account?',
                              style: TextStyle(
                                color: Color(0xFF263238),
                                fontSize: 11,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w500,
                                height: 1.45,
                                letterSpacing: -0.15,
                              ),
                            ),
                            TextSpan(
                              text: ' Sign Up Here',
                              style: TextStyle(
                                color: Color(0xFF6938EF),
                                fontSize: 11,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w500,
                                height: 1.45,
                                letterSpacing: -0.15,
                              ),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
