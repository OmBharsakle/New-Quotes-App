import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';


import '../Controller/QuotesAppController.dart';
import '../Screens/MakeYourTheme/View/MakeTheme.dart';
import '../Screens/ShareSavePage/View/ShareSaveScreen.dart';

Map<String, List<Map<String, String>>> CategoriesImageList = {
  "ToughTimes": [
    {"link": "assets/Images/img/Tough_Times/alone.jpg", "text": "Alone"},
    {"link": "assets/Images/img/Tough_Times/anger.jpg", "text": "Anger"},
    {"link": "assets/Images/img/Tough_Times/breakup.jpg", "text": "Breakup"},
    {
      "link": "assets/Images/img/Tough_Times/broken_heart.jpg",
      "text": "Broken Heart"
    },
    {"link": "assets/Images/img/Tough_Times/death.jpg", "text": "Death"},
    {
      "link": "assets/Images/img/Tough_Times/depression.jpg",
      "text": "Depression"
    },
    {"link": "assets/Images/img/Tough_Times/divorce.jpg", "text": "Divorce"},
    {"link": "assets/Images/img/Tough_Times/jealousy.jpg", "text": "Jealousy"},
    {
      "link": "assets/Images/img/Tough_Times/loneliness.jpg",
      "text": "Loneliness"
    },
    {
      "link": "assets/Images/img/Tough_Times/losing_friend.jpg",
      "text": "Losing Friend"
    },
    {
      "link": "assets/Images/img/Tough_Times/missing_someone.jpg",
      "text": "Missing Someone"
    },
    {
      "link": "assets/Images/img/Tough_Times/overthinking.jpg",
      "text": "Overthinking"
    },
    {"link": "assets/Images/img/Tough_Times/pain.jpg", "text": "Pain"},
    {"link": "assets/Images/img/Tough_Times/sadness.jpg", "text": "Sadness"},
  ],
  "SelfDevelopment": [
    {
      "link": "assets/Images/img/Self_Development/be_strong.jpg",
      "text": "Be Strong"
    },
    {
      "link": "assets/Images/img/Self_Development/be_yourself.jpg",
      "text": "Be Yourself"
    },
    {
      "link": "assets/Images/img/Self_Development/confidence.jpg",
      "text": "Confidence"
    },
    {
      "link": "assets/Images/img/Self_Development/courage.jpg",
      "text": "Courage"
    },
    {"link": "assets/Images/img/Self_Development/dream.jpg", "text": "Dream"},
    {
      "link": "assets/Images/img/Self_Development/love_yourself.jpg",
      "text": "Love Yourself"
    },
    {
      "link": "assets/Images/img/Self_Development/no_excuse.jpg",
      "text": "No Excuse"
    },
    {
      "link": "assets/Images/img/Self_Development/overcoming_failure.jpg",
      "text": "Overcoming Failure"
    },
    {
      "link": "assets/Images/img/Self_Development/passion.jpg",
      "text": "Passion"
    },
    {
      "link": "assets/Images/img/Self_Development/positive_thinking.jpg",
      "text": "Positive Thinking"
    },
    {
      "link": "assets/Images/img/Self_Development/self_care.jpg",
      "text": "Self Care"
    },
    {
      "link": "assets/Images/img/Self_Development/self_development.jpg",
      "text": "Self Development"
    },
    {
      "link": "assets/Images/img/Self_Development/self_discipline.jpg",
      "text": "Self Discipline"
    },
    {
      "link": "assets/Images/img/Self_Development/self_respect.jpg",
      "text": "Self Respect"
    },
    {"link": "assets/Images/img/Self_Development/smile.jpg", "text": "Smile"},
    {"link": "assets/Images/img/Self_Development/wisdom.jpg", "text": "Wisdom"},
  ],
  "ReligiousAndSpritual": [
    {
      "link": "assets/Images/img/Religious_And_Spritual/affirmation.jpg",
      "text": "Affirmation"
    },
    {
      "link": "assets/Images/img/Religious_And_Spritual/blessed.jpg",
      "text": "Blessed"
    },
    {
      "link": "assets/Images/img/Religious_And_Spritual/buddha.jpg",
      "text": "Buddha"
    },
    {
      "link": "assets/Images/img/Religious_And_Spritual/devotion.jpg",
      "text": "Devotion"
    },
    {
      "link": "assets/Images/img/Religious_And_Spritual/faith.jpg",
      "text": "Faith"
    },
    {"link": "assets/Images/img/Religious_And_Spritual/god.jpg", "text": "God"},
    {
      "link": "assets/Images/img/Religious_And_Spritual/happiness.jpg",
      "text": "Happiness"
    },
    {
      "link": "assets/Images/img/Religious_And_Spritual/healing.jpg",
      "text": "Healing"
    },
    {
      "link": "assets/Images/img/Religious_And_Spritual/Hinduism.jpg",
      "text": "Hinduism"
    },
    {
      "link": "assets/Images/img/Religious_And_Spritual/hope.jpg",
      "text": "Hope"
    },
    {
      "link": "assets/Images/img/Religious_And_Spritual/inner_beauty.jpg",
      "text": "Inner Beauty"
    },
    {
      "link": "assets/Images/img/Religious_And_Spritual/karma.jpg",
      "text": "Karma"
    },
    {
      "link": "assets/Images/img/Religious_And_Spritual/law_of_attraction.jpg",
      "text": "Law Of Attraction"
    },
    {
      "link": "assets/Images/img/Religious_And_Spritual/Life.jpg",
      "text": "Life"
    },
    {
      "link": "assets/Images/img/Religious_And_Spritual/peace.jpg",
      "text": "Peace"
    },
    {
      "link": "assets/Images/img/Religious_And_Spritual/quran.jpg",
      "text": "Quran"
    },
    {
      "link": "assets/Images/img/Religious_And_Spritual/silence.jpg",
      "text": "Silence"
    },
    {
      "link": "assets/Images/img/Religious_And_Spritual/simplicity.jpg",
      "text": "Simplicity"
    },
  ],
  "Others": [
    {"link": "assets/Images/img/Others/anniversary.jpg", "text": "Anniversary"},
    {"link": "assets/Images/img/Others/birthday.jpg", "text": "Birthday"},
    {"link": "assets/Images/img/Others/fathers_day.jpg", "text": "Fathers Day"},
    {"link": "assets/Images/img/Others/forgiveness.jpg", "text": "Forgiveness"},
    {
      "link": "assets/Images/img/Others/good_morning.jpg",
      "text": "Good Morning"
    },
    {"link": "assets/Images/img/Others/good_night.jpg", "text": "Good Night"},
    {"link": "assets/Images/img/Others/helpful.jpg", "text": "Helpful"},
    {"link": "assets/Images/img/Others/honesty.jpg", "text": "Honesty"},
    {"link": "assets/Images/img/Others/kindness.jpg", "text": "Kindness"},
    {"link": "assets/Images/img/Others/loyalty.jpg", "text": "Loyalty"},
    {"link": "assets/Images/img/Others/mothers_day.jpg", "text": "Mothers Day"},
    {"link": "assets/Images/img/Others/respect.jpg", "text": "Respect"},
    {"link": "assets/Images/img/Others/thank_you.jpg", "text": "Thank You"},
  ],
  "MotivationAndInspiration": [
    {
      "link": "assets/Images/img/Motivation_And_Inspiration/attitude.jpg",
      "text": "Attitude"
    },
    {
      "link": "assets/Images/img/Motivation_And_Inspiration/creativity.jpg",
      "text": "Creativity"
    },
    {
      "link": "assets/Images/img/Motivation_And_Inspiration/freedom.jpg",
      "text": "Freedom"
    },
    {
      "link": "assets/Images/img/Motivation_And_Inspiration/funny.jpg",
      "text": "Funny"
    },
    {
      "link": "assets/Images/img/Motivation_And_Inspiration/learning.jpg",
      "text": "Learning"
    },
    {
      "link": "assets/Images/img/Motivation_And_Inspiration/positivity.jpg",
      "text": "Positivity"
    },
    {
      "link": "assets/Images/img/Motivation_And_Inspiration/success.jpg",
      "text": "Success"
    },
    {
      "link": "assets/Images/img/Motivation_And_Inspiration/time.jpg",
      "text": "Time"
    },
    {
      "link": "assets/Images/img/Motivation_And_Inspiration/travel.jpg",
      "text": "Travel"
    },
  ],
  "LoveAndRelationship": [
    {
      "link": "assets/Images/img/Love_And_Relationship/best_friend.jpg",
      "text": "Best Friend"
    },
    {
      "link": "assets/Images/img/Love_And_Relationship/deep_love.jpg",
      "text": "Deep Love"
    },
    {
      "link": "assets/Images/img/Love_And_Relationship/falling_in_love.jpg",
      "text": "Falling In Love"
    },
    {
      "link": "assets/Images/img/Love_And_Relationship/flirt.jpg",
      "text": "Flirt"
    },
    {
      "link": "assets/Images/img/Love_And_Relationship/friendship.jpg",
      "text": "Friendship"
    },
    {
      "link": "assets/Images/img/Love_And_Relationship/funny_love.jpg",
      "text": "Funny Love"
    },
    {
      "link": "assets/Images/img/Love_And_Relationship/love.jpg",
      "text": "Love"
    },
    {
      "link": "assets/Images/img/Love_And_Relationship/marriage.jpg",
      "text": "Marriage"
    },
    {
      "link": "assets/Images/img/Love_And_Relationship/one_sided_love.jpg",
      "text": "One Sided Love"
    },
    {
      "link": "assets/Images/img/Love_And_Relationship/relationship.jpg",
      "text": "Relationship"
    },
    {
      "link": "assets/Images/img/Love_And_Relationship/romantic.jpg",
      "text": "Romantic"
    },
    {
      "link": "assets/Images/img/Love_And_Relationship/trust.jpg",
      "text": "Trust"
    },
    {
      "link": "assets/Images/img/Love_And_Relationship/unconditional_love.jpg",
      "text": "Unconditional Love"
    },
  ],
  "HealthAndFitness": [
    {
      "link": "assets/Images/img/Health_And_Fitness/exercise.jpg",
      "text": "Exercise"
    },
    {
      "link": "assets/Images/img/Health_And_Fitness/fitness.jpg",
      "text": "Fitness"
    },
    {"link": "assets/Images/img/Health_And_Fitness/gym.jpg", "text": "Gym"},
    {
      "link": "assets/Images/img/Health_And_Fitness/health.jpg",
      "text": "Health"
    },
    {
      "link": "assets/Images/img/Health_And_Fitness/healthy%20eating.jpg",
      "text": "Healthy Eating"
    },
  ],
  "Entrepreneurship": [
    {
      "link": "assets/Images/img/Entrepreneurship/business.jpg",
      "text": "Business"
    },
    {
      "link": "assets/Images/img/Entrepreneurship/entrepreneur.jpg",
      "text": "Entrepreneur"
    },
    {
      "link": "assets/Images/img/Entrepreneurship/financial_freedom.jpg",
      "text": "Financial Freedom"
    },
    {"link": "assets/Images/img/Entrepreneurship/hustle.jpg", "text": "Hustle"},
    {
      "link": "assets/Images/img/Entrepreneurship/leadership.jpg",
      "text": "Leadership"
    },
    {"link": "assets/Images/img/Entrepreneurship/money.jpg", "text": "Money"},
  ],
};

