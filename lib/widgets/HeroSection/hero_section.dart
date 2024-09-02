import 'dart:async';
import 'package:cross_platform_flms_application/widgets/HeroSection/hero_banner.dart';
import 'package:cross_platform_flms_application/widgets/HeroSection/hero_image.dart';
import 'package:flutter/material.dart';

class HeroSection extends StatefulWidget {
  final List<Map<String, Object>> datas;

  const HeroSection({
    super.key,
    required this.datas,
  });

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection> with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  Timer? _timer;
  late AnimationController _animationController;
  late Animation<double> _opacityAnimation;

  static final List<Map<String, Object>> detailedMovies = [
    {
      "status": true,
      "msg": "",
      "movie": {
        "_id": "f7a82ce7e16d9687e7cd9a9feb85d187",
        "name": "Chúa Tể Của Những Chiếc Nhẫn : Những Chiếc Nhẫn Quyền Năng (Phần 2)",
        "slug": "chua-te-cua-nhung-chiec-nhan-nhung-chiec-nhan-quyen-nang-phan-2",
        "origin_name": "The Lord of the Rings : The Rings of Power (Season 2)",
        "content": "Mở đầu từ một thời đại tương đối an bình, ta theo dõi một nhóm nhân vật đối đầu với sự tái xuất của cái ác ở Trung Địa. Từ nơi sâu tối tăm nhất của Dãy núi Sương mù, đến những khu rừng hùng vĩ của Lindon, vương quốc đảo Númenor ngoạn mục, những nơi xa nhất trên bản đồ. Kể cả khi không còn nữa, những vương quốc và nhân vật này vẫn để lại di sản trường tồn.",
        "type": "series",
        "poster_url": "https://phimimg.com/upload/vod/20240830-1/3af1f0341a60acb1323b675a15c53e8e.jpg",
        "thumb_url": "https://phimimg.com/upload/vod/20240830-1/d1205759c8ab4fc958ba9e71f2272a64.jpg",
        "trailer_url": "",
        "time": "76 phút/tập",
        "year": 2024,
        "category": [
          {"id": "9822be111d2ccc29c7172c78b8af8ff5", "name": "Hành Động", "slug": "hanh-dong"},
          {"id": "66c78b23908113d478d8d85390a244b4", "name": "Phiêu Lưu", "slug": "phieu-luu"},
        ],
      },
    },
    {
      "status": true,
      "msg": "",
      "movie": {
        "_id": "f7a82ce7e16d9687e7cd9a9feb85d187",
        "name": "Chúa Tể Của Những Chiếc Nhẫn : Những Chiếc Nhẫn Quyền Năng (Phần 3)",
        "slug": "chua-te-cua-nhung-chiec-nhan-nhung-chiec-nhan-quyen-nang-phan-3",
        "origin_name": "The Lord of the Rings : The Rings of Power (Season 3)",
        "content": "Mở đầu từ một thời đại",
        "type": "series",
        "poster_url": "https://phimimg.com/upload/vod/20240830-1/3af1f0341a60acb1323b675a15c53e8e.jpg",
        "thumb_url": "https://phimimg.com/upload/vod/20240830-1/d1205759c8ab4fc958ba9e71f2272a64.jpg",
        "trailer_url": "",
        "time": "76 phút/tập",
        "year": 2024,
        "category": [
          {"id": "0bcf4077916678de9b48c89221fcf8ae", "name": "Khoa Học", "slug": "khoa-hoc"},
          {"id": "68564911f00849030f9c9c144ea1b931", "name": "Viễn Tưởng", "slug": "vien-tuong"},
        ],
      },
    }
  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
    _animationController.forward();
  }

  void _startAutoUpdate() {
    _timer = Timer.periodic(const Duration(seconds: 4), (timer) {
      if (mounted) {
        setState(() {
          _currentIndex = (_currentIndex + 1) % widget.datas.length;
          _animationController.reset();
          _animationController.forward();
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Map<String, Object> movieData = (detailedMovies[_currentIndex % 2])['movie'] as Map<String, Object>;
    List<Map<String, Object>> categoriesData = movieData['category'] as List<Map<String, Object>>;

    return Stack(
      children: [
        FadeTransition(
          opacity: _opacityAnimation,
          child: HeroImage(
            imgUrl: widget.datas[_currentIndex]['thumb_url'].toString(),
          ),
        ),
        HeroBanner(
          movieData: movieData,
          categoriesData: categoriesData,
          numberMovies: widget.datas.length,
          currentIndex: _currentIndex,
          onDotClicked: (index) {
            setState(() {
              _currentIndex = index;
              _animationController.reset();
              _animationController.forward();
              _timer?.cancel();
              _startAutoUpdate();
            });
          },
        ),
      ],
    );
  }
}
