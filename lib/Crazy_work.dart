import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'crazy_animation.dart';

class LogoAnimation extends StatefulWidget {
  //final RxBool menuClicked;
  const LogoAnimation({super.key});

  @override
  State<LogoAnimation> createState() => _LogoAnimationState();
}

class _LogoAnimationState extends State<LogoAnimation> {

  Timer timer = Timer(Duration.zero,(){});

  bool shouldAnimate = false;
  bool shouldShowText = false;

  Future<void> initAnimate() async{
    timer = Timer(const Duration(seconds: 1),(){
      setState(() {
        shouldAnimate = true;
        shouldShowText = true;
      });

    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initAnimate();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width,
      height: size.height,

      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            SizedBox(
              width: size.width,
              height: size.height,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 777),
                    curve: Curves.decelerate,
                    width: shouldAnimate?size.width*.55:size.width*.41,
                    height: shouldAnimate?size.width*.55:size.width*.41,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(1000),
                    ),
                  ),

                  AnimatedContainer(
                    duration: const Duration(milliseconds: 555),
                    curve: Curves.decelerate,
                    width: shouldAnimate?size.width*.48:size.width*.41,
                    height: shouldAnimate?size.width*.48:size.width*.41,
                    decoration: BoxDecoration(
                      color: Color(0xff4b4b4b),
                      borderRadius: BorderRadius.circular(1000),
                    ),
                  ),

                  Container(
                    width: size.width*.41,
                    height: size.width*.41,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(1000),
                    ),
                  ),

                  GestureDetector(
                    onTap: (){
                      Get.to( CrazyAnimationPart());
                      //menuClicked.value = !menuClicked.value;
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 555),
                      curve: Curves.decelerate,
                      child: AnimatedOpacity(
                        duration: const Duration(milliseconds: 2000),
                        curve: Curves.decelerate,
                        opacity: shouldAnimate ? 1 :0,
                        child: Text("GO",
                          style: TextStyle(
                            fontSize: 31,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],

        ),
      ),
    );
  }
}