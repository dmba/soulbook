import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:mobile/src/pages/routes.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _IntroPageState();
  }
}

class _IntroPageState extends State<IntroPage> {
  List<Slide> slides = new List();

  @override
  void initState() {
    super.initState();

    slides.add(
      new Slide(
        title: "SOULBOOK",
        description: "Территория твоей души",
        styleDescription: TextStyle(fontSize: 32, color: Colors.white),
        backgroundColor: const Color(0xfff5a623),
      ),
    );
    slides.add(
      new Slide(
        description:
            "Вы держите книгу, которая станет Вашей лич- ной территорией для души. Вы сможете ближе познакомиться с собой, разобраться, где Ваши мысли и желания, а где навязанные извне." +
                "Вы сможете получить ресурс и поддержку, а также знания, которые помогут укрепить веру в себя, свои силы и возможности." +
                "Не бойтесь записывать сюда самые дерзкие мечты. Будьте откровенны и честны с собой.",
        styleDescription: TextStyle(fontSize: 24, color: Colors.white),
        backgroundColor: Colors.lightBlue,
      ),
    );
    slides.add(
      new Slide(
          description: "Твори свою жизнь!" + "Живи творчески!",
          styleDescription: TextStyle(fontSize: 32, color: Colors.white),
          backgroundColor: Colors.purpleAccent),
    );
  }

  onDonePress(BuildContext ctx) => () {
        Navigator.of(ctx).pushReplacementNamed(LOGIN);
      };

  onSkipPress(BuildContext ctx) => () {
        Navigator.of(ctx).pushReplacementNamed(LOGIN);
      };

  @override
  Widget build(BuildContext context) {
    return new IntroSlider(
      slides: this.slides,
      onDonePress: this.onDonePress(context),
      onSkipPress: this.onSkipPress(context),
    );
  }
}
