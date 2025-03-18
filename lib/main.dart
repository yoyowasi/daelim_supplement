import 'package:flutter/material.dart';
import 'home_page.dart';
import 'search_page.dart';
import 'ai_doctor_page.dart';
import 'my_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white, // 전체 배경색 변경
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white, // AppBar 배경색 흰색으로 변경
          elevation: 0, // 그림자 제거
          titleTextStyle: TextStyle(color: Colors.black, fontSize: 20), // 글자색 검정
          iconTheme: IconThemeData(color: Colors.black), // 아이콘 색 변경
        ),
      ),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    HomePage(),
    SearchPage(),
    AiDoctorPage(),
    MyPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // MainScreen 배경색 설정
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white, // 네비게이션 바 배경색 변경
        type: BottomNavigationBarType.fixed, // 배경색 적용 안정화
        currentIndex: _currentIndex,
        selectedItemColor: Colors.blue, // 선택된 아이템 색상
        unselectedItemColor: Colors.grey, // 선택되지 않은 아이템 색상
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: '검색'),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'AI 약사'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: '마이 페이지'),
        ],
      ),
    );
  }
}
