import 'package:flutter/material.dart';
import 'package:namaste_yoga/Screens/rUready.dart';
import 'package:namaste_yoga/model/model.dart';
import 'package:namaste_yoga/services/yogadb.dart';

//Video No 21 Excercise - Solve The Database Inserting Problem Using Shared Preference
class Startup extends StatefulWidget {
  String Yogakey;
  YogaSummary yogaSum;
  Startup({Key? key, required this.Yogakey, required this.yogaSum})
      : super(key: key);

  @override
  _StartupState createState() => _StartupState();
}

class _StartupState extends State<Startup> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ReadAllYoga();
  }

  late List<Yoga> AllYogaWorkOuts;
  bool isLoading = true;
  Future ReadAllYoga() async {
    AllYogaWorkOuts =
        await YogaDatabase.instance.readAllYoga(widget.yogaSum.YogaWorkOutName);
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Scaffold(
            body: Container(),
          )
        : Scaffold(
            floatingActionButton: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => rUready(
                              YogaTableName: widget.yogaSum.YogaWorkOutName,
                            )));
              },
              child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: const Text(
                    "START",
                    style: TextStyle(fontSize: 20),
                  )),
            ),
            body: CustomScrollView(
              slivers: [
                SliverAppBar(
                  expandedHeight: 300,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    collapseMode: CollapseMode.parallax,
                    title: Text(widget.yogaSum.YogaWorkOutName),
                    background: Image.asset(
                      widget.yogaSum.BackImg.toString(),
                      fit: BoxFit.cover,
                    ),
                  ),

                  //TODO: In Next Update - Add An Info Button About The Workout Pack
                  // actions: [
                  //   IconButton(
                  //       onPressed: () {
                  //
                  //
                  //         showDialog(
                  //             context: context,
                  //             builder: (_) => AlertDialog(
                  //               title: Text('Surya Namaskar'),
                  //               actionsAlignment: MainAxisAlignment.center,
                  //               actionsPadding: EdgeInsets.symmetric(vertical: 15 , horizontal: 10),
                  //               actions: [
                  //                 ElevatedButton(onPressed: (){
                  //                   Navigator.pop(context);
                  //                 }, child: Text("Close"))
                  //               ],
                  //               content: Container(
                  //
                  //
                  //
                  //                   child: Column(
                  //                     children: [
                  //                       Image.asset("assets/01_Suryanamskar/main.jpg"),
                  //                       SizedBox(height: 10,),
                  //                       Text('This will reset all of your fitness data including Total Workout Time, Streak and Burned Calories. The action cannot be revert once done.' , textAlign: TextAlign.center, style: TextStyle(fontSize: 16 , fontWeight: FontWeight.w400),),
                  //
                  //                     ],
                  //
                  //                   ),
                  //
                  //               ),
                  //
                  //         ));
                  //
                  //
                  //
                  //
                  //       }, icon: Icon(Icons.help))
                  // ],
                ),
                SliverToBoxAdapter(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "${widget.yogaSum.TimeTaken} Mins || ${widget.yogaSum.TotalNoOfWork} Workouts",
                              style:
                                  const TextStyle(fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                        const Divider(
                          thickness: 2,
                        ),
                        ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            separatorBuilder: (context, index) => const Divider(
                                  thickness: 2,
                                ),
                            itemBuilder: (context, index) => ListTile(
                                  leading: Container(
                                      margin: const EdgeInsets.only(right: 20),
                                      child: Image.asset(
                                        AllYogaWorkOuts[index].YogaImgUrl,
                                        fit: BoxFit.cover,
                                      )),
                                  title: Text(
                                    AllYogaWorkOuts[index].YogaTitle,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  subtitle: Text(
                                    AllYogaWorkOuts[index].Seconds
                                        ? "00:${AllYogaWorkOuts[index].SecondsOrTimes}"
                                        : "x${AllYogaWorkOuts[index].SecondsOrTimes}",
                                    style: const TextStyle(fontSize: 15),
                                  ),
                                ),
                            itemCount: AllYogaWorkOuts.length)
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
  }
}
