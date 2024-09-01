import 'package:cross_platform_flms_application/config/app_icons.dart';
import 'package:cross_platform_flms_application/config/app_text.dart';
import 'package:cross_platform_flms_application/widgets/custom_button.dart';
import 'package:cross_platform_flms_application/widgets/list_movie_card.dart';
import 'package:flutter/material.dart';

class RecommendSection extends StatefulWidget {
  final List<Map<String, Object>> datas;
  const RecommendSection({super.key, required this.datas});

  @override
  State<RecommendSection> createState() => _RecommendSectionState();
}

class _RecommendSectionState extends State<RecommendSection> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      height: height,
      width: width,
      child: Stack(
        fit: StackFit.expand,
        children: [
          _buildBackgroundImage(
              "https://phimimg.com/upload/vod/20240615-1/9893fa3368c809162415eb190a3194ea.jpg",
              width),
          _buildGradientOverlay(),
          Center(
            child: Container(
              width: width,
              height: height * 0.8,
              color: Colors.transparent,
              padding: EdgeInsets.only(top: 60),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [MovieDescription(), MovieList()],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGradientOverlay() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.black.withOpacity(1),
            Colors.black.withOpacity(0.5),
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
    );
  }

  Widget _buildBackgroundImage(url, width) {
    return Container(
      width: width,
      decoration: BoxDecoration(
          image: DecorationImage(image: NetworkImage(url), fit: BoxFit.cover)),
    );
  }

  Widget MovieList() {
    return Expanded(
        flex: 1,
        child: ListMovieCard(genre: "New release", datas: widget.datas));
  }

  Widget MovieDescription() {
    return Expanded(
      flex: 1,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        alignment: Alignment.center,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Featured in our MovieStream",
                  style: IntroductionTextStyle(),
                  textAlign: TextAlign.start,
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Best movie for you today",
                  style: RecommendTextStyle(),
                  textAlign: TextAlign.start,
                ),
              ),
              Container(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 50),
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(244, 243, 243, 0.149),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        "#1 in China",
                        style: RankingTextStyle(),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Tình Yêu Và Những Vì Sao Của Tôi",
                  style: TitleTextStyle(),
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Nữ minh tinh Tân Thần từ ngôi sao hạng A lạc rơi xuống làm trợ lý cho nam ca sĩ An Tiểu Dữ vừa ra mắt, sự nghiệp và tình yêu đả kích cùng lúc, người mạnh mẽ kiên cường như cô ấy làm sao để ngược gió trở mình, quay lại đỉnh cao. An Tiểu Dữ bề ngoài luôn không chấp nhận Tân Thần, làm sao nhìn thấy ánh sáng của nhau từ trong hiểm cảnh, nắm lấy tay nhau?",
                style: DescriptionTextStyle(),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomButton(
                    content: "Play now",
                    onPressed: () {},
                    isActive: true,
                    icon: AppIconsConfig.playIcon,
                  ),
                  SizedBox(width: 30),
                  CustomButton(
                    content: "Add Watchlist",
                    onPressed: () {},
                    isActive: false,
                    icon: AppIconsConfig.favoriteIcon,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

TextStyle IntroductionTextStyle() {
  return TextStyle(
      color: Colors.white, fontSize: 40, fontWeight: FontWeight.w600);
}

TextStyle TitleTextStyle() {
  return TextStyle(
      color: Colors.white, fontSize: 50, fontWeight: FontWeight.w700);
}

TextStyle RecommendTextStyle() {
  return TextStyle(
      color: const Color.fromRGBO(255, 255, 255, 0.8),
      fontSize: 25,
      fontWeight: FontWeight.w400);
}

TextStyle DescriptionTextStyle() {
  return TextStyle(
      color: const Color.fromRGBO(255, 255, 255, 0.6),
      fontSize: 13,
      fontWeight: FontWeight.w200);
}

TextStyle RankingTextStyle() {
  return TextStyle(
      color: const Color.fromRGBO(255, 255, 255, 0.8),
      fontSize: 13,
      fontWeight: FontWeight.w800);
}
