import 'package:aiview/model/Global.dart';
import 'package:aiview/page/CameralistEvent.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/gestures.dart';
import 'package:page_transition/page_transition.dart';

class PieCharts extends StatefulWidget {
  const PieCharts({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => PieChartSample3State();
}

class PieChartSample3State extends State {
  int touchedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.3,
      child: PieChart(
        PieChartData(
            pieTouchData: PieTouchData(
                touchCallback: (FlTouchEvent event, pieTouchResponse) {
              setState(() {
                if (!event.isInterestedForInteractions ||
                    pieTouchResponse == null ||
                    pieTouchResponse.touchedSection == null) {
                  touchedIndex = -1;
                  return; 
                }
                touchedIndex =
                    pieTouchResponse.touchedSection!.touchedSectionIndex;
                switch (touchedIndex) {
                  case 0:
                    Navigator.push(context,PageTransition(type: PageTransitionType.rightToLeft,duration: Duration(milliseconds:  Config.timeDruation),
                        reverseDuration: Duration(milliseconds:  Config.timeDruation),child:CameraViewList()));
                    setState(() {
                      Config.shossenface = true;
                      Config.shossenscurity = false;
                      Config.shossensafe = false;
                    });
                    break;
                  case 1:
                    Navigator.push(context,PageTransition(type: PageTransitionType.rightToLeft,duration: Duration(milliseconds:  Config.timeDruation),
                        reverseDuration: Duration(milliseconds:  Config.timeDruation),child:CameraViewList()));
                    setState(() {
                      Config.shossenface = false;
                      Config.shossenscurity = true;
                      Config.shossensafe = false;
                    });
                    break;
                  case 2:
                    Navigator.push(context,PageTransition(type: PageTransitionType.rightToLeft,duration: Duration(milliseconds:  Config.timeDruation),
                        reverseDuration: Duration(milliseconds:  Config.timeDruation),child:CameraViewList()));
                    setState(() {
                      Config.shossenface = false;
                      Config.shossenscurity = false;
                      Config.shossensafe = true;
                    });
                    break;
                }
              });
            }),
            borderData: FlBorderData(
              show: false,
            ),
            sectionsSpace: 0,
            centerSpaceRadius: 20,
            sections: showingSections()),
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(3, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 20.0 : 16.0;
      final radius = isTouched ? 110.0 : 100.0;
      final widgetSize = isTouched ? 55.0 : 40.0;

      switch (i) {
        case 0:
          return PieChartSectionData(
            color: Colors.lightBlueAccent,
            value: 120,
            title: '50',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.lightBlueAccent,
            ),
            // facechart.svg
            badgeWidget: SvgPicture.asset('assets/IconApp/safeiconchart.svg'),
            badgePositionPercentageOffset: .98,
          );
        case 1:
          return PieChartSectionData(
            color: const Color(0xff0293ee),
            value: 120,
            title: '40',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xff0293ee),
              // color: Colors.lightBlueAccent,
            ),
            badgeWidget: SvgPicture.asset('assets/IconApp/facechart.svg'),
            badgePositionPercentageOffset: .98,
          );
        case 2:
          return PieChartSectionData(
            color: const Color(0xff845bef),
            value: 120,
            // title: '130',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xff845bef),
            ),
            badgeWidget: SvgPicture.asset('assets/IconApp/antoanchart.svg'),
            badgePositionPercentageOffset: .98,
          );

        default:
          throw 'Oh no';
      }
    });
  }
}

class _Badge extends StatelessWidget {
  final String svgAsset;
  final double size;
  final Color borderColor;

  const _Badge(
    this.svgAsset, {
    Key? key,
    required this.size,
    required this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: PieChart.defaultDuration,
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(
          color: borderColor,
          width: 2,
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            offset: const Offset(3, 3),
            blurRadius: 3,
          ),
        ],
      ),
      padding: EdgeInsets.all(size * .15),
      child: Center(
        child: SvgPicture.asset(
          svgAsset,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => CameraViewList(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.linear;
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
