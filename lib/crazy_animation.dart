
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CrazyAnimationPart extends StatelessWidget {
  const CrazyAnimationPart({super.key});

  @override
  Widget build(BuildContext context) {
    var size = Get.size;
    RxBool manuClicked = false.obs;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(21.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                GestureDetector(
                    onTap: (){
                      manuClicked.value = !manuClicked.value;
                    },
                    child: Icon(Icons.menu)
                ),
                SizedBox(height: 51,),
                SizedBox(
                    width: size.width,
                    height: size.width * .9,
                    child: Obx(()=>Stack(
                      children: [
                        AnimatedContainer(
                          duration:const Duration(milliseconds: 355),
                          curve: Curves.easeOut,
                          height: size.width *.9,
                          width: manuClicked.value?size.width:size.width *.45,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(manuClicked.value?55:100),

                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),

                          ),

                        ),
                        AnimatedPositioned(
                          duration:const Duration(milliseconds: 355),
                          curve: Curves.easeOut,
                          right: 0,
                          top: manuClicked.value? 65:0,
                          child: Padding(
                            padding: EdgeInsets.all(manuClicked.value? 17:0),
                            child: AnimatedContainer(
                              duration:const Duration(milliseconds: 355),
                              curve: Curves.easeOut,
                              height:manuClicked.value?size.width*.9- 65-34:size.width *.53,
                              width:manuClicked.value? size.width-42-34: size.width *.45,
                              decoration: BoxDecoration(
                                //0x use for convert int
                                // ff use opacity ff mean opacity 100%
                                color: Color(0Xff646161),
                                borderRadius: BorderRadius.circular(manuClicked.value?55:100),

                              ),

                            ),
                          ),
                        ),
                        AnimatedPositioned(
                          duration:const Duration(milliseconds: 355),
                          curve: Curves.easeOut,
                          right:manuClicked.value?17:0 ,
                          bottom:manuClicked.value?size.width*0.9-size.width *.12-17: 0,
                          child: AnimatedContainer(
                            duration:const Duration(milliseconds: 355),
                            curve: Curves.easeOut,
                            height:manuClicked.value?size.width*0.12: size.width *.35,
                            width:manuClicked.value?size.width*0.12: size.width *.45,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(100),

                            ),

                          ),

                        )
                      ],
                    ),)
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