// Categories Text List

List CategoriesTextList = [
  'Tough Times',
  'Self Development',
  'Religious And Spiritual',
  'Others',
  'Motivation And Inspiration',
  'Love And Relationship',
  'Health And Fitness',
  'Entrepreneurship'
];

// Wallpaper

List themes = [
  {'link': "assets/Images/img/Themes/1.jpg"},
  {'link': "assets/Images/img/Themes/2.jpg"},
  {'link': "assets/Images/img/Themes/3.jpg"},
  {'link': "assets/Images/img/Themes/4.jpg"},
  {'link': "assets/Images/img/Themes/5.jpg"},
  {'link': "assets/Images/img/Themes/6.jpg"},
  {'link': "assets/Images/img/Themes/7.jpg"},
  {'link': "assets/Images/img/Themes/8.jpg"},
  {'link': "assets/Images/img/Themes/9.jpg"},
  {'link': "assets/Images/img/Themes/10.jpg"},
  {'link': "assets/Images/img/Themes/11.jpg"},
  {'link': "assets/Images/img/Themes/12.jpg"},
  {'link': "assets/Images/img/Themes/13.jpg"},
  {'link': "assets/Images/img/Themes/14.jpg"},
  {'link': "assets/Images/img/Themes/15.jpg"},
  {'link': "assets/Images/img/Themes/16.jpg"},
  {'link': "assets/Images/img/Themes/17.jpg"},
  {'link': "assets/Images/img/Themes/18.jpg"},
  {'link': "assets/Images/img/Themes/19.jpg"},
  {'link': "assets/Images/img/Themes/20.jpg"},
  {'link': "assets/Images/img/Themes/21.jpg"},
  {'link': "assets/Images/img/Themes/22.jpg"},
  {'link': "assets/Images/img/Themes/23.jpg"},
  {'link': "assets/Images/img/Themes/24.jpg"},
  {'link': "assets/Images/img/Themes/25.jpg"},
  {'link': "assets/Images/img/Themes/26.jpg"},
  {'link': "assets/Images/img/Themes/27.jpg"},
  {'link': "assets/Images/img/Themes/28.jpg"},
  {'link': "assets/Images/img/Themes/29.jpg"},
  {'link': "assets/Images/img/Themes/30.jpg"},
  {'link': "assets/Images/img/Themes/31.jpg"},
  {'link': "assets/Images/img/Themes/32.jpg"},
  {'link': "assets/Images/img/Themes/33.jpg"},
  {'link': "assets/Images/img/Themes/34.jpg"},
  {'link': "assets/Images/img/Themes/35.jpg"},
  {'link': "assets/Images/img/Themes/36.jpg"},
  {'link': "assets/Images/img/Themes/37.jpg"},
  {'link': "assets/Images/img/Themes/38.jpg"},
  {'link': "assets/Images/img/Themes/39.jpg"},
  {'link': "assets/Images/img/Themes/40.jpg"},
  {'link': "assets/Images/img/Themes/41.jpg"},
  {'link': "assets/Images/img/Themes/42.jpg"},
  {'link': "assets/Images/img/Themes/43.jpg"},
  {'link': "assets/Images/img/Themes/44.jpg"},
  {'link': "assets/Images/img/Themes/45.jpg"},
  {'link': "assets/Images/img/Themes/46.jpg"},
  {'link': "assets/Images/img/Themes/47.jpg"},
  {'link': "assets/Images/img/Themes/48.jpg"},
  {'link': "assets/Images/img/Themes/49.jpg"},
  {'link': "assets/Images/img/Themes/50.jpg"},
  {'link': "assets/Images/img/Themes/51.jpg"},
  {'link': "assets/Images/img/Themes/52.jpg"},
  {'link': "assets/Images/img/Themes/53.jpg"},
  {'link': "assets/Images/img/Themes/54.jpg"},
  {'link': "assets/Images/img/Themes/55.jpg"},
  {'link': "assets/Images/img/Themes/56.jpg"},
  {'link': "assets/Images/img/Themes/57.jpg"},
  {'link': "assets/Images/img/Themes/58.jpg"},
  {'link': "assets/Images/img/Themes/59.jpg"},
  {'link': "assets/Images/img/Themes/60.jpg"},
  {'link': "assets/Images/img/Themes/61.jpg"},
  {'link': "assets/Images/img/Themes/62.jpg"},
  {'link': "assets/Images/img/Themes/63.jpg"},
  {'link': "assets/Images/img/Themes/64.jpg"},
  {'link': "assets/Images/img/Themes/65.jpg"},
  {'link': "assets/Images/img/Themes/66.jpg"},
  {'link': "assets/Images/img/Themes/67.jpg"},
  {'link': "assets/Images/img/Themes/68.jpg"},
  {'link': "assets/Images/img/Themes/69.jpg"},
  {'link': "assets/Images/img/Themes/70.jpg"},
  {'link': "assets/Images/img/Themes/71.jpg"},
  {'link': "assets/Images/img/Themes/72.jpg"},
  {'link': "assets/Images/img/Themes/73.jpg"},
  {'link': "assets/Images/img/Themes/74.jpg"},
  {'link': "assets/Images/img/Themes/75.jpg"},
  {'link': "assets/Images/img/Themes/76.jpg"},
  {'link': "assets/Images/img/Themes/77.jpg"},
  {'link': "assets/Images/img/Themes/78.jpg"},
  {'link': "assets/Images/img/Themes/79.jpg"},
  {'link': "assets/Images/img/Themes/80.jpg"},
  {'link': "assets/Images/img/Themes/81.jpg"},
  {'link': "assets/Images/img/Themes/82.jpg"},
  {'link': "assets/Images/img/Themes/83.jpg"},
  {'link': "assets/Images/img/Themes/84.jpg"},
  {'link': "assets/Images/img/Themes/85.jpg"},
  {'link': "assets/Images/img/Themes/86.jpg"},
  {'link': "assets/Images/img/Themes/87.jpg"},
  {'link': "assets/Images/img/Themes/88.jpg"},
  {'link': "assets/Images/img/Themes/89.jpg"},
  {'link': "assets/Images/img/Themes/90.jpg"},
  {'link': "assets/Images/img/Themes/91.jpg"},
  {'link': "assets/Images/img/Themes/92.jpg"},
  {'link': "assets/Images/img/Themes/93.jpg"},
  {'link': "assets/Images/img/Themes/94.jpg"},
  {'link': "assets/Images/img/Themes/95.jpg"},
  {'link': "assets/Images/img/Themes/96.jpg"},
  {'link': "assets/Images/img/Themes/97.jpg"},
  {'link': "assets/Images/img/Themes/98.jpg"},
  {'link': "assets/Images/img/Themes/99.jpg"},
  {'link': "assets/Images/img/Themes/100.jpg"},
  {'link': "assets/Images/img/Themes/101.jpg"}
];

