import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstScreen(),
    );
  }
}

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  bool _isLoading = true;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Loading Button'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: const Text('Button1'),
              ),
              SizedBox(height: height * 0.05),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                  fixedSize: _isLoading == true
                      ? Size(width * 0.8, height * 0.05)
                      : Size(width * 0.4, height * 0.07),
                  shape: RoundedRectangleBorder(
                    borderRadius: _isLoading == true
                        ? BorderRadius.circular(width * 0.03)
                        : BorderRadius.circular(width * 0.1),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    _isLoading = false;
                  });
                  Future.delayed(
                    const Duration(seconds: 4),
                    () {
                      setState(() {
                        _isLoading = true;
                      });
                    },
                  );
                },
                child: _isLoading == true
                    ? const Text('Button2')
                    : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Text('Loading'),
                          SpinKitCircle(
                            color: Colors.white,
                            size: width * 0.07,
                          ),
                        ],
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
