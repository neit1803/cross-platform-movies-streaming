import 'package:cross_platform_flms_application/config/app_colors.dart';
import 'package:cross_platform_flms_application/config/app_icons.dart';
import 'package:cross_platform_flms_application/config/dimesion.dart';
import 'package:cross_platform_flms_application/widgets/brand_block.dart';
import 'package:cross_platform_flms_application/widgets/direction_button.dart';
import 'package:flutter/material.dart';

class ListBrandCard extends StatefulWidget {
  final List<Map<String, Object>> datas;

  const ListBrandCard({
    super.key,
    required this.datas,
  });

  @override
  _ListBrandCardState createState() => _ListBrandCardState();
}

class _ListBrandCardState extends State<ListBrandCard> {
  late ScrollController _scrollController;
  bool _showBackwardButton = false;

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

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Container(
      width: width,
      padding: EdgeInsets.all(Dimensions.padding(context, 30)),
      child: _ColumBrandCard(width, height),
    );
  }

  Widget _buildGradientOverlay(double height) {
    return Positioned(
      top: 0,
      right: 0, // Di chuyển gradient overlay về bên trái
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
            stops: [0.0, 0.6, 1.0], // Điều chỉnh gradient
          ),
        ),
      ),
    );
  }

  Widget _ColumBrandCard(double width, double height) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        SizedBox(
          height: width * 0.5 * 0.13,
          child: Stack(
            fit: StackFit.expand,
            children: [
              _ListViewBrandCard(width),
              _buildGradientOverlay(height),
              _forwardButton(),
              if (_showBackwardButton)
                _backwardButton(), // Show backward button conditionally
            ],
          ),
        ),
      ],
    );
  }

  Widget _ListViewBrandCard(double width) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      controller: _scrollController,
      itemCount: widget.datas.length,
      itemBuilder: (context, index) {
        final movie = widget.datas[index];

        return Container(
          margin: EdgeInsets.symmetric(horizontal: 8),
          width: width * 0.13,
          child: BrandBlock(assetsLink: "assets/images/netflix.svg"),
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
}