// Fonts

List fontList = [
  {
    'font': 'f2',
    'fName': 'DM Serif Italic',
  },
  {
    'font': 'f1',
    'fName': 'Caveat',
  },
  {
    'font': 'f3',
    'fName': 'DM Serif',
  },
  {
    'font': 'f4',
    'fName': 'Gwendolyn',
  },
  {
    'font': 'f5',
    'fName': 'Jacquard',
  },
  {
    'font': 'f6',
    'fName': 'Jost Italic',
  },
  {
    'font': 'f7',
    'fName': 'Pacifica',
  },
  {
    'font': 'f8',
    'fName': 'Satisfy',
  },
  {
    'font': 'f9',
    'fName': 'Teko Light',
  },
  {
    'font': 'normal',
    'fName': 'Normal',
  },
];

// Songs

List<String> Songs = [
  "01.mp3",
  "02.mp3",
  "03.mp3",
  "04.mp3",
  "05.mp3",
  "06.mp3",
  "07.mp3",
  "08.mp3",
  "09.mp3",
  "10.mp3",
  "11.mp3",
];

// Variable
var intValue = Random().nextInt(10);

String fontName = 'f1';
String? select =
CategoriesImageList['ToughTimes']?[intValue]['text'].toString();
bool isDark = false;
bool isAuthor = true;
bool isCategory = false;
bool isRandom = true;

