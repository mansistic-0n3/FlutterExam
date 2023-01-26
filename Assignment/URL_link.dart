import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class urlLink extends StatefulWidget{
  const urlLink ({super.key});

  @override
  State<urlLink> createState() => _urlLink();
}


class _urlLink extends State<urlLink> with SingleTickerProviderStateMixin{
  late AnimationController bottomctrl;
  late Animation heightAni;
  late Animation opacityAni;

  @override
  void initState(){
    super.initState();
    bottomctrl = AnimationController(vsync: this, duration: const Duration(milliseconds: 500));
    heightAni = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: bottomctrl, curve: const Interval(0.0,0.3, curve:Curves.easeInCirc))
    );
    opacityAni = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: bottomctrl, curve:const Interval(0.6,1.0, curve:Curves.slowMiddle))
    );
  }

  @override
  void dispose(){
    super.dispose();
    bottomctrl.dispose();
  }

  @override
  Widget build(BuildContext context){
      return 
      MaterialApp(
        debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFEECCAA),
          title: const Text('URL and Animation',style: TextStyle(color: Colors.black),),
        ),
       body:
       GestureDetector(
        onTap: _toggleBottomSheet,
        child: LayoutBuilder(
          builder: (context, constraints)=> AnimatedBuilder(
            animation: bottomctrl, 
            builder: (
              (context, child) => Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                Container(
                  color: const Color.fromARGB(255, 189, 83, 110),
                  child: Padding(
                    padding: const EdgeInsets.only(top:148.0),
                    child: Container(
                      alignment: Alignment.topCenter,
                      child: const Text('Tap to know \nME !',
                      style: TextStyle(
                        fontSize: 60,
                        fontStyle: FontStyle.italic,
                        color: Color(0xFFEECCAA)
                      ),
                      textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  height: _bottomSheetHeight(constraints),
                  color: const Color(0xFFEECCAA),
                  child: Opacity(
                    opacity: _labelOpacity(),
                    child: Center(
                      child: ElevatedButton(
                        style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(Color.fromARGB(7, 40, 44, 52)),
                        ),
                          child: Image.network('https://media-cldnry.s-nbcnews.com/image/upload/t_nbcnews-fp-1200-630,f_auto,q_auto:best/streams/2013/March/130326/1C6639340-google-logo.jpg'),
                        // child: Image.network('https://mansi-portfolio.vercel.app/static/media/me.8491cf3fa9ed720c26c9.png'),
                        onPressed: () async{
                          //String url = "https://mansi-portfolio.vercel.app/";
                          String url ='https://www.google.com/';
                          var urlLaunchable = await canLaunch(url);
                          if(urlLaunchable){
                            await launch(url);
                          }else{
                            print("URL can't be launched!");
                          }
                        },
                        ),
                    ),),
                )
              ],
            ))
            )),
       ),
      ),
      );
  }

  _bottomSheetHeight(BoxConstraints constraints){
    return constraints.maxHeight/2*heightAni.value;
  }

  _labelOpacity(){
    return opacityAni.value;
  }

  _toggleBottomSheet(){
    if(!bottomctrl.isAnimating){
      if(bottomctrl.isDismissed){
        bottomctrl.forward();
      }else{
        bottomctrl.reverse();
      }
    }
  }

}