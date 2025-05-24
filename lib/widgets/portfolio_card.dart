import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants.dart';

class PortfolioCard extends StatelessWidget {
  final Map<String, String> data;
  const PortfolioCard({required this.data, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: kWhite,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: Colors.black.withOpacity(0.06), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.07),
            blurRadius: 16,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.r),
              bottomLeft: Radius.circular(16.r),
            ),
            child: Image.network(
              data['image']!,
              width: 110.w,
              height: 110.h,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 16.w),
          // Texts
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 13,),
                Text(
                  data['title'] ?? '',
                  style: kMedium14.copyWith(
                    color: kTextPrimary,
                    fontWeight: FontWeight.w500,
                    fontSize: 16.sp,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 6.h),
                Row(
                  children: [
                    Text(
                      data['subtitle'] ?? '',
                      style: kRegular10.copyWith(
                        color: kTextSecondary,
                        fontWeight: FontWeight.w500,
                        fontSize: 12.sp,
                      ),
                    ),
                    Spacer(),
                    Container(
                      width: 50.w,
                      height: 26.h,
                      margin: EdgeInsets.only(right: 16.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        gradient: LinearGradient(
                          colors: [Color(0xFFF39519), Color(0xFFFFCD67)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        data['grade'] ?? '',
                        style: kMedium14.copyWith(
                          color: kWhite,
                          fontWeight: FontWeight.w700,
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  data['author'] ?? '',
                  style: kRegular10.copyWith(
                    color: Color(0xFF9E95A2),
                    fontSize: 12.sp,
                  ),
                ),
                SizedBox(height: 13,),
              ],
            ),
          ),
          // Grade badge

        ],
      ),
    );
  }
}
