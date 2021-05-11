import 'package:boarding_exercise/data.dart';
import 'package:boarding_exercise/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BoardingPage extends StatefulWidget {
  @override
  _BoardingPageState createState() => _BoardingPageState();
}

class _BoardingPageState extends State<BoardingPage> {
  int currentState = 0;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Color(0xffECF8FF),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                vertical: (SizeConfig.safeBlockVertical * 2.92).roundToDouble(),
                horizontal:
                    (SizeConfig.safeBlockHorizontal * 5).roundToDouble(),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  currentState != 0
                      ? IconButton(
                          onPressed: () {
                            currentState--;
                            setState(() {});
                          },
                          icon: Icon(
                            Icons.arrow_back_ios,
                            size: (SizeConfig.safeBlockHorizontal * 5.56)
                                .roundToDouble(),
                          ),
                        )
                      : SizedBox(),
                  currentState != 2
                      ? TextButton(
                          onPressed: () {},
                          child: Text(
                            'Skip',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              fontSize: (SizeConfig.safeBlockHorizontal * 4.4)
                                  .roundToDouble(),
                            ),
                          ),
                        )
                      : SizedBox(),
                ],
              ),
            ),
            Align(
              alignment: imageLocations[currentState],
              child: Container(
                child: SvgPicture.asset(
                  imageUrl[currentState],
                  height: SizeConfig.screenHeight * 0.75,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal:
                      (SizeConfig.safeBlockHorizontal * 7.78).roundToDouble(),
                  vertical:
                      (SizeConfig.safeBlockVertical * 4.5).roundToDouble(),
                ),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      titles[currentState],
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: (SizeConfig.safeBlockHorizontal * 5)
                            .roundToDouble(),
                      ),
                    ),
                    SizedBox(
                      height:
                          (SizeConfig.safeBlockVertical * 3.25).roundToDouble(),
                    ),
                    Text(
                      descriptions[currentState],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xff878F95),
                        fontSize: (SizeConfig.safeBlockHorizontal * 3.89)
                            .roundToDouble(),
                      ),
                    ),
                    SizedBox(
                      height:
                          (SizeConfig.safeBlockVertical * 3.25).roundToDouble(),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            PaginationClip(currentState == 0),
                            SizedBox(
                              width: (SizeConfig.safeBlockHorizontal * 1.1)
                                  .roundToDouble(),
                            ),
                            PaginationClip(currentState == 1),
                            SizedBox(
                              width: (SizeConfig.safeBlockHorizontal * 1.1)
                                  .roundToDouble(),
                            ),
                            PaginationClip(currentState == 2),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            if (currentState != 2) {
                              currentState++;
                              setState(() {});
                            }
                          },
                          child: SvgPicture.asset(
                            'images/next_button.svg',
                            width: (SizeConfig.safeBlockHorizontal * 9.72)
                                .roundToDouble(),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PaginationClip extends StatelessWidget {
  final bool isActive;

  PaginationClip(this.isActive);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(32),
      child: Container(
        color: isActive ? Color(0xff6686D8) : Color(0xffCBD6F3),
        width: isActive
            ? (SizeConfig.safeBlockHorizontal * 6.67).roundToDouble()
            : (SizeConfig.safeBlockHorizontal * 4.4).roundToDouble(),
        height: (SizeConfig.safeBlockVertical * 1.3).roundToDouble(),
      ),
    );
  }
}
