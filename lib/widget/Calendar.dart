import 'package:cell_calendar/cell_calendar.dart';
import 'package:aiview/widget/TimeEvent.dart';
import 'package:aiview/widget/sampleEvents.dart';
import 'package:flutter/material.dart';

bool checkchosenAM = true;
bool checkchosenPM = true;

class MyHomePage extends StatefulWidget {
  MyHomePage({required Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<StatefulWidget> createState() {
    return _caladers();
  }
}

class _caladers extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final _sampleEvents = sampleEvents();
    final cellCalendarPageController = CellCalendarPageController();
    return Scaffold(
        appBar: AppBar(
          title: Text(""),
        ),
        body: Column(children: [
          Container(
            // color: Colors.black,
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width / 2,
            child: CellCalendar(
              cellCalendarPageController: cellCalendarPageController,
              daysOfTheWeekBuilder: (dayIndex) {
                final labels = ["M", "T", "W", "T", "F", "S", "S"];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 4.0),
                  child: Text(
                    labels[dayIndex],
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.orangeAccent),
                    textAlign: TextAlign.center,
                  ),
                );
              },
              monthYearLabelBuilder: (datetime) {
                final year = datetime?.year.toString();
                final month = datetime?.month.monthName;
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    children: [
                      Text(
                        "$month  $year",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ],
                  ),
                );
              },
              onCellTapped: (date) {
                final eventsOnTheDate = _sampleEvents.where((event) {
                  final eventDate = event.eventDate;
                  return eventDate.year == date.year &&
                      eventDate.month == date.month &&
                      eventDate.day == date.day;
                }).toList();
                showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                          title: Text(
                            date.month.monthName + " " + date.day.toString(),
                            style: TextStyle(color: Colors.black),
                          ),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: eventsOnTheDate
                                .map(
                                  (event) => Container(
                                    width: double.infinity,
                                    padding: EdgeInsets.all(4),
                                    margin: EdgeInsets.only(bottom: 12),
                                    color: event.eventBackgroundColor,
                                    child: Text(
                                      event.eventName,
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        ));
              },
              onPageChanged: (firstDate, lastDate) {},
            ),
          ),
          Container(
            height: 1,
            width: 2,
          ),
          timeevent(),
          Container(
            height: 1,
            width: 2,
          ),
          Container(
            width: MediaQuery.of(context).size.width / 2,
            height: 35,
            color: Colors.black,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                    onTap: () {
                      setState(() {
                        checkchosenAM = !checkchosenAM;
                        checkchosenPM = false;
                      });
                    },
                    child: Text(
                      "AM",
                      style: TextStyle(
                          color:
                              checkchosenAM ? Colors.orangeAccent : Colors.grey,
                          fontSize: 15),
                    )),
                SizedBox(
                  width: 10,
                ),
                Container(
                  height: 10,
                  color: Colors.grey,
                  width: 1,
                ),
                SizedBox(
                  width: 10,
                ),
                InkWell(
                    onTap: () {
                      setState(() {
                        checkchosenPM = !checkchosenPM;
                        checkchosenAM = false;
                      });
                      print("PM");
                    },
                    child: Text(
                      "PM",
                      style: TextStyle(
                          color:
                              checkchosenPM ? Colors.orangeAccent : Colors.grey,
                          fontSize: 15),
                    ))
              ],
            ),
          )
        ]));
  }
}
