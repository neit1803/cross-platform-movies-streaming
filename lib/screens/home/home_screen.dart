import 'package:cross_platform_flms_application/config/app_colors.dart';
import 'package:cross_platform_flms_application/config/app_icons.dart';
import 'package:cross_platform_flms_application/widgets/custom_button.dart';
import 'package:cross_platform_flms_application/widgets/list_movie_card.dart';
import 'package:cross_platform_flms_application/widgets/movie_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void helloWorld() {
    print("hello world");
  }

  static final List<Map<String, Object>> widgets = [
    {
      "modified": {"time": "2024-08-30T12:32:20.000Z"},
      "_id": "64e6098144c759b0eaba7129a71067e9",
      "name": "Tam Quốc",
      "slug": "tam-quoc",
      "origin_name": "Three Kingdoms",
      "poster_url":
          "https://phimimg.com/upload/vod/20240830-1/fed61e8483edccce93a0a1b9110c6c56.jpg",
      "thumb_url":
          "https://phimimg.com/upload/vod/20240830-1/8a15cf1f042ac8a876870c7f49d0d3b4.jpg",
      "year": 2010
    },
    {
      "modified": {"time": "2024-08-30T12:29:39.000Z"},
      "_id": "8e0346c7a627447a3faaec4b7c924ce8",
      "name": "Thong Thả Nhịp Yêu",
      "slug": "thong-tha-nhip-yeu",
      "origin_name": "Love Andante",
      "poster_url":
          "https://phimimg.com/upload/vod/20240830-1/9a91a58a36f6a9a67d86980f340d4287.jpg",
      "thumb_url":
          "https://phimimg.com/upload/vod/20240830-1/b221564da46180797a14cde3267f8e44.jpg",
      "year": 2024
    },
    {
      "modified": {"time": "2024-08-30T12:28:26.000Z"},
      "_id": "0c167b368c00b672390fa54be52468ec",
      "name": "Kẻ Hủy Diệt Zero",
      "slug": "ke-huy-diet-zero",
      "origin_name": "Terminator Zero",
      "poster_url":
          "https://phimimg.com/upload/vod/20240830-1/e3ff19e90398cf4001043eddc07cde14.jpg",
      "thumb_url":
          "https://phimimg.com/upload/vod/20240830-1/172ec18f84b355388a0a442bd7a62cc9.jpg",
      "year": 2024
    },
    {
      "modified": {"time": "2024-08-30T12:26:18.000Z"},
      "_id": "234bb0f6d31ccfa1f610bbfd3676db26",
      "name": "Trung Học Trong Trắng",
      "slug": "trung-hoc-trong-trang",
      "origin_name": "Renai Battle Royale",
      "poster_url":
          "https://phimimg.com/upload/vod/20240830-1/d1b5fe76296447217c6395d550cd0641.jpg",
      "thumb_url":
          "https://phimimg.com/upload/vod/20240830-1/77577f56344890805c46e6c6588961a0.jpg",
      "year": 2024
    },
    {
      "modified": {"time": "2024-08-30T12:19:07.000Z"},
      "_id": "6e8f16fbb6f611b642892184828a35ae",
      "name": "KAOS",
      "slug": "kaos",
      "origin_name": "KAOS",
      "poster_url":
          "https://phimimg.com/upload/vod/20240830-1/84a746f5d61e0520ca80a95bcae1c88b.jpg",
      "thumb_url":
          "https://phimimg.com/upload/vod/20240830-1/c84a58ad58b71c802bb870a982e960e2.jpg",
      "year": 2024
    },
    {
      "modified": {"time": "2024-08-30T11:22:37.000Z"},
      "_id": "0850bbddccf61bac0957a00d043aedcb",
      "name": "Pachinko (Phần 2)",
      "slug": "pachinko-phan-2",
      "origin_name": "Pachinko (Season 2)",
      "poster_url":
          "https://phimimg.com/upload/vod/20240820-1/33aacf53e7daff8132043c8e98957368.jpg",
      "thumb_url":
          "https://phimimg.com/upload/vod/20240820-1/92fc6c8db3e5b6b08e9bf209c0873d91.jpg",
      "year": 2024
    },
    {
      "modified": {"time": "2024-08-30T11:21:49.000Z"},
      "_id": "aaa97bcc0fca801927941e0ab185442f",
      "name": "Vĩnh Dạ Trường Minh",
      "slug": "vinh-da-truong-minh",
      "origin_name": "Dawn Is Breaking",
      "poster_url":
          "https://phimimg.com/upload/vod/20240820-1/53cd6f9660fb73cb83099e18d04a5895.jpg",
      "thumb_url":
          "https://phimimg.com/upload/vod/20240820-1/27cc3b64ae0a4bca9b8a093c64988f7a.jpg",
      "year": 2024
    },
    {
      "modified": {"time": "2024-08-30T11:20:52.000Z"},
      "_id": "eb9996ba82b8594e08eaa35e3e753922",
      "name": "Người Duy Nhất Đó",
      "slug": "nguoi-duy-nhat-do",
      "origin_name": "The On1y One",
      "poster_url":
          "https://phimimg.com/upload/vod/20240822-1/e8190d2ebd456d331dbc1e8f3a2456ad.jpg",
      "thumb_url":
          "https://phimimg.com/upload/vod/20240822-1/e6f973acfdb15b23fc4532444bbfc6af.jpg",
      "year": 2024
    },
    {
      "modified": {"time": "2024-08-30T10:56:57.000Z"},
      "_id": "2e02c00f6c743a3ed88083c51b735f90",
      "name":
          "Chúa Tể Của Những Chiếc Nhẫn : Những Chiếc Nhẫn Quyền Năng (Phần 1)",
      "slug": "chua-te-cua-nhung-chiec-nhan-nhung-chiec-nhan-quyen-nang-phan-1",
      "origin_name": "The Lord of the Rings : The Rings of Power (Season 1)",
      "poster_url":
          "https://phimimg.com/upload/vod/20240830-1/da6cc4673b9eb77b48ab53f379078b36.jpg",
      "thumb_url":
          "https://phimimg.com/upload/vod/20240830-1/b90edabcd95ef5bfe426eca6ef117ab4.jpg",
      "year": 2022
    },
    {
      "modified": {"time": "2024-08-28T15:24:28.000Z"},
      "_id": "2255538166d2e6f3c6097c2c4df4e0be",
      "name": "Can Đảm Để Yêu",
      "slug": "can-dam-de-yeu",
      "origin_name": "Sister's Palpitate With Excitement",
      "poster_url":
          "https://phimimg.com/upload/vod/20240828-1/edb601dbc82a826b6bba1ec6cf878db7.jpg",
      "thumb_url":
          "https://phimimg.com/upload/vod/20240828-1/33fcf51ecf2e0599909ead7eaba27ca9.jpg",
      "year": 2020
    },
    {
      "modified": {"time": "2024-08-28T12:55:47.000Z"},
      "_id": "9083886512a1293b8ec542bc27feab3d",
      "name": "Bố Tôi Là Người Hùng",
      "slug": "bo-toi-la-nguoi-hung",
      "origin_name": "My Hero My Daddy",
      "poster_url":
          "https://phimimg.com/upload/vod/20240828-1/8a4e3c5caccaa33ecab3924adae80d3e.jpg",
      "thumb_url":
          "https://phimimg.com/upload/vod/20240828-1/0b0f7a7d45ab0403d46d218cd9c9b6f9.jpg",
      "year": 2019
    },
    {
      "modified": {"time": "2024-08-28T12:49:36.000Z"},
      "_id": "bdaccd7781386e6e39630d62b39afc40",
      "name": "Bộ Ba Huyền Thoại",
      "slug": "bo-ba-huyen-thoai",
      "origin_name": "Trident",
      "poster_url":
          "https://phimimg.com/upload/vod/20240828-1/9cab9b066954a1397cb10410043543be.jpg",
      "thumb_url":
          "https://phimimg.com/upload/vod/20240828-1/62ce8150f909c755b3266d42182fd5a6.jpg",
      "year": 2020
    },
    {
      "modified": {"time": "2024-08-28T12:40:37.000Z"},
      "_id": "604b22548fbebba00ec67d8b69c09e56",
      "name": "Bác Sĩ Đường",
      "slug": "bac-si-duong",
      "origin_name": "Dr. Tang",
      "poster_url":
          "https://phimimg.com/upload/vod/20240828-1/0a606ff67d5e38a92a7c93e6b55051f5.jpg",
      "thumb_url":
          "https://phimimg.com/upload/vod/20240828-1/955d77af19c31fbfba3f12a1f02c371c.jpg",
      "year": 2022
    },
    {
      "modified": {"time": "2024-08-28T12:35:52.000Z"},
      "_id": "f48f34e789c8201a49e32f43405078d0",
      "name": "Ác Mộng Trên Phố Elm 4: Kẻ Làm Chủ Giấc Mơ",
      "slug": "ac-mong-tren-pho-elm-4-ke-lam-chu-giac-mo",
      "origin_name": "A Nightmare on Elm Street 4: The Dream Master",
      "poster_url":
          "https://phimimg.com/upload/vod/20240828-1/f2e5d1fef7b5ff266966e8dbee9ed377.jpg",
      "thumb_url":
          "https://phimimg.com/upload/vod/20240828-1/45a07a62a37de6b4811bd23ca4d64b99.jpg",
      "year": 1988
    },
    {
      "modified": {"time": "2024-08-28T12:34:07.000Z"},
      "_id": "4ca82b2a861f70cd15d83085b000dbde",
      "name": "Ác Mộng Phố Elm 3",
      "slug": "ac-mong-pho-elm-3",
      "origin_name": "A Nightmare on Elm Street 3: Dream Warriors",
      "poster_url":
          "https://phimimg.com/upload/vod/20231117-1/2b66191481f29348a70b1843d34cb2a2.jpg",
      "thumb_url":
          "https://phimimg.com/upload/vod/20231117-1/2dce0aa6cf3fc8bdc832b5596ba3799b.jpg",
      "year": 1987
    },
    {
      "modified": {"time": "2024-08-28T12:33:03.000Z"},
      "_id": "0b6b2c2092fa735afd2b9b1da3d5db43",
      "name": "Ác Mộng Trên Phố Elm 2: Sự Trả Thù Của Freddy",
      "slug": "ac-mong-tren-pho-elm-2-su-tra-thu-cua-freddy",
      "origin_name": "A Nightmare on Elm Street 2: Freddy's Revenge",
      "poster_url":
          "https://phimimg.com/upload/vod/20240828-1/828b6099ca64a47b21a16cc70a597486.jpg",
      "thumb_url":
          "https://phimimg.com/upload/vod/20240828-1/e411b5326a31c7898710b5f6704af4af.jpg",
      "year": 1985
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
          child: Container(
              margin: EdgeInsets.only(top: 15.0),
              child: Column(
                children: [
                  CustomButton(
                      content: "Login", onPressed: helloWorld, isActive: true),
                  SizedBox(height: 10),
                  CustomButton(
                    content: "Add Watchlist",
                    onPressed: helloWorld,
                    isActive: false,
                    icon: AppIconsConfig.favoriteIcon,
                  ),
                  SizedBox(height: 10),
                  ListMovieCard(genre: 'New Release', datas: widgets)
                ],
              ))),
    );
  }
}
