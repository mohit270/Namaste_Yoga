import 'package:flutter/material.dart';
import 'package:namaste_yoga/Screens/Home.dart';
import 'package:namaste_yoga/model/model.dart';
import 'package:namaste_yoga/services/localdb.dart';
import 'package:namaste_yoga/services/yogadb.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future makeYogaEntry(Yoga yoga, String TableName) async {
    await YogaDatabase.instance.Insert(yoga, TableName);
  }

  Future makeYogaSumEntry(YogaSummary yogaSummary) async {
    await YogaDatabase.instance.InsertYogaSum(yogaSummary);
  }

  checkUp() async {
    await LocalDB.getFirstTime().then((value) async {
      if (value.toString() == "null" || value != false) {
        print("First Time Entering");
        await LocalDB.setStreak(0);
        await LocalDB.setLastDoneOn(
            DateTime.now().subtract(const Duration(days: 1)).toString());
        await LocalDB.setkcal(0);
        await LocalDB.setWorkOutTime(0);
        await LocalDB.setFirstTime(false);

        // yoga for students
        makeYogaSumEntry(YogaSummary(
            YogaWorkOutName: YogaModel.YogaTable1,
            BackImg: "assets/04_balance_life/03-tree.jpg",
            TimeTaken: "15",
            TotalNoOfWork: "12",
            yogakey: 1));
        makeYogaEntry(
          const Yoga(
              Seconds: true,
              YogaImgUrl: "assets/04_balance_life/utthitahastapad-b.gif",
              YogaTitle: "Utthitahastapad Twisted Pose",
              SecondsOrTimes: '30',
              YogaKey_WorkOuts: 1),
          YogaModel.YogaTable1,
        );
        makeYogaEntry(
          const Yoga(
              Seconds: true,
              YogaImgUrl: "assets/04_balance_life/08-down-dog.jpg",
              YogaTitle: "Down Dog Pose",
              SecondsOrTimes: '30',
              YogaKey_WorkOuts: 1),
          YogaModel.YogaTable1,
        );
        makeYogaEntry(
          const Yoga(
              Seconds: true,
              YogaImgUrl: "assets/04_balance_life/10-warrior-2.jpg",
              YogaTitle: "Warrior Pose",
              SecondsOrTimes: '30',
              YogaKey_WorkOuts: 1),
          YogaModel.YogaTable1,
        );
        makeYogaEntry(
          const Yoga(
              Seconds: true,
              YogaImgUrl: "assets/04_balance_life/12-half-camel.jpg",
              YogaTitle: "Half Camel Pose",
              SecondsOrTimes: '30',
              YogaKey_WorkOuts: 1),
          YogaModel.YogaTable1,
        );
        makeYogaEntry(
          const Yoga(
              Seconds: true,
              YogaImgUrl: "assets/04_balance_life/bigtoeeagle.gif",
              YogaTitle: "Big To Eagle Pose ",
              SecondsOrTimes: '30',
              YogaKey_WorkOuts: 1),
          YogaModel.YogaTable1,
        );
        makeYogaEntry(
          const Yoga(
              Seconds: true,
              YogaImgUrl: "assets/04_balance_life/crochops1.gif",
              YogaTitle: "Crochops Pose",
              SecondsOrTimes: '30',
              YogaKey_WorkOuts: 1),
          YogaModel.YogaTable1,
        );
        makeYogaEntry(
          const Yoga(
              Seconds: true,
              YogaImgUrl:
                  "assets/04_balance_life/dog-lunge-warrior-twist-camel-croc.gif",
              YogaTitle: "Dog Lunge Warrior Twist Camel Croc",
              SecondsOrTimes: '30',
              YogaKey_WorkOuts: 1),
          YogaModel.YogaTable1,
        );
        makeYogaEntry(
          const Yoga(
              Seconds: true,
              YogaImgUrl: "assets/04_balance_life/highorlowlunge.gif",
              YogaTitle: "High or Low Lunge Pose",
              SecondsOrTimes: '30',
              YogaKey_WorkOuts: 1),
          YogaModel.YogaTable1,
        );
        makeYogaEntry(
          const Yoga(
              Seconds: true,
              YogaImgUrl: "assets/04_balance_life/mountain-chair-tree.gif",
              YogaTitle: "Mountain Chair Tree Pose",
              SecondsOrTimes: '30',
              YogaKey_WorkOuts: 1),
          YogaModel.YogaTable1,
        );
        makeYogaEntry(
          const Yoga(
              Seconds: true,
              YogaImgUrl: "assets/04_balance_life/twistedlunge-1-2.gif",
              YogaTitle: "Twisted Lunge",
              SecondsOrTimes: '30',
              YogaKey_WorkOuts: 1),
          YogaModel.YogaTable1,
        );
        makeYogaEntry(
          const Yoga(
              Seconds: true,
              YogaImgUrl: "assets/04_balance_life/utthitahastapad-a.gif",
              YogaTitle: "Utthitahastapad Pose",
              SecondsOrTimes: '30',
              YogaKey_WorkOuts: 1),
          YogaModel.YogaTable1,
        );
        // creating yoga for weight loss
        makeYogaSumEntry(YogaSummary(
            YogaWorkOutName: YogaModel.YogaTable2,
            BackImg: "assets/02_yoga_for_weight_oss/main.jpg",
            TimeTaken: "8",
            TotalNoOfWork: "10",
            yogakey: 2));
        makeYogaEntry(
          const Yoga(
              Seconds: true,
              YogaImgUrl:
                  "assets/02_yoga_for_weight_oss/26ef1233fabfac9b7ac17f00c01023ee.gif",
              YogaTitle: "Plank Swing",
              SecondsOrTimes: '15',
              YogaKey_WorkOuts: 2),
          YogaModel.YogaTable2,
        );
        makeYogaEntry(
          const Yoga(
              Seconds: true,
              YogaImgUrl:
                  "assets/02_yoga_for_weight_oss/400x400_Exercises_to_Make_the_Most_of_Your_Oblique_Workout_Side_Plank_with_Reach_Under.gif.webp",
              YogaTitle: "Side Plank With Reach Under",
              SecondsOrTimes: '30',
              YogaKey_WorkOuts: 2),
          YogaModel.YogaTable2,
        );
        makeYogaEntry(
          const Yoga(
              Seconds: true,
              YogaImgUrl: "assets/02_yoga_for_weight_oss/Boat-pose-.gif",
              YogaTitle: "Boat Pose",
              SecondsOrTimes: '30',
              YogaKey_WorkOuts: 2),
          YogaModel.YogaTable2,
        );
        makeYogaEntry(
          const Yoga(
              Seconds: true,
              YogaImgUrl:
                  "assets/02_yoga_for_weight_oss/bridge-pose-yoga_6.gif.webp",
              YogaTitle: "Bridge Pose",
              SecondsOrTimes: '30',
              YogaKey_WorkOuts: 2),
          YogaModel.YogaTable2,
        );
        makeYogaEntry(
          const Yoga(
              Seconds: true,
              YogaImgUrl:
                  "assets/02_yoga_for_weight_oss/camel-pose-yoga.gif.webp",
              YogaTitle: "Camel Pose",
              SecondsOrTimes: '30',
              YogaKey_WorkOuts: 2),
          YogaModel.YogaTable2,
        );
        makeYogaEntry(
          const Yoga(
              Seconds: true,
              YogaImgUrl:
                  "assets/02_yoga_for_weight_oss/cobra-pose-yoga.gif.webp",
              YogaTitle: "Cobra Pose",
              SecondsOrTimes: '30',
              YogaKey_WorkOuts: 2),
          YogaModel.YogaTable2,
        );
        makeYogaEntry(
          const Yoga(
              Seconds: true,
              YogaImgUrl:
                  "assets/02_yoga_for_weight_oss/Plank-into-Downdogwalking-plan-07556c.gif",
              YogaTitle: "Plank Into Dwondogawalking Plan",
              SecondsOrTimes: '30',
              YogaKey_WorkOuts: 2),
          YogaModel.YogaTable2,
        );
        makeYogaEntry(
          const Yoga(
              Seconds: true,
              YogaImgUrl: "assets/02_yoga_for_weight_oss/Plank-pose-.gif",
              YogaTitle: "Plank pose",
              SecondsOrTimes: '30',
              YogaKey_WorkOuts: 2),
          YogaModel.YogaTable2,
        );
        makeYogaEntry(
          const Yoga(
              Seconds: true,
              YogaImgUrl: "assets/02_yoga_for_weight_oss/Plank.gif.webp",
              YogaTitle: "Plank",
              SecondsOrTimes: '30',
              YogaKey_WorkOuts: 2),
          YogaModel.YogaTable2,
        );
        makeYogaEntry(
          const Yoga(
              Seconds: true,
              YogaImgUrl: "assets/02_yoga_for_weight_oss/Side-planks-.gif.webp",
              YogaTitle: "Side Plank",
              SecondsOrTimes: '30',
              YogaKey_WorkOuts: 2),
          YogaModel.YogaTable2,
        );
        // 20_minutue_yoga_evey_mornging
        makeYogaSumEntry(YogaSummary(
            YogaWorkOutName: YogaModel.YogaTable3,
            BackImg: "assets/01_20_minutes_yoga/main.webp",
            TimeTaken: "6",
            TotalNoOfWork: "8",
            yogakey: 3));
        makeYogaEntry(
          const Yoga(
              Seconds: true,
              YogaImgUrl:
                  "assets/01_20_minutes_yoga/201506-yjmag-cat-cow-gif.gif",
              YogaTitle: "Cat-Cow Pose",
              SecondsOrTimes: '15',
              YogaKey_WorkOuts: 3),
          YogaModel.YogaTable3,
        );
        makeYogaEntry(
          const Yoga(
              Seconds: true,
              YogaImgUrl:
                  "assets/01_20_minutes_yoga/201506-yjmag-downward-dog.jpg.webp",
              YogaTitle: "Adho Mukha Svanasana (Downward-Facing Dog Pose)",
              SecondsOrTimes: '30',
              YogaKey_WorkOuts: 3),
          YogaModel.YogaTable3,
        );
        makeYogaEntry(
          const Yoga(
              Seconds: true,
              YogaImgUrl:
                  "assets/01_20_minutes_yoga/201506-yjmag-low-lunge.jpg.webp",
              YogaTitle: "Anjaneyasana (Low Lunge)",
              SecondsOrTimes: '30',
              YogaKey_WorkOuts: 3),
          YogaModel.YogaTable3,
        );
        makeYogaEntry(
          const Yoga(
              Seconds: true,
              YogaImgUrl:
                  "assets/01_20_minutes_yoga/201506-yjmag-seated-cat-cow.gif",
              YogaTitle: "Seated Cat-Cow Pose",
              SecondsOrTimes: '30',
              YogaKey_WorkOuts: 3),
          YogaModel.YogaTable3,
        );
        makeYogaEntry(
          const Yoga(
              Seconds: true,
              YogaImgUrl:
                  "assets/01_20_minutes_yoga/201506-yjmag-seated-half-moon.jpg.webp",
              YogaTitle: "Seated Half Moon Pose",
              SecondsOrTimes: '30',
              YogaKey_WorkOuts: 3),
          YogaModel.YogaTable3,
        );
        makeYogaEntry(
          const Yoga(
              Seconds: true,
              YogaImgUrl:
                  "assets/01_20_minutes_yoga/201506-yjmag-seated-foward-fold.jpg.webp",
              YogaTitle: "Seated Forward Fold with Mudra",
              SecondsOrTimes: '30',
              YogaKey_WorkOuts: 3),
          YogaModel.YogaTable3,
        );
        makeYogaEntry(
          const Yoga(
              Seconds: true,
              YogaImgUrl:
                  "assets/01_20_minutes_yoga/201506-yjmag-three-legged-dog.jpg.webp",
              YogaTitle: "Three-Legged Downward-Facing Dog Pose",
              SecondsOrTimes: '30',
              YogaKey_WorkOuts: 3),
          YogaModel.YogaTable3,
        );
        makeYogaEntry(
          const Yoga(
              Seconds: true,
              YogaImgUrl: "assets/01_20_minutes_yoga/spine-twist.jpg.webp",
              YogaTitle: "Seated Spinal Twist",
              SecondsOrTimes: '30',
              YogaKey_WorkOuts: 3),
          YogaModel.YogaTable3,
        );
        // yoga for body Twisting
        makeYogaSumEntry(YogaSummary(
            YogaWorkOutName: YogaModel.YogaTable4,
            BackImg: "assets/05_twisted/half-lord-of-the-fishes-pose.jpg",
            TimeTaken: "10",
            TotalNoOfWork: "14",
            yogakey: 4));
        makeYogaEntry(
          const Yoga(
              Seconds: true,
              YogaImgUrl:
                  "assets/05_twisted/revolved-lunge-pose-aka-easy-twist-variation.gif",
              YogaTitle: "Revolved Lunge Pose, a.k.a. Easy Twist + variation",
              SecondsOrTimes: '15',
              YogaKey_WorkOuts: 4),
          YogaModel.YogaTable4,
        );
        makeYogaEntry(
          const Yoga(
              Seconds: true,
              YogaImgUrl: "assets/05_twisted/supine-pigeon-variation.gif",
              YogaTitle: "Supine Pigeon Variation",
              SecondsOrTimes: '30',
              YogaKey_WorkOuts: 4),
          YogaModel.YogaTable4,
        );
        makeYogaEntry(
          const Yoga(
              Seconds: true,
              YogaImgUrl: "assets/05_twisted/corpse-pose.jpg.webp",
              YogaTitle: "Corpse Pose",
              SecondsOrTimes: '30',
              YogaKey_WorkOuts: 4),
          YogaModel.YogaTable4,
        );
        makeYogaEntry(
          const Yoga(
              Seconds: true,
              YogaImgUrl:
                  "assets/05_twisted/reclining-hand-to-big-toe-pose.jpg.webp",
              YogaTitle: "Reclining Hand To Big Toe Pose",
              SecondsOrTimes: '30',
              YogaKey_WorkOuts: 4),
          YogaModel.YogaTable4,
        );
        makeYogaEntry(
          const Yoga(
              Seconds: true,
              YogaImgUrl: "assets/05_twisted/bridge-pose.jpg.webp",
              YogaTitle: "Bridge Pose",
              SecondsOrTimes: '30',
              YogaKey_WorkOuts: 4),
          YogaModel.YogaTable4,
        );
        makeYogaEntry(
          const Yoga(
              Seconds: true,
              YogaImgUrl:
                  "assets/05_twisted/upright-eye-of-the-needle-pose-variation.gif",
              YogaTitle: "Upright Eye Of The Needle Pose",
              SecondsOrTimes: '30',
              YogaKey_WorkOuts: 4),
          YogaModel.YogaTable4,
        );
        makeYogaEntry(
          const Yoga(
              Seconds: true,
              YogaImgUrl:
                  "assets/05_twisted/extended-side-angle-pose-variation.gif",
              YogaTitle: "Extended Side Angle Pose",
              SecondsOrTimes: '30',
              YogaKey_WorkOuts: 4),
          YogaModel.YogaTable4,
        );
        makeYogaEntry(
          const Yoga(
              Seconds: true,
              YogaImgUrl:
                  "assets/05_twisted/wide-legged-standing-forward-bend-variation.gif",
              YogaTitle: "Wide Legged Standing Forward Bend Pose",
              SecondsOrTimes: '30',
              YogaKey_WorkOuts: 4),
          YogaModel.YogaTable4,
        );
        makeYogaEntry(
          const Yoga(
              Seconds: true,
              YogaImgUrl: "assets/05_twisted/lizard-pose.jpg.webp",
              YogaTitle: "Lizard Pose",
              SecondsOrTimes: '30',
              YogaKey_WorkOuts: 4),
          YogaModel.YogaTable4,
        );
        makeYogaEntry(
          const Yoga(
              Seconds: true,
              YogaImgUrl: "assets/05_twisted/highlungevariation.gif",
              YogaTitle: "High Lunde Pose",
              SecondsOrTimes: '30',
              YogaKey_WorkOuts: 4),
          YogaModel.YogaTable4,
        );
        makeYogaEntry(
          const Yoga(
              Seconds: true,
              YogaImgUrl:
                  "assets/05_twisted/downward-facing-dog-pose-variation.gif",
              YogaTitle: "Downword Facing Dog Pose",
              SecondsOrTimes: '30',
              YogaKey_WorkOuts: 4),
          YogaModel.YogaTable4,
        );
        makeYogaEntry(
          const Yoga(
              Seconds: true,
              YogaImgUrl: "assets/05_twisted/extended-puppy-pose-variation.gif",
              YogaTitle: "Extended Puppy Pose",
              SecondsOrTimes: '30',
              YogaKey_WorkOuts: 4),
          YogaModel.YogaTable4,
        );
        makeYogaEntry(
          const Yoga(
              Seconds: true,
              YogaImgUrl: "assets/05_twisted/cat-cow-pose.jpg.webp",
              YogaTitle: "Cat Cow Pose",
              SecondsOrTimes: '30',
              YogaKey_WorkOuts: 4),
          YogaModel.YogaTable4,
        );
        makeYogaEntry(
          const Yoga(
              Seconds: true,
              YogaImgUrl:
                  "assets/05_twisted/eye-of-the-needle-pose-variation.gif",
              YogaTitle: "Eye Of The Needle Pose",
              SecondsOrTimes: '30',
              YogaKey_WorkOuts: 4),
          YogaModel.YogaTable4,
        );
        // yoga for thyroid
        makeYogaSumEntry(YogaSummary(
            YogaWorkOutName: YogaModel.YogaTable5,
            BackImg: "assets/06_yoga_for_thyrid/mainthyroid.jpeg",
            TimeTaken: "8",
            TotalNoOfWork: "10",
            yogakey: 5));
        makeYogaEntry(
          const Yoga(
              Seconds: true,
              YogaImgUrl:
                  "assets/06_yoga_for_thyrid/400x400_10_Yoga_Poses_That_Can_Improve_the_Health_of_your_Thyroid_Boat_Pose.gif",
              YogaTitle: "Boat Pose",
              SecondsOrTimes: '15',
              YogaKey_WorkOuts: 5),
          YogaModel.YogaTable5,
        );
        makeYogaEntry(
          const Yoga(
              Seconds: true,
              YogaImgUrl:
                  "assets/06_yoga_for_thyrid/400x400_10_Yoga_Poses_That_Can_Improve_the_Health_of_your_Thyroid_Camel_Pose.gif",
              YogaTitle: "Camel Pose",
              SecondsOrTimes: '30',
              YogaKey_WorkOuts: 5),
          YogaModel.YogaTable5,
        );
        makeYogaEntry(
          const Yoga(
              Seconds: true,
              YogaImgUrl:
                  "assets/06_yoga_for_thyrid/400x400_10_Yoga_Poses_That_Can_Improve_the_Health_of_your_Thyroid_Cat_Cow_Pose.gif",
              YogaTitle: "Cat Cow Pose",
              SecondsOrTimes: '30',
              YogaKey_WorkOuts: 5),
          YogaModel.YogaTable5,
        );
        makeYogaEntry(
          const Yoga(
              Seconds: true,
              YogaImgUrl:
                  "assets/06_yoga_for_thyrid/400x400_10_Yoga_Poses_That_Can_Improve_the_Health_of_your_Thyroid_Cobra_Pose.gif",
              YogaTitle: "Cobra Pose",
              SecondsOrTimes: '30',
              YogaKey_WorkOuts: 5),
          YogaModel.YogaTable5,
        );
        makeYogaEntry(
          const Yoga(
              Seconds: true,
              YogaImgUrl:
                  "assets/06_yoga_for_thyrid/400x400_10_Yoga_Poses_That_Can_Improve_the_Health_of_your_Thyroid_Corpse_Pose.gif",
              YogaTitle: "Corpse Pose",
              SecondsOrTimes: '30',
              YogaKey_WorkOuts: 5),
          YogaModel.YogaTable5,
        );
        makeYogaEntry(
          const Yoga(
              Seconds: true,
              YogaImgUrl:
                  "assets/06_yoga_for_thyrid/400x400_10_Yoga_Poses_That_Can_Improve_the_Health_of_your_Thyroid_Fish_Pose.gif",
              YogaTitle: "Fish Pose",
              SecondsOrTimes: '30',
              YogaKey_WorkOuts: 5),
          YogaModel.YogaTable5,
        );
        makeYogaEntry(
          const Yoga(
              Seconds: true,
              YogaImgUrl:
                  "assets/06_yoga_for_thyrid/400x400_10_Yoga_Poses_That_Can_Improve_the_Health_of_your_Thyroid_Legs_Up_the_Wall_Pose.gif",
              YogaTitle: "Legs Up the Wall Pose",
              SecondsOrTimes: '30',
              YogaKey_WorkOuts: 5),
          YogaModel.YogaTable5,
        );
        makeYogaEntry(
          const Yoga(
              Seconds: true,
              YogaImgUrl:
                  "assets/06_yoga_for_thyrid/400x400_10_Yoga_Poses_That_Can_Improve_the_Health_of_your_Thyroid_Plow_Pose.gif",
              YogaTitle: "Plow Pose",
              SecondsOrTimes: '30',
              YogaKey_WorkOuts: 5),
          YogaModel.YogaTable5,
        );
        makeYogaEntry(
          const Yoga(
              Seconds: true,
              YogaImgUrl:
                  "assets/06_yoga_for_thyrid/400x400_10_Yoga_Poses_That_Can_Improve_the_Health_of_your_Thyroid_Supported_Shoulderstand.gif",
              YogaTitle: "Supported Shoulderstand",
              SecondsOrTimes: '30',
              YogaKey_WorkOuts: 5),
          YogaModel.YogaTable5,
        );
        makeYogaEntry(
          const Yoga(
              Seconds: true,
              YogaImgUrl:
                  "assets/06_yoga_for_thyrid/400x400_10_Yoga_Poses_That_Can_Improve_the_Health_of_your_Thyroid_Upward_Bow_Wheel_Pose.gif",
              YogaTitle: "Upward Bow Wheel Pose",
              SecondsOrTimes: '30',
              YogaKey_WorkOuts: 5),
          YogaModel.YogaTable5,
        );
        // yoga for back pain
        makeYogaSumEntry(YogaSummary(
            YogaWorkOutName: YogaModel.YogaTable6,
            BackImg: "assets/06_yoga_for_thyrid/mainback.jpeg",
            TimeTaken: "8",
            TotalNoOfWork: "10",
            yogakey: 6));
        makeYogaEntry(
          const Yoga(
              Seconds: true,
              YogaImgUrl: "assets/06_yoga_for_thyrid/Cat-Cow.gif",
              YogaTitle: "Cat-Cow Pose",
              SecondsOrTimes: '15',
              YogaKey_WorkOuts: 6),
          YogaModel.YogaTable6,
        );
        makeYogaEntry(
          const Yoga(
              Seconds: true,
              YogaImgUrl: "assets/06_yoga_for_thyrid/Downward-Facing-Dog.gif",
              YogaTitle: "Adho Mukha Svanasana (Downward-Facing Dog Pose)",
              SecondsOrTimes: '30',
              YogaKey_WorkOuts: 6),
          YogaModel.YogaTable6,
        );
        makeYogaEntry(
          const Yoga(
              Seconds: true,
              YogaImgUrl:
                  "assets/06_yoga_for_thyrid/Extended-triangle-pose.gif",
              YogaTitle: "Extended Triangle",
              SecondsOrTimes: '30',
              YogaKey_WorkOuts: 6),
          YogaModel.YogaTable6,
        );
        makeYogaEntry(
          const Yoga(
              Seconds: true,
              YogaImgUrl: "assets/06_yoga_for_thyrid/Sphinx-Pose.gif",
              YogaTitle: "Sphinx Pose",
              SecondsOrTimes: '30',
              YogaKey_WorkOuts: 6),
          YogaModel.YogaTable6,
        );
        makeYogaEntry(
          const Yoga(
              Seconds: true,
              YogaImgUrl: "assets/06_yoga_for_thyrid/Cobra-Pose.gif",
              YogaTitle: "Cobra Pose",
              SecondsOrTimes: '30',
              YogaKey_WorkOuts: 6),
          YogaModel.YogaTable6,
        );
        makeYogaEntry(
          const Yoga(
              Seconds: true,
              YogaImgUrl: "assets/06_yoga_for_thyrid/Locust-Pose.gif",
              YogaTitle: "Locust Pose",
              SecondsOrTimes: '30',
              YogaKey_WorkOuts: 6),
          YogaModel.YogaTable6,
        );
        makeYogaEntry(
          const Yoga(
              Seconds: true,
              YogaImgUrl: "assets/06_yoga_for_thyrid/Bridge-Pose.gif",
              YogaTitle: "Bridge Pose",
              SecondsOrTimes: '30',
              YogaKey_WorkOuts: 6),
          YogaModel.YogaTable6,
        );
        makeYogaEntry(
          const Yoga(
              Seconds: true,
              YogaImgUrl:
                  "assets/06_yoga_for_thyrid/Half-Lord-of-the-Fishes.gif",
              YogaTitle: "Half Lord of the Fishes",
              SecondsOrTimes: '30',
              YogaKey_WorkOuts: 6),
          YogaModel.YogaTable6,
        );
        makeYogaEntry(
          const Yoga(
              Seconds: true,
              YogaImgUrl: "assets/06_yoga_for_thyrid/Two-Knee-Spinal-Twist.gif",
              YogaTitle: "Two-Knee Spinal Twist",
              SecondsOrTimes: '30',
              YogaKey_WorkOuts: 6),
          YogaModel.YogaTable6,
        );
        makeYogaEntry(
          const Yoga(
              Seconds: true,
              YogaImgUrl: "assets/06_yoga_for_thyrid/Childs-Pose.gif",
              YogaTitle: "Child’s Pose",
              SecondsOrTimes: '30',
              YogaKey_WorkOuts: 6),
          YogaModel.YogaTable6,
        );
        // Yoga for Diabetes
        makeYogaSumEntry(YogaSummary(
            YogaWorkOutName: YogaModel.YogaTable7,
            BackImg: "assets/06_yoga_for_thyrid/maindiabetic.avif",
            TimeTaken: "8",
            TotalNoOfWork: "11",
            yogakey: 7));
        makeYogaEntry(
          const Yoga(
              Seconds: true,
              YogaImgUrl: "assets/06_yoga_for_thyrid/Legs-up-the-wall-pose.gif",
              YogaTitle: "Legs Up The Wall Pose",
              SecondsOrTimes: '15',
              YogaKey_WorkOuts: 7),
          YogaModel.YogaTable7,
        );
        makeYogaEntry(
          const Yoga(
              Seconds: true,
              YogaImgUrl:
                  "assets/06_yoga_for_thyrid/Reclining-Bound-Angle-Pose.gif",
              YogaTitle: "Reclining Bound Angle Pose",
              SecondsOrTimes: '30',
              YogaKey_WorkOuts: 7),
          YogaModel.YogaTable7,
        );
        makeYogaEntry(
          const Yoga(
              Seconds: true,
              YogaImgUrl: "assets/06_yoga_for_thyrid/Supine-spinal-twist.gif",
              YogaTitle: "Supine Spinal Twist",
              SecondsOrTimes: '30',
              YogaKey_WorkOuts: 7),
          YogaModel.YogaTable7,
        );
        makeYogaEntry(
          const Yoga(
              Seconds: true,
              YogaImgUrl: "assets/06_yoga_for_thyrid/Seated-Forward-Bend.gif",
              YogaTitle: "Seated forward bend",
              SecondsOrTimes: '30',
              YogaKey_WorkOuts: 7),
          YogaModel.YogaTable7,
        );
        makeYogaEntry(
          const Yoga(
              Seconds: true,
              YogaImgUrl:
                  "assets/06_yoga_for_thyrid/2265-Supported_Shoulderstand-400x400-exercise.gif",
              YogaTitle: "Supported shoulderstand",
              SecondsOrTimes: '30',
              YogaKey_WorkOuts: 7),
          YogaModel.YogaTable7,
        );
        makeYogaEntry(
          const Yoga(
              Seconds: true,
              YogaImgUrl: "assets/06_yoga_for_thyrid/Plow-Pose.gif",
              YogaTitle: "Plow pose",
              SecondsOrTimes: '30',
              YogaKey_WorkOuts: 7),
          YogaModel.YogaTable7,
        );
        makeYogaEntry(
          const Yoga(
              Seconds: true,
              YogaImgUrl:
                  "assets/06_yoga_for_thyrid/2265-Upward_Facing_Dog-400x400-exercise.gif",
              YogaTitle: "Upward-Facing Dog",
              SecondsOrTimes: '30',
              YogaKey_WorkOuts: 7),
          YogaModel.YogaTable7,
        );
        makeYogaEntry(
          const Yoga(
              Seconds: true,
              YogaImgUrl: "assets/06_yoga_for_thyrid/Bow-Pose.gif",
              YogaTitle: "Bow Pose",
              SecondsOrTimes: '30',
              YogaKey_WorkOuts: 7),
          YogaModel.YogaTable7,
        );
        makeYogaEntry(
          const Yoga(
              Seconds: true,
              YogaImgUrl:
                  "assets/06_yoga_for_thyrid/Half-lord-of-the-fishes-pose.gif",
              YogaTitle: "Half Lord of the Fishes Pose",
              SecondsOrTimes: '30',
              YogaKey_WorkOuts: 7),
          YogaModel.YogaTable7,
        );
        makeYogaEntry(
          const Yoga(
              Seconds: true,
              YogaImgUrl: "assets/06_yoga_for_thyrid/Childs-Pose.gif",
              YogaTitle: "Child’s Pose",
              SecondsOrTimes: '30',
              YogaKey_WorkOuts: 7),
          YogaModel.YogaTable7,
        );
        makeYogaEntry(
          const Yoga(
              Seconds: true,
              YogaImgUrl: "assets/06_yoga_for_thyrid/Corpse-pose.gif",
              YogaTitle: "Corpse Pose",
              SecondsOrTimes: '30',
              YogaKey_WorkOuts: 7),
          YogaModel.YogaTable7,
        );
        // yoga for neck pain
        makeYogaSumEntry(YogaSummary(
            YogaWorkOutName: YogaModel.YogaTable8,
            BackImg: "assets/06_yoga_for_thyrid/mainneck.jpeg",
            TimeTaken: "10",
            TotalNoOfWork: "12",
            yogakey: 8));
        makeYogaEntry(
          const Yoga(
              Seconds: true,
              YogaImgUrl:
                  "assets/06_yoga_for_thyrid/Standing-forward-bend-pose.gif",
              YogaTitle: "Standing forward bend pose",
              SecondsOrTimes: '15',
              YogaKey_WorkOuts: 8),
          YogaModel.YogaTable8,
        );
        makeYogaEntry(
          const Yoga(
              Seconds: true,
              YogaImgUrl: "assets/06_yoga_for_thyrid/Warrior-II-pose.gif",
              YogaTitle: "Warrior II pose",
              SecondsOrTimes: '30',
              YogaKey_WorkOuts: 8),
          YogaModel.YogaTable8,
        );
        makeYogaEntry(
          const Yoga(
              Seconds: true,
              YogaImgUrl:
                  "assets/06_yoga_for_thyrid/Extended-triangle-pose.gif",
              YogaTitle: "Extended triangle pose",
              SecondsOrTimes: '30',
              YogaKey_WorkOuts: 8),
          YogaModel.YogaTable8,
        );
        makeYogaEntry(
          const Yoga(
              Seconds: true,
              YogaImgUrl: "assets/06_yoga_for_thyrid/Cat-Cow.gif",
              YogaTitle: "Cat cow pose",
              SecondsOrTimes: '30',
              YogaKey_WorkOuts: 8),
          YogaModel.YogaTable8,
        );
        makeYogaEntry(
          const Yoga(
              Seconds: true,
              YogaImgUrl:
                  "assets/06_yoga_for_thyrid/Thread-the-needle-pose.gif",
              YogaTitle: "Thread the needle pose",
              SecondsOrTimes: '30',
              YogaKey_WorkOuts: 8),
          YogaModel.YogaTable8,
        );
        makeYogaEntry(
          const Yoga(
              Seconds: true,
              YogaImgUrl: "assets/06_yoga_for_thyrid/Cow-face-pose.gif",
              YogaTitle: "Cow face pose",
              SecondsOrTimes: '30',
              YogaKey_WorkOuts: 8),
          YogaModel.YogaTable8,
        );
        makeYogaEntry(
          const Yoga(
              Seconds: true,
              YogaImgUrl:
                  "assets/06_yoga_for_thyrid/Half-lord-of-the-fishes-pose.gif",
              YogaTitle: "Half lord of the fishes pose",
              SecondsOrTimes: '30',
              YogaKey_WorkOuts: 8),
          YogaModel.YogaTable8,
        );
        makeYogaEntry(
          const Yoga(
              Seconds: true,
              YogaImgUrl: "assets/06_yoga_for_thyrid/Sphinx-Pose.gif",
              YogaTitle: "Sphinx pose",
              SecondsOrTimes: '30',
              YogaKey_WorkOuts: 8),
          YogaModel.YogaTable8,
        );
        makeYogaEntry(
          const Yoga(
              Seconds: true,
              YogaImgUrl: "assets/06_yoga_for_thyrid/Extended-puppy-pose.gif",
              YogaTitle: "Extended puppy pose",
              SecondsOrTimes: '30',
              YogaKey_WorkOuts: 8),
          YogaModel.YogaTable8,
        );
        makeYogaEntry(
          const Yoga(
              Seconds: true,
              YogaImgUrl: "assets/06_yoga_for_thyrid/Childs-Pose.gif",
              YogaTitle: "Child’s pose",
              SecondsOrTimes: '30',
              YogaKey_WorkOuts: 8),
          YogaModel.YogaTable8,
        );
        makeYogaEntry(
          const Yoga(
              Seconds: true,
              YogaImgUrl: "assets/06_yoga_for_thyrid/Legs-up-the-wall-pose.gif",
              YogaTitle: "Legs-up-the-wall pose",
              SecondsOrTimes: '30',
              YogaKey_WorkOuts: 8),
          YogaModel.YogaTable8,
        );
        makeYogaEntry(
          const Yoga(
              Seconds: true,
              YogaImgUrl: "assets/06_yoga_for_thyrid/Corpse-pose.gif",
              YogaTitle: "Corpse pose",
              SecondsOrTimes: '30',
              YogaKey_WorkOuts: 8),
          YogaModel.YogaTable8,
        );
      } else {
        print("NOT A FIRST TIME");
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkUp();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const Home()));
    });
    //CHECK INSTALLATION,INSERT,READ,UPDATE,OPERATION STATUS
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                isAntiAlias: true,
                fit: BoxFit.fill,
                image: AssetImage("assets/logo/logo1.gif"))),
        // child: Image.asset("assets/logo/giphy.gif",)
      ),
    );
  }
}
