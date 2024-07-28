

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:carousel_slider/carousel_controller.dart';
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int activeIndex = 0;
  final controller = CarouselController();
  final urlimages = [
    
    'https://images.pexels.com/photos/6827267/pexels-photo-6827267.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
    'https://images.pexels.com/photos/3204950/pexels-photo-3204950.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
    'https://images.pexels.com/photos/2799989/pexels-photo-2799989.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
    'https://images.pexels.com/photos/11974834/pexels-photo-11974834.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'https://images.pexels.com/photos/12475522/pexels-photo-12475522.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
    'https://images.pexels.com/photos/3810967/pexels-photo-3810967.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
  'https://images.pexels.com/photos/732895/pexels-photo-732895.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  'https://images.pexels.com/photos/2902939/pexels-photo-2902939.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
  'https://images.pexels.com/photos/5195376/pexels-photo-5195376.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
  
  ];

  @override
  Widget build(BuildContext context) {
    return  Stack(
      fit:StackFit.expand,
      children: [
        Image.network(
              'https://images.pexels.com/photos/7641148/pexels-photo-7641148.jpeg?auto=compress&cs=tinysrgb&w=600',
              fit: BoxFit.cover,
            ),
        
        
        
        SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CarouselSlider.builder(
                    carouselController: controller,
                    itemCount: urlimages.length,
                    itemBuilder: (context, index, realIndex) {
                      final urlImage = urlimages[index];
                      return buildImage(urlImage, index);
                    },
                    options: CarouselOptions(
                      height: 500,
                      
                      autoPlay: true,
                      enableInfiniteScroll: false,
                      autoPlayAnimationDuration: Duration(seconds: 3),
                      enlargeCenterPage: true,
                      onPageChanged: (index, reason) => 
                          setState(() => activeIndex = index),
                    ),
                  ),
                  SizedBox(height: 12),
                  buildIndicator(),
                ],
              ),
            ),
          ),
   ] );
    
    
  }

  Widget buildIndicator() => AnimatedSmoothIndicator(
        onDotClicked: animateToSlide,
        effect: ExpandingDotsEffect(
          dotWidth: 20,
          activeDotColor: Colors.white,
        ),
        activeIndex: activeIndex,
        count: urlimages.length,
      );

  void animateToSlide(int index) => controller.animateToPage(index);

  Widget buildImage(String urlImage, int index) => Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
      
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width:2.5),
          borderRadius: BorderRadius.circular(16),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(40),
          
          child: Image.network(
            urlImage,
            fit: BoxFit.cover,
          ),
        ),
      );
}
