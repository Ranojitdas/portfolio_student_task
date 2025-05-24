import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'portfolio_screen.dart';
import '../constants.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({Key? key}) : super(key: key);

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 1;

  final List<Widget> _screens = [
    const Scaffold(),
    const PortfolioScreen(),
    const Scaffold(),
    const Scaffold(),
  ];

  final List<String> _labels = ['Home', 'Portfolio', 'Input', 'Profile'];
  final List<Widget> _icons = [
    SvgPicture.asset('assets/icons/Home svg.svg', width: 24, height: 24),
    SvgPicture.asset('assets/icons/Portfolia svg.svg', width: 24, height: 24),
    Image.asset('assets/icons/Input svg.svg', width: 24, height: 24),
    SvgPicture.asset('assets/icons/Profile svg.svg', width: 24, height: 24),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: Container(
        height: 70.h,
        decoration: BoxDecoration(
          color: kWhite,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 8,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 250),
              curve: Curves.ease,
              left: (_selectedIndex * (1.sw / 4)) + (1.sw / 8) - 12.w,
              top: 0,
              child: Container(
                width: 24.w,
                height: 4.h,
                decoration: BoxDecoration(
                  color: kOrange,
                  borderRadius: BorderRadius.circular(2.r),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(4, (index) {
                final isSelected = _selectedIndex == index;
                final color = isSelected ? kOrange : kTabInactive;
                return Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => _selectedIndex = index),
                    behavior: HitTestBehavior.opaque,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 12.h),
                        _buildNavIcon(index, color),
                        SizedBox(height: 4.h),
                        Text(
                          _labels[index],
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w500,
                            fontSize: 12.sp,
                            color: color,
                          ),
                        ),
                        SizedBox(height: 10.h),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavIcon(int index, Color color) {
    final isSelected = _selectedIndex == index;
    final paths = [
      'assets/icons/Home svg.svg',
      'assets/icons/Portfolia svg.svg',
      'assets/icons/Input svg.svg',
      'assets/icons/Profile svg.svg',
    ];
    return SvgPicture.asset(
      paths[index],
      width: 24.w,
      height: 24.w,
      color: isSelected ? kOrange : const Color(0xFFD6D1D5),
    );
  }
}
