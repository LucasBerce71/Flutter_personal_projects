import 'package:app/screens/ImageCaroussel/slide_tile.dart';
import 'package:flutter/material.dart';

class CarouselHomePage extends StatefulWidget {

  @override
  _CarouselHomePageState createState() => _CarouselHomePageState();
}

class _CarouselHomePageState extends State<CarouselHomePage> {
  final PageController _pageController = PageController(viewportFraction: 0.8);

  int _currentPage = 0; 

  var _listSlide = [
    { 'id': 0, 'image': 'assets/images/img1.jpg' }, 
    { 'id': 1, 'image': 'assets/images/img2.jpg' }, 
    { 'id': 2, 'image': 'assets/images/img3.jpg' }, 
  ];

  @override
  void initState() {
    _pageController.addListener(() {
      int next = _pageController.page.round();
      if (_currentPage != next) {
        setState(() {
          _currentPage = next;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Caroussel Slider'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                physics: BouncingScrollPhysics(),
                controller: _pageController,
                itemCount: _listSlide.length,
                itemBuilder: (_, currentIndex) {
                  bool activePage = currentIndex == _currentPage; 
                  return SlideTile(
                    activePage: activePage,
                    image: _listSlide[currentIndex]['image'],
                  );
                },
              ),
            ),
            _buildBullets()
          ],
        ),
      ),
    );
  }

  Widget _buildBullets() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: _listSlide.map((image) {
          return InkWell(
            onTap: () {
              setState(() {
                _pageController.jumpToPage(image['id']);
                _currentPage = image['id'];
              });
            },
            child: Container(
              margin: EdgeInsets.all(10),
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: _currentPage == image['id'] ? Colors.red : Colors.grey, 
                borderRadius: BorderRadius.circular(30)
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
