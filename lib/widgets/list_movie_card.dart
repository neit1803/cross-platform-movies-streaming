import 'package:cross_platform_flms_application/config/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:cross_platform_flms_application/widgets/movie_card.dart';
import 'package:cross_platform_flms_application/widgets/direction_button.dart';

class ListMovieCard extends StatefulWidget {
  final String genre;
  final List<Map<String, Object>> datas;

  const ListMovieCard({
    super.key,
    required this.genre,
    required this.datas,
  });

  @override
  _ListMovieCardState createState() => _ListMovieCardState();
}

class _ListMovieCardState extends State<ListMovieCard> {
  late ScrollController _scrollController;
  bool _showBackwardButton = false;
  int? _selectedIndex; // Lưu chỉ số của card được chọn

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          _showBackwardButton = _scrollController.offset > 0;
        });
      });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _handlingForwardButtonClick() {
    _scrollController.animateTo(
      _scrollController.offset + 500,
      duration: Duration(seconds: 1),
      curve: Curves.easeIn,
    );
  }

  void _handlingBackwardButtonClick() {
    _scrollController.animateTo(
      _scrollController.offset - 500,
      duration: Duration(seconds: 1),
      curve: Curves.easeIn,
    );
  }

  void _onCardTapped(int index, double cardWidth) {
    setState(() {
      if (_selectedIndex == index) {
        _selectedIndex = null; // Bỏ chọn nếu card đang được chọn
      } else {
        _selectedIndex = index; // Chọn card mới
      }
      if (_selectedIndex != null) {
        final selectedIndex = _selectedIndex!;
        final itemOffset = selectedIndex * (cardWidth + 16);
        if (_scrollController.hasClients) {
          final itemOffset = selectedIndex * (cardWidth + 16);
          final offset = itemOffset - _scrollController.offset;

          if (offset.abs() > cardWidth) {
            _scrollController.animateTo(
              _scrollController.offset + offset,
              duration: Duration(seconds: 1),
              curve: Curves.easeIn,
            );
          }
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Container(
      width: width,
      padding: EdgeInsets.all(10),
      child: _ColumnMovieCard(width, height),
    );
  }

  Widget _buildGradientOverlay(double height) {
    return Positioned(
      top: 0,
      right: 0,
      child: Container(
        width: 70,
        height: height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              AppColorConfig.background.withOpacity(0.0),
              AppColorConfig.background.withOpacity(0.6),
              AppColorConfig.background.withOpacity(1),
            ],
            stops: [0.0, 0.6, 1.0],
          ),
        ),
      ),
    );
  }

  Widget _ColumnMovieCard(double width, double height) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.genre, style: GenreTextStyle()),
        SizedBox(height: 20),
        SizedBox(
          height: height * (widget.genre == "New release" ? 0.6 : 0.25),
          child: Stack(
            fit: StackFit.expand,
            children: [
              _ListViewMovieCard(width),
              _buildGradientOverlay(height),
              _forwardButton(),
              if (_showBackwardButton) _backwardButton(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _ListViewMovieCard(double width) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      controller: _scrollController,
      itemCount: widget.datas.length,
      itemBuilder: (context, index) {
        final movie = widget.datas[index];
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 8),
          width: width * 0.2,
          child: MovieCard(
              movieTitle: movie['name'] as String,
              rating: 4,
              type: widget.genre,
              onPressed: () =>
                  _onCardTapped(index, width * 0.2), // Xử lý khi card được chọn
              poster: (widget.genre == "New release"
                  ? movie['poster_url']
                  : "https://phimimg.com/${movie['poster_url']}") as String,
              isActive: _selectedIndex == index),
        );
      },
    );
  }

  Widget _forwardButton() {
    return Positioned(
      right: 5,
      top: 0,
      bottom: 0,
      child: DirectionButton(
        direction: "forward",
        onPressed: () => _handlingForwardButtonClick(),
      ),
    );
  }

  Widget _backwardButton() {
    return Positioned(
      left: 5,
      top: 0,
      bottom: 0,
      child: DirectionButton(
        direction: "backward",
        onPressed: () => _handlingBackwardButtonClick(),
      ),
    );
  }

  TextStyle GenreTextStyle() {
    return TextStyle(
        fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white);
  }
}