// Learn By YouTube

List category = [
  {
    "category": "General",
    "image": 'assets/Images/img/Others/kindness.jpg',
  },
  {
    "category": "Life",
    "image": 'assets/Images/img/Religious_And_Spritual/life.jpg',
  },
  {
    "category": "Love",
    "image": 'assets/Images/img/Love_And_Relationship/love.jpg',
  },
  {
    "category": "Success",
    "image": 'assets/Images/img/Motivation_And_Inspiration/success.jpg',
  },
  {
    "category": "Motivation",
    "image": 'assets/Images/img/Motivation_And_Inspiration/creativity.jpg',
  },
  {
    "category": "Happiness",
    "image": 'assets/Images/img/Self_Development/smile.jpg',
  },
  {
    "category": "Powerful",
    "image": 'assets/Images/img/Love_And_Relationship/trust.jpg',
  },
  {
    "category": "Friendship",
    "image": 'assets/Images/img/Love_And_Relationship/friendship.jpg',
  },
  {
    "category": "Humor",
    "image": 'assets/Images/img/Motivation_And_Inspiration/funny.jpg',
  },
];

QuotesAppController Getx = Get.put(QuotesAppController());

void categoryBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (BuildContext context) {
      return DraggableScrollableSheet(
        initialChildSize: 0.5,
        minChildSize: 0.3,
        maxChildSize: 0.8,
        builder: (BuildContext context, ScrollController scrollController) {
          return Container(
            decoration: BoxDecoration(
              color: Color(0xff1A2946),
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Column(
              children: [
                Container(
                  width: 40,
                  height: 5,
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 5.0, right: 5, top: 5, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(onPressed: () {
                        Get.back();
                      }, icon: Icon(Icons.close)),
                      Text('Category',
                        style: TextStyle(
                            fontFamily: 'f1',
                            letterSpacing: 1,
                            fontWeight: FontWeight.w600,
                            fontSize: 25,
                            color: Colors.white),),
                      IconButton(onPressed: () {
                        Get.back();
                      }, icon: Icon(Icons.done)),
                    ],
                  ),
                ),
                Expanded(
                  child: GridView.builder(
                    controller: scrollController,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 4 / 4,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
                    ),
                    itemCount: category.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          if (category[index]['category'] == "General") {
                            Getx.quotes.value = Getx.mainQuotes;
                            Get.back();
                          } else {
                            Getx.quotes.value = Getx.mainQuotes
                                .where((quote) =>
                            quote.category == category[index]['category'])
                                .toList();
                            Get.back();
                          }
                        },
                        child: Container(
                          width: 200,
                          height: 200,
                          decoration: BoxDecoration(
                            // color: Colors.blue,
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                  image: AssetImage(category[index]['image']),
                                  fit: BoxFit.cover)
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.black45,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            alignment: Alignment.center,
                            child: Text(category[index]['category'],
                              style: TextStyle(
                                  fontFamily: 'f1',
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 1,
                                  fontSize: 22,
                                  color: Colors.white),),
                          ),
                        ),
                      );
                    },
                    padding: EdgeInsets.all(10),
                    physics: BouncingScrollPhysics(),
                  ),
                ),
              ],
            ),
          );
        },
      );
    },
  );
}

void favBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (BuildContext context) {
      return DraggableScrollableSheet(
        initialChildSize: 0.5,
        minChildSize: 0.3,
        maxChildSize: 0.8,
        builder: (BuildContext context, ScrollController scrollController) {
          return Container(
            decoration: BoxDecoration(
              color: Color(0xff1A2946),
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Column(
              children: [
                Container(
                  width: 40,
                  height: 5,
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 5.0, right: 5, top: 5, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(onPressed: () {
                        Get.back();
                      }, icon: Icon(Icons.close)),
                      Text('Favorite',
                        style: TextStyle(
                            fontFamily: 'f1',
                            letterSpacing: 1,
                            fontWeight: FontWeight.w600,
                            fontSize: 25,
                            color: Colors.white),),
                      IconButton(onPressed: () {
                        Get.back();
                      }, icon: Icon(Icons.done)),
                    ],
                  ),
                ),
                Getx.likedQuotes.isEmpty?Lottie.network(
                    'https://lottie.host/f1168197-847e-441b-823f-d2551f20500e/Zkd3fXAqQd.json',width: 300,height: 300):Expanded(
                  child: GridView.builder(
                    controller: scrollController,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 4 / 4,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
                    ),
                    itemCount: Getx.likedQuotes.length,
                    itemBuilder: (context, index) {
                      String category = Getx.likedQuotes[index]
                          .split('-')
                          .sublist(0, 1)
                          .join(' ');
                      String img = Getx.likedQuotes[index]
                          .split('-')
                          .sublist(1, 2)
                          .join(' ');
                      return GestureDetector(
                        onLongPress: () {
                          Getx.likedQuotesRemove(index);
                          Get.back();
                        },
                        onTap: () async {
                          await Getx.readCategoryRecord(category);
                          _favCategoryBottomSheet(context);

                        },
                        child: Container(
                          width: 200,
                          height: 200,
                          decoration: BoxDecoration(
                            // color: Colors.blue,
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                  image: AssetImage(img), fit: BoxFit.cover)
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.black45,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            alignment: Alignment.center,
                            child: Text(category,
                              style: TextStyle(
                                  fontFamily: 'f1',
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 22,
                                  color: Colors.white),),
                          ),
                        ),
                      );
                    },
                    padding: EdgeInsets.all(10),
                    physics: BouncingScrollPhysics(),
                  ),
                ),
              ],
            ),
          );
        },
      );
    },
  );
}

