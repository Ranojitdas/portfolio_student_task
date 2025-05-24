import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constants.dart';
import '../widgets/portfolio_card.dart';

class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({Key? key}) : super(key: key);

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen>
    with SingleTickerProviderStateMixin {
  final TextEditingController _searchController = TextEditingController();
  final List<Map<String, String>> _projects = [
    {
      'title': 'Kemampuan Merangkum Tulisan',
      'subtitle': 'BAHASA SUNDA',
      'author': 'Oleh Al-Baiqi Samaan',
      'grade': 'A',
      'image':
          'https://res.cloudinary.com/deuhpyrku/image/upload/v1748106791/image_1_u3dfxx.png',
    },
    {
      'title': 'Kemampuan Merangkum Tulisan',
      'subtitle': 'BAHASA SUNDA',
      'author': 'Oleh Al-Baiqi Samaan',
      'grade': 'A',
      'image':
          'https://res.cloudinary.com/deuhpyrku/image/upload/v1748106791/image_2_mrmnjs.png',
    },
    {
      'title': 'Kemampuan Merangkum Tulisan',
      'subtitle': 'BAHASA SUNDA',
      'author': 'Oleh Al-Baiqi Samaan',
      'grade': 'A',
      'image':
          'https://res.cloudinary.com/deuhpyrku/image/upload/v1748106790/image_3_nxrtqq.png',
    },
    {
      'title': 'Kemampuan Merangkum Tulisan',
      'subtitle': 'BAHASA SUNDA',
      'author': 'Oleh Al-Baiqi Samaan',
      'grade': 'A',
      'image':
          'https://res.cloudinary.com/deuhpyrku/image/upload/v1748106791/image_4_utl5ph.png',
    },
    {
      'title': 'Kemampuan Merangkum Tulisan',
      'subtitle': 'BAHASA SUNDA',
      'author': 'Oleh Al-Baiqi Samaan',
      'grade': 'A',
      'image':
          'https://res.cloudinary.com/deuhpyrku/image/upload/v1748106791/image_5_x3acxo.png',
    },
  ];
  String _searchText = '';
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> filteredProjects =
        _projects
            .where(
              (project) => project['title']!.toLowerCase().contains(
                _searchText.toLowerCase(),
              ),
            )
            .toList();

    return Scaffold(
      backgroundColor: kBackground,
      appBar: AppBar(
        backgroundColor: kWhite,
        elevation: 0,
        title: Padding(
          padding: EdgeInsets.only(left: 8.w),
          child: Text(
            'Portfolio',
            style: TextStyle(
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w500,
              fontSize: 20.sp,
              color: kTextPrimary,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 8.w),
            child: Row(
              children: [
                SvgPicture.asset(
                  'assets/icons/Shopping.svg',
                  color: kOrange,
                  width: 24.w,
                  height: 24.w,
                ),
                SizedBox(width: 20.w),
                SvgPicture.asset(
                  'assets/icons/bell-icon.svg',
                  color: kOrange,
                  width: 24.w,
                  height: 24.w,
                ),
                SizedBox(width: 8.w),
              ],
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            color: kWhite,
            child: TabBar(
              controller: _tabController,
              labelColor: kOrange,
              unselectedLabelColor: kTextPrimary,
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(width: 2.5, color: kOrange),
              ),
              labelStyle: kMedium14.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: 14.sp,
              ),
              unselectedLabelStyle: kMedium14.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: 14.sp,
              ),
              labelPadding: EdgeInsets.zero,
              tabs: [
                Tab(text: 'Project'),
                Tab(text: 'Saved'),
                Tab(text: 'Shared'),
                Tab(text: 'Achievement'),
              ],
            ),
          ),
          if (_tabController.index == 0)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      onChanged: (value) {
                        setState(() => _searchText = value);
                      },
                      decoration: InputDecoration(
                        hintText: 'Search a project',
                        hintStyle: kRegular10.copyWith(
                          color: const Color(0xFF9E95A2),
                          fontSize: 16.sp,
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 0,
                        ),
                        filled: true,
                        fillColor: kWhite,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          borderSide: BorderSide(
                            color: kOrange.withOpacity(0.15),
                            width: 1,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          borderSide: BorderSide(
                            color: kOrange.withOpacity(0.15),
                            width: 1,
                          ),
                        ),
                        suffixIcon: Container(
                          width: 28.w,
                          height: 28.w,
                          margin: EdgeInsets.all(7.w),
                          decoration: BoxDecoration(
                            color: kOrange,
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Center(
                            child: SvgPicture.asset(
                              'assets/icons/Search.svg',
                              color: kWhite,
                              width: 16.w,
                              height: 16.w,
                            ),
                          ),
                        ),
                      ),
                      style: kRegular10.copyWith(fontSize: 16.sp),
                    ),
                  ),
                ],
              ),
            ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              physics: const ClampingScrollPhysics(),
              children: [
                // Project Tab
                Stack(
                  children: [
                    ListView.builder(
                      padding: EdgeInsets.only(bottom: 80.h),
                      itemCount: filteredProjects.length,
                      itemBuilder:
                          (context, index) =>
                              PortfolioCard(data: filteredProjects[index]),
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 16.h,
                      child: Center(
                        child: Container(
                          width: 104.w,
                          height: 34.h,
                          decoration: BoxDecoration(
                            color: kOrange,
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/filter.svg',
                                  color: kWhite,
                                  width: 18.w,
                                  height: 12.w,
                                ),
                                SizedBox(width: 8.w),
                                Text(
                                  'Filter',
                                  style: kMedium14.copyWith(
                                    color: kWhite,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                // Saved Tab
                Container(),
                // Shared Tab
                Container(),
                // Achievement Tab
                Container(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
