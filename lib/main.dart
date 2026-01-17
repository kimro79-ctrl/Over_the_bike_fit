import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(const OverTheBikeFit());
}

class OverTheBikeFit extends StatelessWidget {
  const OverTheBikeFit({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.red,
      ),
      home: const SplashScreen(),
    );
  }
}

// 1. 스플래시 화면
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // 2초 후 홈 화면으로 이동
    Timer(const Duration(seconds: 2), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          // 이미지 파일명이 다를 수 있으니 확인 필요
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircularProgressIndicator(color: Colors.red),
              const SizedBox(height: 20),
              const Text("Loading...", style: TextStyle(color: Colors.white)),
            ],
          ),
        ),
      ),
    );
  }
}

// 2. 홈 화면
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CYCLE FIT'),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.png'),
            fit: BoxFit.cover,
            opacity: 0.6, // 배경을 약간 어둡게
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/icon/bike_ui_dark.png', height: 120),
            const SizedBox(height: 30),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset('assets/icon/heart.png', width: 40),
                  const SizedBox(width: 15),
                  const Text(
                    '71 bpm',
                    style: TextStyle(
                      color: Colors.redAccent,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
            // 시작 버튼 추가 (앱이 작동한다는 느낌을 줍니다)
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('라이딩을 시작합니다!')),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
              child: const Text('START RIDING', style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}
