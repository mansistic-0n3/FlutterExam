import 'package:flutter/material.dart';

class Multi extends StatefulWidget{
  const Multi ({super.key});

  @override
  State<Multi> createState() => _Multi();
}


class _Multi extends State<Multi> with TickerProviderStateMixin{
  late AnimationController _cntrlFloatUp;
  late AnimationController _cntrlGlowSize;
  late Animation<double> _aniFloatUp;
  late Animation<double> _aniGlowSize;

  @override
  void initState(){
    super.initState();
    _cntrlFloatUp = AnimationController(vsync: this, duration: const Duration(seconds: 6));
    _cntrlGlowSize = AnimationController(vsync: this, duration: const Duration(seconds: 4));
  }

  @override
  void dispose(){
    _cntrlFloatUp.dispose();
    _cntrlGlowSize.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    double _imgHeight = MediaQuery.of(context).size.height/4;
    double _imgWidth = MediaQuery.of(context).size.height/4;
    double _imgbottomLoc = MediaQuery.of(context).size.height-_imgHeight;

    _aniFloatUp = Tween(begin: _imgbottomLoc, end: 0.0).animate(CurvedAnimation(parent: _cntrlFloatUp, curve: Curves.fastOutSlowIn));
    _aniGlowSize = Tween(begin: _imgbottomLoc, end: 0.0).animate(CurvedAnimation(parent: _cntrlGlowSize, curve: const Interval(0.0, 1.0, curve: Curves.elasticInOut)));

    _cntrlFloatUp.forward();
    _cntrlGlowSize.forward();

      return Container(
        color: Colors.white,
        child: AnimatedBuilder(
          animation: _aniFloatUp, 
          builder: (context, child) {
          return Container(
            child: child,
            margin: EdgeInsets.only(top: _aniFloatUp.value),
            width: _aniGlowSize.value,
          );
        },
        child: GestureDetector(
          onTap: () {
            if(_cntrlFloatUp.isCompleted){
              _cntrlFloatUp.reverse();
              _cntrlGlowSize.reverse();
            }else{
              _cntrlFloatUp.forward();
              _cntrlGlowSize.forward();
            }
          },
          child: Image.asset('images/panda.png',
          height: _imgHeight,
          width: _imgWidth,),
        ),
        ),
      );
  }
}