void _favCategoryBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (BuildContext context) {
      return DraggableScrollableSheet(
        initialChildSize: 0.5,
        minChildSize: 0.3,
        maxChildSize: 0.8,
        builder: (BuildContext context, ScrollController scrollController) {
          return Container(
            decoration: BoxDecoration(
              color: Color(0xff1A2946),
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Column(
              children: [
                Container(
                  width: 40,
                  height: 5,
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 5.0, right: 5, top: 5, bottom: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(onPressed: () {
                        Get.back();
                      }, icon: Icon(Icons.close)),
                      Text(Getx.saveCategoryName.toString(),
                        style: TextStyle(
                            fontFamily: 'f1',
                            letterSpacing: 1,
                            fontWeight: FontWeight.w600,
                            fontSize: 25,
                            color: Colors.white),),
                      IconButton(onPressed: () {
                        Get.back();
                      }, icon: Icon(Icons.done)),
                    ],
                  ),
                ),
                Getx.data.isEmpty?Lottie.network(
                    'https://lottie.host/f1168197-847e-441b-823f-d2551f20500e/Zkd3fXAqQd.json',width: 300,height: 300):Expanded(
                  child: GridView.builder(
                    controller: scrollController,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 9 / 16,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
                    ),
                    itemCount: Getx.data.length,
                    itemBuilder: (context, index) {
                      if (index >= Getx.data.length) {
                        return Container();
                      }
                      return GestureDetector(
                        onLongPress: () {
                          Getx.removeRecord(Getx.data[index]['id']);
                          Get.back();
                        },
                        onTap: () {
                          Getx.selectQuote(index);
                          Getx.setTheme(Getx.data[index]['image'], index);
                          Get.to(MakeTheme(), transition: Transition.cupertinoDialog, duration: Duration(milliseconds: 2000));
                        },
                        child: Obx(
                              () => Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                image: AssetImage(Getx.data[index]['image']),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.format_quote_outlined, color: Colors.white),
                                  Text(
                                    Getx.data[index]['quote'],
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 10,
                                      color: Colors.white,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    '- ${Getx.data[index]['author']} -',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 5,
                                      color: Colors.white,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    padding: EdgeInsets.all(10),
                    physics: BouncingScrollPhysics(),
                  ),
                ),
              ],
            ),
          );
        },
      );
    },
  );
}

void modalBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (BuildContext context) {
      return DraggableScrollableSheet(
        initialChildSize: 0.5,
        minChildSize: 0.3,
        maxChildSize: 0.8,
        builder: (BuildContext context, ScrollController scrollController) {
          return Container(
            decoration: BoxDecoration(
              color: Color(0xff1A2946),
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Column(
              children: [
                Container(
                  width: 40,
                  height: 5,
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 5.0, right: 5, top: 5, bottom: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(onPressed: () {
                        Get.back();
                      }, icon: Icon(Icons.close)),
                      Text('Theme',
                        style: TextStyle(
                            fontFamily: 'f1'
                            ,letterSpacing: 1,
                            fontWeight: FontWeight.w600,
                            fontSize: 25,
                            color: Colors.white),),
                      IconButton(onPressed: () {
                        Get.back();
                      }, icon: Icon(Icons.done)),
                    ],
                  ),
                ),

                Expanded(
                  child: GridView.builder(
                    controller: scrollController,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 9 / 16,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
                    ),
                    itemCount: themes.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Getx.setTheme(themes[index]['link']!, index);
                        },
                        child: Obx(
                              () =>
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                    image: AssetImage(themes[index]['link']!),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                child: Getx.themeSelectsIndex == index
                                    ? Container(
                                  decoration: BoxDecoration(
                                      color: Colors.black45,
                                      border: Border.all(
                                          color: Colors.white, width: 2),
                                      borderRadius: BorderRadius.circular(15)),
                                  alignment: Alignment.center,
                                  child: Icon(Icons.done),
                                )
                                    : Container(),
                              ),
                        ),
                      );
                    },
                    padding: EdgeInsets.all(10),
                    physics: BouncingScrollPhysics(),
                  ),
                ),
              ],
            ),
          );
        },
      );
    },
  );
}

void fontBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    showDragHandle: true,
    backgroundColor: Color(0xff1A2946),
    builder: (BuildContext context) {
      return Container(
        height: 400,
        decoration: BoxDecoration(
          color: Color(0xff1A2946),
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Obx(
                    () =>
                    Wrap(
                      children: [
                        ...List.generate(
                            fontList.length,
                                (index) =>
                                GestureDetector(
                                  onTap: () {
                                    Getx.setFontFamily(
                                        fontList[index]['font'], index);
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(
                                        left: 6, right: 6, bottom: 12),
                                    padding: EdgeInsets.only(
                                        top: 8, right: 10, left: 10, bottom: 8),
                                    height: 40,
                                    decoration: BoxDecoration(
                                        color: Getx.selectedFontFamily == index
                                            ? Colors.white
                                            : Colors.transparent,
                                        borderRadius: BorderRadius.circular(
                                            10)),
                                    alignment: Alignment.center,
                                    child: Text(
                                      fontList[index]['fName'],
                                      style: TextStyle(
                                        fontFamily: fontList[index]['font'],
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        color: Getx.selectedFontFamily == index
                                            ? Colors.black
                                            : Colors.white,
                                      ),
                                    ),
                                  ),
                                ))
                      ],
                    ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

void allTaskBottomSheet(BuildContext context) {
  showModalBottomSheet<void>(
    context: context,
    builder: (BuildContext context) {
      return Container(
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color(0xff12213C),

        ),
        child: Center(
            child: Padding(
              padding:
              const EdgeInsets.only(left: 80.0, right: 80, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            showModalBottomSheet<void>(
                                context: context,
                                builder: (BuildContext context) {
                                  return Container(
                                    height: 140,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Color(0xff12213C),

                                    ),
                                    child: Column(
                                      children: [
                                        SizedBox(height: 10,),
                                        TextButton(onPressed: () {
                                          shareLocalOnlyImage();
                                        },
                                          child: Text('Share Image',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 15,
                                                color: Colors.white),),),
                                        Divider(color: Colors.white,),
                                        TextButton(onPressed: () {
                                          shareLocalImage(
                                              Getx.quotes[Getx.selectQuotes.toInt()].quote);
                                        },
                                          child: Text('Share With Text',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 15,
                                                color: Colors.white),),),
                                      ],
                                    ),
                                  );
                                });
                          },
                          icon: Icon(Icons.share)),
                      Text('Share'),
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                          onPressed: () {
                            Clipboard.setData(
                              new ClipboardData(
                                  text: Getx.quotes[Getx.selectQuotes.toInt()].quote),
                            );
                            Navigator.of(context).pop();
                          },
                          icon: Icon(Icons.copy)),
                      Text('Copy'),
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                          onPressed: () {

                            Navigator.of(context).pop();
                            showModalBottomSheet<void>(
                              context: context,
                              builder: (BuildContext context) {
                                return Container(
                                  height: 200,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Color(0xff12213C),

                                  ),
                                  child: Column(
                                    children: [
                                      SizedBox(height: 10,),
                                      TextButton(onPressed: () {
                                        saveLocalImageHD();
                                        Navigator.of(context).pop();
                                      },
                                        child: Text('HD', style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15,
                                            color: Colors.white
                                            ),),),
                                      Divider(color: Colors.white),
                                      TextButton(onPressed: () {
                                        saveLocalImage4k();

                                        Navigator.of(context).pop();
                                      },
                                        child: Text('FHD', style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15,
                                            color: Colors.white
                                          ),),),
                                      Divider(color: Colors.white,),
                                      TextButton(onPressed: () {
                                        saveLocalImage();
                                        Navigator.of(context).pop();
                                      },
                                        child: Text('Normal', style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15,
                                          color: Colors.white
                                            ),),),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                          icon: Icon(Icons.download_rounded)),
                      Text('Download'),
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                          onPressed: () async {
                            captureAndSetWallpaper();
                            Navigator.of(context).pop();
                          },
                          icon: Icon(Icons.wallpaper_rounded)),
                      Text('Wallpaper'),
                    ],
                  ),
                ],
              ),
            )),
      );
    },
  );
}
